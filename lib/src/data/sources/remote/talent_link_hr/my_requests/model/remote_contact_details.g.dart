// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_contact_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteContactDetails _$RemoteContactDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteContactDetails(
      status: json['transactionStatusName'] as String?,
      id: json['id'] as int?,
      employeeId: json['employeeId'] as int?,
      companyId: json['companyId'] as int?,
      contactName: json['contactName'] as String?,
      contactNumber: json['contactNo'] as String?,
      statusId: json['transactionStatusId'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$RemoteContactDetailsToJson(
        RemoteContactDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'contactName': instance.contactName,
      'contactNo': instance.contactNumber,
      'transactionStatusName': instance.status,
      'transactionStatusId': instance.statusId,
      'remarks': instance.remarks,
    };
