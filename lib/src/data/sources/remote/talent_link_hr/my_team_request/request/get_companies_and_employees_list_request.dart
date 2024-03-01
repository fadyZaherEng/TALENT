import 'package:json_annotation/json_annotation.dart';

part 'get_companies_and_employees_list_request.g.dart';

@JsonSerializable()
class GetCompaniesAndEmployeesListRequest {
  @JsonKey(name: "employeeId")
  final int? employeeId;

  const GetCompaniesAndEmployeesListRequest({
    this.employeeId,
  });

  factory GetCompaniesAndEmployeesListRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetCompaniesAndEmployeesListRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCompaniesAndEmployeesListRequestToJson(this);
}
