// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_asset_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAssetDetails _$RemoteAssetDetailsFromJson(Map<String, dynamic> json) =>
    RemoteAssetDetails(
      status: json['transactionStatusName'] as String?,
      id: json['id'] as int?,
      employeeId: json['employeeId'] as int?,
      companyId: json['companyId'] as int?,
      assetTypeName: json['assetTypeName'] as String?,
      quantity: json['quantity'] as int?,
      statusId: json['transactionStatusId'] as int?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$RemoteAssetDetailsToJson(RemoteAssetDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'quantity': instance.quantity,
      'assetTypeName': instance.assetTypeName,
      'transactionStatusName': instance.status,
      'transactionStatusId': instance.statusId,
      'remarks': instance.remarks,
    };
