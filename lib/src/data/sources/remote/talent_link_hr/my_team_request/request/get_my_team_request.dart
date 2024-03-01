import 'package:json_annotation/json_annotation.dart';

part 'get_my_team_request.g.dart';

@JsonSerializable()
class GetMyTeamRequest {
  @JsonKey(name: "managerEmployeeId")
  final int? managerEmployeeId;
  @JsonKey(name: "filterCompanyId")
  final int? filterCompanyId;
  @JsonKey(name: "filerEmployeeId")
  final int? filerEmployeeId;
  @JsonKey(name: "RequestTypeId")
  final int? requestTypeId;
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
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;

  const GetMyTeamRequest({
    this.managerEmployeeId,
    this.filterCompanyId,
    this.filerEmployeeId,
    this.requestTypeId,
    this.requestFromDate,
    this.requestToDate,
    this.createdDateAt,
    this.createdDateFrom,
    this.requestDataId,
    this.transactionStatusId,
  });

  factory GetMyTeamRequest.fromJson(Map<String, dynamic> json) =>
      _$GetMyTeamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyTeamRequestToJson(this);
}
