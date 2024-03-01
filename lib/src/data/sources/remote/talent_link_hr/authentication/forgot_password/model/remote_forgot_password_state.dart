import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/forgot_password/forgot_password_status.dart';

part 'remote_forgot_password_state.g.dart';

@JsonSerializable()
class RemoteForgotPasswordState {
  @JsonKey(name: "status")
  final bool? status;
  @JsonKey(name: "message")
  final String? message;

  RemoteForgotPasswordState({this.message, this.status});

  factory RemoteForgotPasswordState.fromJson(Map<String, dynamic> json) =>
      _$RemoteForgotPasswordStateFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteForgotPasswordStateToJson(this);
}

extension RemoteForgotPasswordExtension on RemoteForgotPasswordState {
  ForgotPasswordStatus mapToDomain() {
    return ForgotPasswordStatus(
      status: status ?? false,
      message: message ?? '',
    );
  }
}
