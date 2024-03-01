// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_home_data_for_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetDataForDashBoard _$RemoteGetDataForDashBoardFromJson(
        Map<String, dynamic> json) =>
    RemoteGetDataForDashBoard(
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
      shiftTime: json['shiftTime'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      remainingCurrentBalance: json['remainingCurrentBalance'] as int?,
      yearlyBalance: (json['yearlyBalance'] as num?)?.toDouble(),
      remainingYearlyBalance: json['remainingYearlyBalance'] as int?,
      remainingWorkHours: json['remainingWorkHours'] as int?,
      notificationCount: json['notificationCount'] as int?,
    );

Map<String, dynamic> _$RemoteGetDataForDashBoardToJson(
        RemoteGetDataForDashBoard instance) =>
    <String, dynamic>{
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'shiftTime': instance.shiftTime,
      'currentBalance': instance.currentBalance,
      'remainingCurrentBalance': instance.remainingCurrentBalance,
      'yearlyBalance': instance.yearlyBalance,
      'remainingYearlyBalance': instance.remainingYearlyBalance,
      'remainingWorkHours': instance.remainingWorkHours,
      'notificationCount': instance.notificationCount,
    };
