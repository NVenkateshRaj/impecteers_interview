import 'package:equatable/equatable.dart';
import 'package:impacteers_screening_test/model/user_details_response.dart';
import 'package:impacteers_screening_test/model/user_list_response.dart';

abstract class UserState extends Equatable{
  @override
  List<Object?> get props => [];
}

class UserInitState extends UserState{}

class UserLoadingState extends UserState{}

class UserErrorState extends UserState{}

class UserListState extends UserState{
  final UserListResponse userListResponse;
  UserListState({required this.userListResponse});
}

class UserDetailsState extends UserState{
  final UserDetailsResponse userDetailsResponse;
  UserDetailsState({required this.userDetailsResponse});
}