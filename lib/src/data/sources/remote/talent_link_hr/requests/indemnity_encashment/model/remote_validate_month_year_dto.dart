import 'package:json_annotation/json_annotation.dart';

part 'remote_validate_month_year_dto.g.dart';

@JsonSerializable()
class RemoteValidateMonthYearDto {
  @JsonKey(name: 'isValid')
  final bool? isValid;
  @JsonKey(name: 'message')
  final dynamic message;
  @JsonKey(name: 'salaryMonth')
  final dynamic salaryMonth;
  @JsonKey(name: 'salaryYear')
  final dynamic salaryYear;

  RemoteValidateMonthYearDto({
    this.isValid,
    this.message,
    this.salaryMonth,
    this.salaryYear,
  });

  factory RemoteValidateMonthYearDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteValidateMonthYearDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteValidateMonthYearDtoToJson(this);
}
