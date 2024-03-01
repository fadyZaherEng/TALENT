import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/notifications/notifications.dart';

part 'remote_notifications.g.dart';

@JsonSerializable()
class RemoteNotifications {
  @JsonKey(name: 'notificationId')
  final int? id;
  @JsonKey(name: 'notificationTitle')
  final String? title;
  @JsonKey(name: 'notificationBody')
  final String? body;
  @JsonKey(name: 'notificationDate')
  final String? date;
  @JsonKey(name: 'notificationTime')
  final String? time;

  RemoteNotifications({
    this.id,
    this.title,
    this.body,
    this.date,
    this.time,
  });

  factory RemoteNotifications.fromJson(Map<String, dynamic> json) =>
      _$RemoteNotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteNotificationsToJson(this);
}

extension RemoteNotificationsExtension on RemoteNotifications {
  Notifications mapToDomain() {
    return Notifications(
      id: id!,
      title: title!,
      body: body!,
      date: date!,
      time: time!,
    );
  }
}

extension RemoteNotificationsListExtension on List<RemoteNotifications>? {
  List<Notifications> mapNotificationsToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
