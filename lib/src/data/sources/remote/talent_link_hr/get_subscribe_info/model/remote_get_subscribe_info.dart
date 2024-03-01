import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';

part 'remote_get_subscribe_info.g.dart';

@JsonSerializable()
class RemoteGetSubscribeInfo {
  @JsonKey(name: "subscriberId")
  final int? subscriberId;
  @JsonKey(name: "subscriberName")
  final String? subscriberName;
  @JsonKey(name: "termsAndConditions")
  final String? termsAndConditions;
  @JsonKey(name: "aboutUs")
  final String? aboutUs;

  const RemoteGetSubscribeInfo({
    this.subscriberId,
    this.subscriberName,
    this.termsAndConditions,
    this.aboutUs,
  });

  factory RemoteGetSubscribeInfo.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetSubscribeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetSubscribeInfoToJson(this);
}

extension RemoteGetSubscribeInfoExtension on RemoteGetSubscribeInfo {
  GetSubscribeInfo mapToDomain() {
    return GetSubscribeInfo(
      subscriberId: subscriberId ?? 0,
      subscriberName: subscriberName ?? "",
      termsAndConditions: termsAndConditions ?? "",
      aboutUs: aboutUs ?? "",
    );
  }
}
