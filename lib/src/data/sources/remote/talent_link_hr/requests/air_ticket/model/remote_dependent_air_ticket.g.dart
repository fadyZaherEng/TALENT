// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_dependent_air_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDependentAirTicket _$RemoteDependentAirTicketFromJson(
        Map<String, dynamic> json) =>
    RemoteDependentAirTicket(
      status: json['status'] as bool? ?? false,
      message: json['message'],
      dueTicketMonthId: json['dueTicketMonthId'] as int?,
      dueTicketMonth: json['dueTicketMonth'] as String?,
      employeeDependentId: json['employeeDependentId'] as int?,
      dependentName: json['dependentName'] as String?,
      ticketStartDate: json['ticketStartDate'] as String?,
      ticketEndDate: json['ticketEndDate'] as String?,
      isFixedAmount: json['isFixedAmount'] as bool?,
      ticketFixedAmount: (json['ticketFixedAmount'] as num?)?.toDouble(),
      flightClassTypeId: json['flightClassTypeId'] as int?,
      flightClassTypeName: json['flightClassTypeName'] as String?,
      flightDirctionTypeId: json['flightDirctionTypeId'] as int?,
      flightDirctionTypeName: json['flightDirctionTypeName'] as String?,
      distinationId: json['distinationId'] as int?,
      distinationName: json['distinationName'] as String?,
      noOfDigits: json['noOfDigits'] as int?,
    );

Map<String, dynamic> _$RemoteDependentAirTicketToJson(
        RemoteDependentAirTicket instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'dueTicketMonthId': instance.dueTicketMonthId,
      'dueTicketMonth': instance.dueTicketMonth,
      'employeeDependentId': instance.employeeDependentId,
      'dependentName': instance.dependentName,
      'ticketStartDate': instance.ticketStartDate,
      'ticketEndDate': instance.ticketEndDate,
      'isFixedAmount': instance.isFixedAmount,
      'ticketFixedAmount': instance.ticketFixedAmount,
      'flightClassTypeId': instance.flightClassTypeId,
      'flightClassTypeName': instance.flightClassTypeName,
      'flightDirctionTypeId': instance.flightDirctionTypeId,
      'flightDirctionTypeName': instance.flightDirctionTypeName,
      'distinationId': instance.distinationId,
      'distinationName': instance.distinationName,
      'noOfDigits': instance.noOfDigits,
    };
