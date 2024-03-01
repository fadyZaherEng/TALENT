// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_address_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAddressDetails _$RemoteAddressDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteAddressDetails(
      id: json['id'] as int?,
      employeeId: json['employeeId'] as int?,
      remarks: json['remarks'] as String?,
      statusId: json['transactionStatusId'] as int?,
      status: json['transactionStatusName'] as String?,
      companyId: json['companyId'] as int?,
      addressDetails: json['addressDetails'] as String?,
      addressName: json['addressName'] as String?,
      areaName: json['areaName'] as String?,
      buildingNumber: json['buildingNo'] as String?,
      flat: json['flat'] as String?,
      floor: json['floor'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$RemoteAddressDetailsToJson(
        RemoteAddressDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'employeeId': instance.employeeId,
      'transactionStatusId': instance.statusId,
      'transactionStatusName': instance.status,
      'remarks': instance.remarks,
      'addressName': instance.addressName,
      'street': instance.street,
      'buildingNo': instance.buildingNumber,
      'floor': instance.floor,
      'flat': instance.flat,
      'addressDetails': instance.addressDetails,
      'areaName': instance.areaName,
    };
