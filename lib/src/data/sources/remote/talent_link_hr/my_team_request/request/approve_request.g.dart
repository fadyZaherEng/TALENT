// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveRequest _$ApproveRequestFromJson(Map<String, dynamic> json) =>
    ApproveRequest(
      id: json['id'] as int?,
      requestTypeId: json['requestTypeId'] as int?,
      employeeId: json['employeeId'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$ApproveRequestToJson(ApproveRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestTypeId': instance.requestTypeId,
      'employeeId': instance.employeeId,
      'remarks': instance.remarks,
    };
