import 'package:impacteers_screening_test/constants/constant_params.dart';
import 'package:impacteers_screening_test/model/user_list_response.dart';

class UserDetailsResponse {
  UserDetails? data;
  Support? support;

  UserDetailsResponse({this.data, this.support});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json[ConstantParams.data] != null ? UserDetails.fromJson(json[ConstantParams.data]) : null;
    support = json[ConstantParams.support] != null ? Support.fromJson(json[ConstantParams.support]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantParams.data] =this.data?.toJson();
    data[ConstantParams.support] = support?.toJson();
    return data;
  }
}

