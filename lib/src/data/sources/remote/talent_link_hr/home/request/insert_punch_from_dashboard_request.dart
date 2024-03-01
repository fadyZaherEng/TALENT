import 'package:json_annotation/json_annotation.dart';

part 'insert_punch_from_dashboard_request.g.dart';

@JsonSerializable()
class InsertPunchFromDashboard {
  @JsonKey(name: "punchTypeSystemCode")
  final String punchTypeSystemCode;
  @JsonKey(name: "fingerPrintNo")
  final String fingerPrintNo;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "latitude")
  final String? latitude;

  InsertPunchFromDashboard({
    required this.punchTypeSystemCode,
    required this.fingerPrintNo,
    required this.longitude,
    required this.latitude,
  });

  factory InsertPunchFromDashboard.fromJson(Map<String, dynamic> json) =>
      _$InsertPunchFromDashboardFromJson(json);

  Map<String, dynamic> toJson() => _$InsertPunchFromDashboardToJson(this);
}
