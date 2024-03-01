import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_business_trip_details.dart';

part 'remote_get_business_trip_details.g.dart';

@JsonSerializable()
class RemoteGetBusinessTripDetails {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "businessTripTypeId")
  final int? businessTripTypeId;
  @JsonKey(name: "departureDate")
  final String? departureDate;
  @JsonKey(name: "returnDate")
  final String? returnDate;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "expectedResumeDutyDate")
  final String? expectedResumeDutyDate;
  @JsonKey(name: "isByPayroll")
  final bool? isByPayroll;
  @JsonKey(name: "paymentMethodId")
  final int? paymentMethodId;
  @JsonKey(name: "tripPurpose")
  final String? tripPurpose;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "tripTotalAmount")
  final int? tripTotalAmount;
  @JsonKey(name: "tripCashAdvancedPayment")
  final int? tripCashAdvancedPayment;
  @JsonKey(name: "tripRemainingAmount")
  final int? tripRemainingAmount;
  @JsonKey(name: "totalAmount")
  final int? totalAmount;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "noOfDigits")
  final int? noOfDigits;
  @JsonKey(name: "currencyCode")
  final String? currencyCode;
  @JsonKey(name: "employeeDto")
  final EmployeeDto? employeeDto;

  const RemoteGetBusinessTripDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.businessTripTypeId,
    this.departureDate,
    this.returnDate,
    this.duration,
    this.expectedResumeDutyDate,
    this.isByPayroll,
    this.paymentMethodId,
    this.tripPurpose,
    this.remarks,
    this.tripTotalAmount,
    this.tripCashAdvancedPayment,
    this.tripRemainingAmount,
    this.totalAmount,
    this.transactionStatusId,
    this.transactionStatusName,
    this.noOfDigits,
    this.currencyCode,
    this.employeeDto,
  });

  factory RemoteGetBusinessTripDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetBusinessTripDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetBusinessTripDetailsToJson(this);
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

  const EmployeeDto({
    this.id,
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
  });

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
      positionName:  "",
      gradeId: gradeId ?? 0,
      levelId: levelId ?? 0,
      joiningDate: joiningDate ?? "",
      employeeStatusId: employeeStatusId ?? 0,
    );
  }
}

extension RemoteGetBusinessTripDetailsExtension
    on RemoteGetBusinessTripDetails {
  GetBusinessTripDetails mapToGetBusinessTripDetailsDomain() {
    return GetBusinessTripDetails(
      id: id ?? 0,
      companyId: companyId ?? 0,
      employeeId: employeeId ?? 0,
      businessTripTypeId: businessTripTypeId ?? 0,
      departureDate: departureDate ?? "",
      returnDate: returnDate ?? "",
      duration: duration ?? 0,
      expectedResumeDutyDate: expectedResumeDutyDate ?? "",
      isByPayroll: isByPayroll ?? false,
      paymentMethodId: paymentMethodId ?? 0,
      tripPurpose: tripPurpose ?? "",
      remarks: remarks ?? "",
      tripTotalAmount: tripTotalAmount ?? 0,
      tripCashAdvancedPayment: tripCashAdvancedPayment ?? 0,
      tripRemainingAmount: tripRemainingAmount ?? 0,
      totalAmount: totalAmount ?? 0,
      transactionStatusId: transactionStatusId ?? 0,
      transactionStatusName: transactionStatusName ?? "",
      noOfDigits: noOfDigits ?? 0,
      currencyCode: currencyCode ?? "",
      employee: employeeDto?.mapToDomain(),
    );
  }
}
