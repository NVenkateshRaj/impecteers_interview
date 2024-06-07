import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impacteers_screening_test/bloc/user_events.dart';
import 'package:impacteers_screening_test/bloc/user_repo.dart';
import 'package:impacteers_screening_test/bloc/user_state.dart';
import 'package:impacteers_screening_test/constants/endpoints.dart';

class UserBloc extends Bloc<UserEvents,UserState>{
  final UserRepo userRepo;
  bool isLoading = false;
  String userId = "";
  int page = 0;
  UserBloc({required this.userRepo}):super(UserInitState()){
    on((event,emit)async{
      if(event == UserEvents.fetchUserList){
        await fetchUserList(emit);
      }else if(event == UserEvents.fetchUserDetails){
        await fetchUserDetails(emit);
      }
    });
  }


  fetchUserList(Emitter<UserState> emit)async{
    isLoading = true;
    emit(UserLoadingState());
    String subUrl = EndPointsUrl.api+EndPointsUrl.users;
    Map<String,dynamic> queryParams = {EndPointsUrl.page:page,EndPointsUrl.perPage:10};
    var response = await userRepo.fetchUserList(subUrl, queryParams);
    isLoading = false;
    emit(UserErrorState());
    emit(UserListState(userListResponse: response));
  }

  fetchUserDetails(Emitter<UserState> emit)async{
    isLoading = true;
    emit(UserLoadingState());
    String subUrl = "${EndPointsUrl.api}${EndPointsUrl.users}/$userId";
    var response = await userRepo.fetchUserDetails(subUrl);
    isLoading = false;
    emit(UserErrorState());
    emit(UserDetailsState(userDetailsResponse: response));
  }

}