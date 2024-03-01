// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertAddressRequest _$InsertAddressRequestFromJson(
        Map<String, dynamic> json) =>
    InsertAddressRequest(
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
      addressName: json['addressName'] as String,
      street: json['street'] as String,
      buildingNo: json['buildingNo'] as String,
      floor: json['floor'] as String,
      flat: json['flat'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      addressDetails: json['addressDetails'] as String,
      addressFilePath: json['addressFilePath'] as String,
      addressFileName: json['addressFileName'] as String,
      fileSource: json['fileSource'] as String,
      areaId: json['areaId'] as int,
      isDeleted: json['isDeleted'] as bool,
      areaName: json['areaName'] as String,
    );

Map<String, dynamic> _$InsertAddressRequestToJson(
        InsertAddressRequest instance) =>
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
      'addressName': instance.addressName,
      'street': instance.street,
      'buildingNo': instance.buildingNo,
      'floor': instance.floor,
      'flat': instance.flat,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'addressDetails': instance.addressDetails,
      'addressFilePath': instance.addressFilePath,
      'addressFileName': instance.addressFileName,
      'fileSource': instance.fileSource,
      'areaId': instance.areaId,
      'isDeleted': instance.isDeleted,
      'areaName': instance.areaName,
    };
