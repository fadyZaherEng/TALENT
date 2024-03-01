import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';

part 'remote_get_profile_employee.g.dart';

@JsonSerializable()
class RemoteGetProfileEmployee {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "positionName")
  final String? positionName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "companyName")
  final String? companyName;
  @JsonKey(name: "companyLogo")
  final String? companyLogo;
  @JsonKey(name: "contactNo")
  final String? contactNo;
  @JsonKey(name: "joiningDate")
  final String? joiningDate;
  @JsonKey(name: "fingerPrintNo")
  final String? fingerPrintNo;
  @JsonKey(name: "mobileImageFilePath")
  final String? mobileImageFilePath;
  @JsonKey(name: "userTypeId")
  final int? userTypeId;
  @JsonKey(name: "noOfDigits")
  final int? noOfDigits;
  @JsonKey(name: "basicSalary")
  final int? basicSalary;
  @JsonKey(name: "totalAllowances")
  final int? totalAllowances;
  @JsonKey(name: "grossSalary")
  final int? grossSalary;
  @JsonKey(name: "employeeNo")
  final String? employeeNo;
  @JsonKey(name: "nationalityId")
  final int? nationalityId;
  @JsonKey(name: "nationality")
  final String? nationality;
  @JsonKey(name: "birthDate")
  final String? birthDate;
  @JsonKey(name: "civilId")
  final String? civilId;
  @JsonKey(name: "levelId")
  final int? levelId;
  @JsonKey(name: "level")
  final String? level;
  @JsonKey(name: "directManagerId")
  final int? directManagerId;
  @JsonKey(name: "directManager")
  final String? directManager;
  @JsonKey(name: "residencyIssueDate")
  final String? residencyIssueDate;
  @JsonKey(name: "residencyExpiryDate")
  final String? residencyExpiryDate;

  const RemoteGetProfileEmployee({
    this.userId,
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
    this.basicSalary,
    this.totalAllowances,
    this.grossSalary,
    this.employeeNo,
    this.nationalityId,
    this.nationality,
    this.birthDate,
    this.civilId,
    this.levelId,
    this.level,
    this.directManagerId,
    this.directManager,
    this.residencyIssueDate,
    this.residencyExpiryDate,
  });

  factory RemoteGetProfileEmployee.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetProfileEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetProfileEmployeeToJson(this);
}

extension RemoteGetProfileEmployeeExtension on RemoteGetProfileEmployee {
  ProfileEmployee mapToDomain() {
    return ProfileEmployee(
      userId: userId ?? 0,
      username: username ?? "",
      employeeId: employeeId ?? 0,
      employeeName: employeeName ?? "",
      positionName: positionName ?? "",
      email: email ?? "",
      companyId: companyId ?? 0,
      companyName: companyName ?? "",
      companyLogo: companyLogo ?? "",
      contactNo: contactNo ?? "",
      joiningDate: joiningDate ?? "",
      fingerPrintNo: fingerPrintNo ?? "",
      mobileImageFilePath: mobileImageFilePath ?? "",
      userTypeId: userTypeId ?? 0,
      noOfDigits: noOfDigits ?? 0,
      basicSalary: basicSalary ?? 0,
      totalAllowances: totalAllowances ?? 0,
      grossSalary: grossSalary ?? 0,
      employeeNo: employeeNo ?? "",
      nationalityId: nationalityId ?? 0,
      nationality: nationality ?? "",
      birthDate: birthDate ?? "",
      civilId: civilId ?? "",
      levelId: levelId ?? 0,
      level: level ?? "",
      directManagerId: directManagerId ?? 0,
      directManager: directManager ?? "",
      residencyIssueDate: residencyIssueDate ?? "",
      residencyExpiryDate: residencyExpiryDate ?? "",
    );
  }
}
