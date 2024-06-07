import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:impacteers_screening_test/bloc/user_bloc.dart';
import 'package:impacteers_screening_test/bloc/user_events.dart';
import 'package:impacteers_screening_test/bloc/user_state.dart';
import 'package:impacteers_screening_test/constants/colors.dart';
import 'package:impacteers_screening_test/constants/constant_params.dart';
import 'package:impacteers_screening_test/model/user_details_response.dart';
import 'package:impacteers_screening_test/model/user_list_response.dart';
import 'package:impacteers_screening_test/constants/styles.dart';
import 'package:impacteers_screening_test/widgets/utils.dart';


class UserDetailsScreen extends StatefulWidget{
  final String userId;
  const UserDetailsScreen({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() {
    return _UserDetailsState();
  }

}

class _UserDetailsState extends State<UserDetailsScreen> with TickerProviderStateMixin{

  UserBloc? userBloc;
  UserDetailsResponse? userDetailsResponse;
  UserDetails? userDetails;
  Support? support;
  AnimationController? animationController;
  AnimationController? fadeAnimationController;
  Animation<double>? animation;
  Animation<double>? fadeAnimation;

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    userBloc!
      ..userId = widget.userId
      ..add(UserEvents.fetchUserDetails);
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    fadeAnimationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: animationController!, curve: Curves.easeIn);
    fadeAnimation = Tween(begin: 0.0,end: 1.0).animate(fadeAnimationController!);
    animationController!.repeat();
    fadeAnimationController!.forward();
  }



  @override
  void dispose() {
    animationController!.dispose();
    fadeAnimationController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserBloc,UserState>(builder: (BuildContext context,UserState state){

      if(state is UserDetailsState){
       if(state.userDetailsResponse.data!=null){
         userDetailsResponse = state.userDetailsResponse;
         userDetails = userDetailsResponse!.data!;
         support = userDetailsResponse!.support!;
       }
      }

      return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          title: Text(ConstantParams.details,style: Styles().headBoldTextStyle(),),
        ),
        body: userBloc!.isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : SingleChildScrollView(
          padding: EdgeInsets.all(10.w),
          child:  userDetails!=null && support!= null ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius. circular(300.0),
                      child: RotationTransition(
                        turns: animation!,
                        child: Image.network(
                          userDetails!.avatar!,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text("${userDetails!.firstName!} ${userDetails!.lastName!.upperCase()}",style: Styles().headBoldTextStyle(fontSize: 22),),
                    Text(userDetails!.email!,style: Styles().semiBoldTextStyle(fontSize: 16),),
                    SizedBox(height: 10.h,),
                  ],
                )
              ),
              FadeTransition(
                opacity: fadeAnimation!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(support!.text!,style: Styles().regularTextStyle(fontSize: 14),),
                    SizedBox(height: 10.h,),
                    Text(support!.url!,style: Styles().regularTextStyle(fontSize: 14),),
                  ],
                )
              ),
            ],
          ) : Container(),
        ),
      );
    }
    );
  }
}


