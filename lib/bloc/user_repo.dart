import 'package:impacteers_screening_test/model/user_details_response.dart';
import 'package:impacteers_screening_test/model/user_list_response.dart';
import 'package:impacteers_screening_test/service/api_service.dart';

abstract class UserRepo{
  Future<UserListResponse> fetchUserList(String path,dynamic query);
  Future<UserDetailsResponse> fetchUserDetails(String path);
}

class UserRepoService extends UserRepo{
  @override
  Future<UserListResponse> fetchUserList(String path,dynamic query) async{
    var response = await ApiService().get(path,body: query);
    UserListResponse userDetailsResponse = UserListResponse.fromJson(response);
    return userDetailsResponse;
  }

  @override
  Future<UserDetailsResponse> fetchUserDetails(String path) async{
    var response = await ApiService().get(path);
    UserDetailsResponse userDetailsResponse = UserDetailsResponse.fromJson(response);
    return userDetailsResponse;
  }

}