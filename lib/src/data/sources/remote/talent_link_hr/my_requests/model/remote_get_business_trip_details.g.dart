// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_business_trip_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetBusinessTripDetails _$RemoteGetBusinessTripDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteGetBusinessTripDetails(
      id: json['id'] as int?,
      companyId: json['companyId'] as int?,
      employeeId: json['employeeId'] as int?,
      businessTripTypeId: json['businessTripTypeId'] as int?,
      departureDate: json['departureDate'] as String?,
      returnDate: json['returnDate'] as String?,
      duration: json['duration'] as int?,
      expectedResumeDutyDate: json['expectedResumeDutyDate'] as String?,
      isByPayroll: json['isByPayroll'] as bool?,
      paymentMethodId: json['paymentMethodId'] as int?,
      tripPurpose: json['tripPurpose'] as String?,
      remarks: json['remarks'] as String?,
      tripTotalAmount: json['tripTotalAmount'] as int?,
      tripCashAdvancedPayment: json['tripCashAdvancedPayment'] as int?,
      tripRemainingAmount: json['tripRemainingAmount'] as int?,
      totalAmount: json['totalAmount'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
      transactionStatusName: json['transactionStatusName'] as String?,
      noOfDigits: json['noOfDigits'] as int?,
      currencyCode: json['currencyCode'] as String?,
      employeeDto: json['employeeDto'] == null
          ? null
          : EmployeeDto.fromJson(json['employeeDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteGetBusinessTripDetailsToJson(
        RemoteGetBusinessTripDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'businessTripTypeId': instance.businessTripTypeId,
      'departureDate': instance.departureDate,
      'returnDate': instance.returnDate,
      'duration': instance.duration,
      'expectedResumeDutyDate': instance.expectedResumeDutyDate,
      'isByPayroll': instance.isByPayroll,
      'paymentMethodId': instance.paymentMethodId,
      'tripPurpose': instance.tripPurpose,
      'remarks': instance.remarks,
      'tripTotalAmount': instance.tripTotalAmount,
      'tripCashAdvancedPayment': instance.tripCashAdvancedPayment,
      'tripRemainingAmount': instance.tripRemainingAmount,
      'totalAmount': instance.totalAmount,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'noOfDigits': instance.noOfDigits,
      'currencyCode': instance.currencyCode,
      'employeeDto': instance.employeeDto,
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
    };
