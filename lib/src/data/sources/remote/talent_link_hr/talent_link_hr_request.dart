import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_subscriber_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_user_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_app_version_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_operating_system_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_serial_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_type_usecase.dart';
import 'package:talent_link/src/domain/usecase/firebase_notification/get_firebase_notfication_token_usecase.dart';
import 'package:talent_link/src/domain/usecase/more/get_language_use_case.dart';

part 'talent_link_hr_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TalentLinkHrRequest<T> {
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'subscriberId')
  int? subscriberId;
  @JsonKey(name: 'companyId')
  int? companyId;
  @JsonKey(name: 'langId')
  String? langId;
  @JsonKey(name: 'deviceTypeCode')
  int? deviceTypeCode;
  @JsonKey(name: 'deviceToken')
  String? deviceToken;
  @JsonKey(name: 'deviceSerial')
  String? deviceSerial;
  @JsonKey(name: 'appVersion')
  String? appVersion;
  @JsonKey(name: 'oSVersion')
  String? oSVersion;
  @JsonKey(name: 'data')
  T? data;

  TalentLinkHrRequest({
    this.userId,
    this.subscriberId,
    this.companyId,
    this.langId,
    this.deviceTypeCode,
    this.deviceToken,
    this.deviceSerial,
    this.appVersion,
    this.oSVersion,
    this.data,
  });

  factory TalentLinkHrRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$TalentLinkHrRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$TalentLinkHrRequestToJson(this, (T) {
        return T;
      });

  Future<TalentLinkHrRequest<T>> createRequest(T) async {
    return TalentLinkHrRequest(
      appVersion:
          await GetAppVersionUseCase(sharedPreferences: injector())() ?? "",
      companyId:
          await GetCompanyIdUseCase(sharedPreferences: injector())() ?? 0,
      deviceSerial:
          await GetDeviceSerialUseCase(sharedPreferences: injector())() ??
              "",
      deviceToken: await GetFirebaseNotificationTokenUseCase(
              sharedPreferences: injector())() ??
          "",
      deviceTypeCode:
          await GetDeviceTypeUseCase(sharedPreferences: injector())() ?? 1,
      langId: await GetLanguageUseCase(sharedPreferences: injector())() ?? "en",
      oSVersion: await GetDeviceOperatingSystemUseCase(
              sharedPreferences: injector())() ??
          "",
      subscriberId:
          await GetSubscriberIdUseCase(sharedPreferences: injector())() ?? 0,
      userId: await GetUserIdUseCase(sharedPreferences: injector())() ?? 0,
      data: T,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "subscriberId": subscriberId,
      "companyId": companyId,
      "langId": langId,
      "deviceTypeCode": deviceTypeCode,
      "deviceToken": deviceToken,
      "deviceSerial": deviceSerial,
      "appVersion": appVersion,
      "oSVersion": oSVersion,
      "data": data != null ? data : null,
    };
  }
}
