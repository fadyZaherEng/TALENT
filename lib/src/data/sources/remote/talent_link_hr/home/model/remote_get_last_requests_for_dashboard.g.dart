// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_last_requests_for_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetLastRequestsForDashBoard _$RemoteGetLastRequestsForDashBoardFromJson(
        Map<String, dynamic> json) =>
    RemoteGetLastRequestsForDashBoard(
      lastAttendance: json['lastAttendance'] == null
          ? null
          : RemoteLastAttendance.fromJson(
              json['lastAttendance'] as Map<String, dynamic>),
      lastRequests: (json['lastRequests'] as List<dynamic>?)
          ?.map((e) => RemoteLastRequests.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastVacation: (json['lastVacation'] as List<dynamic>?)
          ?.map((e) => RemoteLastVacation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteGetLastRequestsForDashBoardToJson(
        RemoteGetLastRequestsForDashBoard instance) =>
    <String, dynamic>{
      'lastAttendance': instance.lastAttendance,
      'lastRequests': instance.lastRequests,
      'lastVacation': instance.lastVacation,
    };
