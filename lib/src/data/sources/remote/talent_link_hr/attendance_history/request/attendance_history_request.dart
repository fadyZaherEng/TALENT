import 'package:json_annotation/json_annotation.dart';

part 'attendance_history_request.g.dart';

@JsonSerializable()
class AttendanceHistoryRequest {
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'month')
  final int month;
  @JsonKey(name: 'year')
  final int year;

  AttendanceHistoryRequest({
    required this.year,
    required this.employeeId,
    required this.month,
  });

  factory AttendanceHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceHistoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceHistoryRequestToJson(this);
}
