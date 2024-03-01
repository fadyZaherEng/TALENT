// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_forgot_password_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteForgotPasswordState _$RemoteForgotPasswordStateFromJson(
        Map<String, dynamic> json) =>
    RemoteForgotPasswordState(
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$RemoteForgotPasswordStateToJson(
        RemoteForgotPasswordState instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
