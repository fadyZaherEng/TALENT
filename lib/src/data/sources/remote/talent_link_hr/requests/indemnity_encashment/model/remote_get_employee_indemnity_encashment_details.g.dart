// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_employee_indemnity_encashment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetEmployeeIndemnityEncashmentDetails
    _$RemoteGetEmployeeIndemnityEncashmentDetailsFromJson(
            Map<String, dynamic> json) =>
        RemoteGetEmployeeIndemnityEncashmentDetails(
          name: json['name'] as String?,
          id: json['id'] as int?,
          maximumDaysPerYear: json['maximumDaysPerYear'] as int?,
        );

Map<String, dynamic> _$RemoteGetEmployeeIndemnityEncashmentDetailsToJson(
        RemoteGetEmployeeIndemnityEncashmentDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maximumDaysPerYear': instance.maximumDaysPerYear,
    };
