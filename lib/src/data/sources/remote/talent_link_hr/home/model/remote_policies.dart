import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/policies.dart';

part 'remote_policies.g.dart';

@JsonSerializable()
class RemotePolicies {
  @JsonKey(name: 'notificationCount')
  final int? notificationCount;
  @JsonKey(name: "resetTime")
  final String? resetTime;

  RemotePolicies({this.notificationCount, this.resetTime});

  factory RemotePolicies.fromJson(Map<String, dynamic> json) =>
      _$RemotePoliciesFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePoliciesToJson(this);
}

extension RemotePoliciesExtension on RemotePolicies {
  Policies mapToDomain() {
    return Policies(
        notificationCount: notificationCount!, resetTime: resetTime!);
  }
}
