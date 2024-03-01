// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_air_ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertAirTicketRequest _$InsertAirTicketRequestFromJson(
        Map<String, dynamic> json) =>
    InsertAirTicketRequest(
      companyId: json['companyId'] as int,
      employeeId: json['employeeId'] as int,
      requestedDate: json['requestedDate'] as String,
      airTicketDueMonth: json['airTicketDueMonth'] as int,
      airTicketDueYear: json['airTicketDueYear'] as int,
      isCalculateByServiceDays: json['isCalculateByServiceDays'] as int,
      serviceDays: json['serviceDays'] as int,
      ticketOriginalAmount: (json['ticketOriginalAmount'] as num).toDouble(),
      ticketAmount: json['ticketAmount'] as int,
      isByPayroll: json['isByPayroll'] as int,
      paymentMethodId: json['paymentMethodId'] as int,
      distinationId: json['distinationId'] as int,
      flightClassTypeId: json['flightClassTypeId'] as int,
      flightDirctionTypeId: json['flightDirctionTypeId'] as int,
      remarks: json['remarks'] as String,
      transactionStatusId: json['transactionStatusId'] as int,
      workFlowId: json['workFlowId'] as int,
      noOfDigits: json['noOfDigits'] as int,
      currencyCode: json['currencyCode'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$InsertAirTicketRequestToJson(
        InsertAirTicketRequest instance) =>
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
      'workFlowId': instance.workFlowId,
      'noOfDigits': instance.noOfDigits,
      'currencyCode': instance.currencyCode,
    };
