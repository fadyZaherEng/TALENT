import 'package:json_annotation/json_annotation.dart';

part 'remote_approve_my_request.g.dart';

@JsonSerializable()
class RemoteApproveMyRequest {
  @JsonKey(name: "status")
  final bool? status;

  const RemoteApproveMyRequest({
    this.status,
  });

  factory RemoteApproveMyRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoteApproveMyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteApproveMyRequestToJson(this);
}
