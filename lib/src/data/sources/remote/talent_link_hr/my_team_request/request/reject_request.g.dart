// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectRequest _$RejectRequestFromJson(Map<String, dynamic> json) =>
    RejectRequest(
      id: json['id'] as int?,
      requestTypeId: json['requestTypeId'] as int?,
      employeeId: json['employeeId'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$RejectRequestToJson(RejectRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestTypeId': instance.requestTypeId,
      'employeeId': instance.employeeId,
      'remarks': instance.remarks,
    };
