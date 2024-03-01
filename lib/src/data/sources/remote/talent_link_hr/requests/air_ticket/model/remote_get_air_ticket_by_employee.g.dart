// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_air_ticket_by_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetAirTicketByEmployee _$RemoteGetAirTicketByEmployeeFromJson(
        Map<String, dynamic> json) =>
    RemoteGetAirTicketByEmployee(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      id: json['id'] as int?,
      dueTicketMonthId: json['dueTicketMonthId'] as int?,
      dueTicketMonth: json['dueTicketMonth'] as String?,
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
      dueTicketYear: json['dueTicketYear'] as String?,
      dueTicketYearId: json['dueTicketYearId'] as int?,
    );

Map<String, dynamic> _$RemoteGetAirTicketByEmployeeToJson(
        RemoteGetAirTicketByEmployee instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'dueTicketMonthId': instance.dueTicketMonthId,
      'dueTicketMonth': instance.dueTicketMonth,
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
      'dueTicketYear': instance.dueTicketYear,
      'dueTicketYearId': instance.dueTicketYearId,
    };
