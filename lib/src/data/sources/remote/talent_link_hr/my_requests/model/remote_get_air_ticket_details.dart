import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/git_air_ticket_details.dart';

part 'remote_get_air_ticket_details.g.dart';

@JsonSerializable()
class RemoteGetAirTicketDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "requestedDate")
  final String? requestedDate;
  @JsonKey(name: "airTicketDueMonth")
  final int? airTicketDueMonth;
  @JsonKey(name: "airTicketDueYear")
  final int? airTicketDueYear;
  @JsonKey(name: "isCalculateByServiceDays")
  final bool? isCalculateByServiceDays;
  @JsonKey(name: "serviceDays")
  final int? serviceDays;
  @JsonKey(name: "ticketOriginalAmount")
  final int? ticketOriginalAmount;
  @JsonKey(name: "ticketAmount")
  final int? ticketAmount;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "distinationId")
  final int? distinationId;
  @JsonKey(name: "flightClassTypeId")
  final int? flightClassTypeId;
  @JsonKey(name: "flightDirctionTypeId")
  final int? flightDirctionTypeId;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "noOfDigits")
  final int? noOfDigits;
  @JsonKey(name: "currencyCode")
  final String? currencyCode;
  @JsonKey(name: "employee")
  final EmployeeDto? employee;

  const RemoteGetAirTicketDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.requestedDate,
    this.airTicketDueMonth,
    this.airTicketDueYear,
    this.isCalculateByServiceDays,
    this.serviceDays,
    this.ticketOriginalAmount,
    this.ticketAmount,
    this.isByPayroll,
    this.paymentMethodId,
    this.distinationId,
    this.flightClassTypeId,
    this.flightDirctionTypeId,
    this.remarks,
    this.transactionStatusId,
    this.transactionStatusName,
    this.noOfDigits,
    this.currencyCode,
    this.employee,
  });

  factory RemoteGetAirTicketDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetAirTicketDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetAirTicketDetailsToJson(this);
}

@JsonSerializable()
class EmployeeDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "secondName")
  final String? secondName;
  @JsonKey(name: "thirdName")
  final String? thirdName;
  @JsonKey(name: "basicSalary")
  final int? basicSalary;
  @JsonKey(name: "gosiSalary")
  final int? gosiSalary;
  @JsonKey(name: "positionId")
  final int? positionId;
  @JsonKey(name: "gradeId")
  final int? gradeId;
  @JsonKey(name: "levelId")
  final int? levelId;
  @JsonKey(name: "joiningDate")
  final String? joiningDate;
  @JsonKey(name: "employeeStatusId")
  final int? employeeStatusId;
  @JsonKey(name: "positionName")
  final String? positionName;

  const EmployeeDto(
      {this.id,
      this.name,
      this.firstName,
      this.secondName,
      this.thirdName,
      this.basicSalary,
      this.gosiSalary,
      this.positionId,
      this.gradeId,
      this.levelId,
      this.joiningDate,
      this.employeeStatusId,
      this.positionName});

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);
}

extension RemoteEmployeeDtoExtension on EmployeeDto {
  Employee mapToDomain() {
    return Employee(
      id: id ?? 0,
      name: name ?? "",
      firstName: firstName ?? "",
      secondName: secondName ?? "",
      thirdName: thirdName ?? "",
      basicSalary: basicSalary ?? 0,
      gosiSalary: gosiSalary ?? 0,
      positionName: positionName ?? "",
      gradeId: gradeId ?? 0,
      levelId: levelId ?? 0,
      joiningDate: joiningDate ?? "",
      employeeStatusId: employeeStatusId ?? 0,
    );
  }
}

extension RemoteGetAirTicketDetailsExtension on RemoteGetAirTicketDetails {
  GetAirTicketDetails mapToGetAirTicketDetailsDomain() {
    return GetAirTicketDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      requestedDate: requestedDate ?? "",
      airTicketDueMonth: airTicketDueMonth ?? 0,
      airTicketDueYear: airTicketDueYear ?? 0,
      isCalculateByServiceDays: isCalculateByServiceDays ?? false,
      serviceDays: serviceDays ?? 0,
      ticketOriginalAmount: ticketOriginalAmount ?? 0,
      ticketAmount: ticketAmount ?? 0,
      isByPayroll: isByPayroll ?? false,
      paymentMethodId: paymentMethodId ?? 0,
      distinationId: distinationId ?? 0,
      flightClassTypeId: flightClassTypeId ?? 0,
      flightDirctionTypeId: flightDirctionTypeId ?? 0,
      remarks: remarks ?? "",
      transactionStatusId: transactionStatusId ?? 0,
      transactionStatusName: transactionStatusName ?? "",
      noOfDigits: noOfDigits ?? 0,
      currencyCode: currencyCode ?? "",
      employee: employee?.mapToDomain(),
    );
  }
}
