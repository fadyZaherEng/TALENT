import 'package:json_annotation/json_annotation.dart';

part 'update_notification_request.g.dart';

@JsonSerializable()
class UpdateNotificationRequest {
  @JsonKey(name: "isAllowedNotification")
  int isAllowedNotification;

  UpdateNotificationRequest({
    required this.isAllowedNotification,
  });

  factory UpdateNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNotificationRequestToJson(this);
}
