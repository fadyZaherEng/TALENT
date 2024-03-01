// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_asset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertAssetRequest _$InsertAssetRequestFromJson(Map<String, dynamic> json) =>
    InsertAssetRequest(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      employeeId: json['employeeId'] as int,
      transactionStatusId: json['transactionStatusId'] as int,
      transactionStatusName: json['transactionStatusName'] as String,
      transactionStatusCode: json['transactionStatusCode'] as String,
      remarks: json['remarks'] as String,
      workFlowId: json['workFlowId'] as int,
      workFlowName: json['workFlowName'] as String,
      isEnabled: json['isEnabled'] as bool,
      quantity: json['quantity'] as String,
      assetFilePath: json['assetFilePath'] as String,
      assetFileName: json['assetFileName'] as String,
      assetTypeId: json['assetTypeId'] as String,
      assetTypeName: json['assetTypeName'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$InsertAssetRequestToJson(InsertAssetRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'transactionStatusId': instance.transactionStatusId,
      'transactionStatusName': instance.transactionStatusName,
      'transactionStatusCode': instance.transactionStatusCode,
      'remarks': instance.remarks,
      'workFlowId': instance.workFlowId,
      'workFlowName': instance.workFlowName,
      'isEnabled': instance.isEnabled,
      'quantity': instance.quantity,
      'assetFilePath': instance.assetFilePath,
      'assetFileName': instance.assetFileName,
      'assetTypeId': instance.assetTypeId,
      'assetTypeName': instance.assetTypeName,
      'isDeleted': instance.isDeleted,
    };
