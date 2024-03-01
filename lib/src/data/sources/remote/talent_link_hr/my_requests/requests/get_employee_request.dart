import 'package:json_annotation/json_annotation.dart';

part 'get_employee_request.g.dart';

@JsonSerializable()
class GetEmployeeRequest {
  @JsonKey(name: "RequestTypeId")
  final int? requestTypeId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "TransactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "RequestFromDate")
  final String? requestFromDate;
  @JsonKey(name: "RequestToDate")
  final String? requestToDate;
  @JsonKey(name: "CreatedDateAt")
  final String? createdDateAt;
  @JsonKey(name: "CreatedDateFrom")
  final String? createdDateFrom;
  @JsonKey(name: "requestDataId")
  final int? requestDataId;

  const GetEmployeeRequest({
    this.requestTypeId,
    this.employeeId,
    this.transactionStatusId,
    this.requestFromDate,
    this.requestToDate,
    this.createdDateAt,
    this.createdDateFrom,
    this.requestDataId,
  });

  factory GetEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetEmployeeRequestToJson(this);
}
