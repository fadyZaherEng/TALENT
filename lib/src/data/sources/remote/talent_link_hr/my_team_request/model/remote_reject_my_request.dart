import 'package:json_annotation/json_annotation.dart';

part 'remote_reject_my_request.g.dart';

@JsonSerializable()
class RemoteRejectMyRequest {
  @JsonKey(name: "status")
  final bool? status;

  const RemoteRejectMyRequest({
    this.status,
  });

  factory RemoteRejectMyRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoteRejectMyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteRejectMyRequestToJson(this);
}
