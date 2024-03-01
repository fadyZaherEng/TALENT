// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_air_ticket_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetAirTicketDetails _$RemoteGetAirTicketDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetAirTicketDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      requestedDate: json['requestedDate'] as String?,
      airTicketDueMonth: json['airTicketDueMonth'] as int?,
      airTicketDueYear: json['airTicketDueYear'] as int?,
      isCalculateByServiceDays: json['isCalculateByServiceDays'] as bool?,
      serviceDays: json['serviceDays'] as int?,
      ticketOriginalAmount: json['ticketOriginalAmount'] as int?,
      ticketAmount: json['ticketAmount'] as int?,
      isByPayroll: json['isByPayroll'] as bool?,
      paymentMethodId: json['paymentMethodId'] as int?,
      distinationId: json['distinationId'] as int?,
      flightClassTypeId: json['flightClassTypeId'] as int?,
      flightDirctionTypeId: json['flightDirctionTypeId'] as int?,
      remarks: json['remarks'] as String?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      noOfDigits: json['noOfDigits'] as int?,
      currencyCode: json['currencyCode'] as String?,
      employee: json['employee'] == null
          ? null
          : EmployeeDto.fromJson(json['employee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteGetAirTicketDetailsToJson(
        RemoteGetAirTicketDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'requestedDate': instance.requestedDate,
      'airTicketDueMonth': instance.airTicketDueMonth,
      'airTicketDueYear': instance.airTicketDueYear,
      'isCalculateByServiceDays': instance.isCalculateByServiceDays,
      'serviceDays': instance.serviceDays,
      'ticketOriginalAmount': instance.ticketOriginalAmount,
      'ticketAmount': instance.ticketAmount,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'distinationId': instance.distinationId,
      'flightClassTypeId': instance.flightClassTypeId,
      'flightDirctionTypeId': instance.flightDirctionTypeId,
      'remarks': instance.remarks,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'noOfDigits': instance.noOfDigits,
      'currencyCode': instance.currencyCode,
      'employee': instance.employee,
    };

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => EmployeeDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      firstName: json['firstName'] as String?,
      secondName: json['secondName'] as String?,
      thirdName: json['thirdName'] as String?,
      basicSalary: json['basicSalary'] as int?,
      gosiSalary: json['gosiSalary'] as int?,
      positionId: json['positionId'] as int?,
      gradeId: json['gradeId'] as int?,
      levelId: json['levelId'] as int?,
      joiningDate: json['joiningDate'] as String?,
      employeeStatusId: json['employeeStatusId'] as int?,
      positionName: json['positionName'] as String?,
    );

Map<String, dynamic> _$EmployeeDtoToJson(EmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'thirdName': instance.thirdName,
      'basicSalary': instance.basicSalary,
      'gosiSalary': instance.gosiSalary,
      'positionId': instance.positionId,
      'gradeId': instance.gradeId,
      'levelId': instance.levelId,
      'joiningDate': instance.joiningDate,
      'employeeStatusId': instance.employeeStatusId,
      'positionName': instance.positionName,
    };
