// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_team_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyTeamRequest _$GetMyTeamRequestFromJson(Map<String, dynamic> json) =>
    GetMyTeamRequest(
      managerEmployeeId: json['managerEmployeeId'] as int?,
      filterCompanyId: json['filterCompanyId'] as int?,
      filerEmployeeId: json['filerEmployeeId'] as int?,
      requestTypeId: json['RequestTypeId'] as int?,
      requestFromDate: json['RequestFromDate'] as String?,
      requestToDate: json['RequestToDate'] as String?,
      createdDateAt: json['CreatedDateAt'] as String?,
      createdDateFrom: json['CreatedDateFrom'] as String?,
      requestDataId: json['requestDataId'] as int?,
      transactionStatusId: json['transactionStatusId'] as int?,
    );

Map<String, dynamic> _$GetMyTeamRequestToJson(GetMyTeamRequest instance) =>
    <String, dynamic>{
      'managerEmployeeId': instance.managerEmployeeId,
      'filterCompanyId': instance.filterCompanyId,
      'filerEmployeeId': instance.filerEmployeeId,
      'RequestTypeId': instance.requestTypeId,
      'RequestFromDate': instance.requestFromDate,
      'RequestToDate': instance.requestToDate,
      'CreatedDateAt': instance.createdDateAt,
      'CreatedDateFrom': instance.createdDateFrom,
      'requestDataId': instance.requestDataId,
      'transactionStatusId': instance.transactionStatusId,
    };
