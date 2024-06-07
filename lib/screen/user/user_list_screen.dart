import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:impacteers_screening_test/bloc/user_bloc.dart';
import 'package:impacteers_screening_test/bloc/user_events.dart';
import 'package:impacteers_screening_test/bloc/user_state.dart';
import 'package:impacteers_screening_test/constants/colors.dart';
import 'package:impacteers_screening_test/constants/constant_params.dart';
import 'package:impacteers_screening_test/model/user_list_response.dart';
import 'package:impacteers_screening_test/screen/user/user_details_screen.dart';
import 'package:impacteers_screening_test/constants/styles.dart';
import 'package:impacteers_screening_test/widgets/user_details_card.dart';

class UserListScreen extends StatefulWidget{
  const UserListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserListState();
  }

}

class _UserListState extends State<UserListScreen>{

  UserBloc? userBloc;
  UserListResponse? userListResponse;
  List<UserDetails> userDetails = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    fetchApiCall(1);
    _scrollController.addListener(() {
      _scrollListener();
    });
  }

  fetchApiCall(int pageNumber){
    userBloc!
      ..page = pageNumber
      ..add(UserEvents.fetchUserList);
  }

  _scrollListener(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      userBloc!.page != userListResponse!.totalPages!
          && userBloc!.page < userListResponse!.totalPages!
          ? fetchApiCall(userBloc!.page + 1) : null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserBloc,UserState>(builder: (BuildContext context,UserState state){
      if(state is UserListState){
        userListResponse = state.userListResponse;
        if( (userListResponse?.userDetails?? []).isNotEmpty){
          userDetails.addAll(userListResponse!.userDetails!);
        }
      }
      return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          title:  Text(ConstantParams.home,style: Styles().headBoldTextStyle(),),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                itemCount: userDetails.length,
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 20.h),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return UserDetailsScreen(userId: userDetails[index].id!.toString(),);
                              }
                          )
                      );
                    },
                      child: UserCardDetails(userDetails: userDetails[index],)
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return  Padding(padding: EdgeInsets.only(top: 5.h));
              },
              ),
              userBloc!.isLoading ? const  Center(
                child: CircularProgressIndicator(),
              ) : Container()
            ],
          ),
        ),
      );
    }
    );
  }

}

