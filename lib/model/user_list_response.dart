import 'package:impacteers_screening_test/constants/constant_params.dart';

class UserListResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDetails>? userDetails;
  Support? support;

  UserListResponse(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.userDetails,
        this.support});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    page = json[ConstantParams.page] ?? 0;
    perPage = json[ConstantParams.perPage] ?? 0;
    total = json[ConstantParams.total] ?? 0;
    totalPages = json[ConstantParams.totalPages] ?? 0;
    userDetails = json[ConstantParams.data] != null
        ? List<UserDetails>.from(json[ConstantParams.data]
        .map((x) => UserDetails.fromJson(x)))
        : [];
    support = json[ConstantParams.support] != null ? Support.fromJson(json[ConstantParams.support]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantParams.page] = page;
    data[ConstantParams.perPage] = perPage;
    data[ConstantParams.total] = total;
    data[ConstantParams.totalPages] = totalPages;
    data[ConstantParams.data] = userDetails?.map((v) => v.toJson()).toList();
    data[ConstantParams.support] = support?.toJson();
    return data;
  }
}

class UserDetails {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetails({this.id, this.email, this.firstName, this.lastName, this.avatar});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json[ConstantParams.id] ?? 0;
    email = json[ConstantParams.email] ?? "";
    firstName = json[ConstantParams.firstName] ?? "";
    lastName = json[ConstantParams.lastName] ?? "";
    avatar = json[ConstantParams.avatar] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantParams.id] = id;
    data[ConstantParams.email] = email;
    data[ConstantParams.firstName] = firstName;
    data[ConstantParams.lastName] = lastName;
    data[ConstantParams.avatar] = avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json[ConstantParams.url] ?? "";
    text = json[ConstantParams.text] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantParams.url] = url;
    data[ConstantParams.text] = text;
    return data;
  }
}
