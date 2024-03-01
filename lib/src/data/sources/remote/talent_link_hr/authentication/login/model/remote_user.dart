import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/user/user.dart';

part 'remote_user.g.dart';

@JsonSerializable()
class RemoteUser {
  @JsonKey(name: 'userId')
  final int? userId;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'employeeId')
  final int? employeeId;
  @JsonKey(name: 'employeeName')
  final String? employeeName;
  @JsonKey(name: 'positionName')
  final String? positionName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'companyId')
  final int? companyId;
  @JsonKey(name: 'companyName')
  final String? companyName;
  @JsonKey(name: 'companyLogo')
  final String? companyLogo;
  @JsonKey(name: 'contactNo')
  final String? contactNo;
  @JsonKey(name: 'joiningDate')
  final String? joiningDate;
  @JsonKey(name: 'fingerPrintNo')
  final String? fingerPrintNo;
  @JsonKey(name: 'mobileImageFilePath')
  final String? mobileImageFilePath;
  @JsonKey(name: 'userTypeId')
  final int? userTypeId;
  @JsonKey(name: 'noOfDigits')
  final int? noOfDigits;
  @JsonKey(name: "totalAllowances")
  final int? totalAllowance;
  @JsonKey(name: "basicSalary")
  final int? basicSalary;
  @JsonKey(name: "subscriberId")
  final int? subscriberId;

  RemoteUser(
      {this.userId,
      this.username,
      this.employeeId,
      this.employeeName,
      this.positionName,
      this.email,
      this.companyId,
      this.companyName,
      this.companyLogo,
      this.contactNo,
      this.joiningDate,
      this.fingerPrintNo,
      this.mobileImageFilePath,
      this.userTypeId,
      this.noOfDigits,
      this.totalAllowance,
      this.basicSalary,this.subscriberId});

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}

extension RemoteUserExtension on RemoteUser {
  User mapToDomain() {
    return User(
        companyId: companyId ?? 0,
        companyName: companyName ?? "",
        companyLogo: companyLogo ?? "",
        contactNo: contactNo ?? "",
        email: email ?? "",
        employeeId: employeeId ?? 0,
        employeeName: employeeName ?? "",
        fingerPrintNo: fingerPrintNo ?? "",
        joiningDate: joiningDate ?? "",
        userId: userId ?? 0,
        mobileImageFilePath: mobileImageFilePath ?? "",
        noOfDigits: noOfDigits ?? 0,
        positionName: positionName ?? "",
        userTypeId: userTypeId ?? 0,
        username: username ?? "",
        baseSalary: basicSalary ?? 0,
        totalAllowance: totalAllowance ?? 0, subscriberId: subscriberId??0);
  }
}
