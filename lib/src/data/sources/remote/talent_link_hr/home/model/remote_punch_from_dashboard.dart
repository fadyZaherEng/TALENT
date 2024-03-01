import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/punch.dart';

part 'remote_punch_from_dashboard.g.dart';

@JsonSerializable()
class RemotePunchFromDashboard {
  @JsonKey(name: 'punchTime')
  final String? punchTime;
  @JsonKey(name: 'punchTypeSystemCode')
  final String? punchTypeSystemCode;
  @JsonKey(name: 'remainingTime')
  final String? remainingTime;
  @JsonKey(name: 'message')
  final String? message;

  RemotePunchFromDashboard({
    this.punchTime,
    this.punchTypeSystemCode,
    this.remainingTime,
    this.message,
  });

  factory RemotePunchFromDashboard.fromJson(Map<String, dynamic> json) =>
      _$RemotePunchFromDashboardFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePunchFromDashboardToJson(this);
}

extension RemotePunchFromDashboardExtension on RemotePunchFromDashboard {
  Punch mapToDomain() {
    return Punch(
        punchTime: punchTime!,
        punchTypeSystemCode: punchTypeSystemCode!,
        remainingTime: remainingTime!,
        message: message!);
  }
}
