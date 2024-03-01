import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';

part 'remote_get_employee_requests.g.dart';

@JsonSerializable()
class RemoteGetEmployeeRequests {
  @JsonKey(name: "referenceId")
  final int? referenceId;
  @JsonKey(name: "referenceName")
  final String? referenceName;
  @JsonKey(name: "transactionId")
  final int? transactionId;
  @JsonKey(name: "transactionStatusId")
  final int? transactionStatusId;
  @JsonKey(name: "transactionStatusName")
  final String? transactionStatusName;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  const RemoteGetEmployeeRequests({
    this.referenceId,
    this.referenceName,
    this.transactionId,
    this.transactionStatusName,
    this.createdAt,
    this.transactionStatusId,
  });

  factory RemoteGetEmployeeRequests.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetEmployeeRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetEmployeeRequestsToJson(this);
}

extension RemoteGetEmployeeRequestsExtension on RemoteGetEmployeeRequests {
  MyRequest mapToDomain() {
    return MyRequest(
      id: referenceId ?? 0,
      requestType: referenceName ?? "",
      transactionId: transactionId ?? 0,
      requestStatus: transactionStatusName ?? "",
      date: createdAt ?? "",
      transactionStatuesId: transactionStatusId??0,
    );
  }
}

extension RemoteGetEmployeeRequestsListExtension
    on List<RemoteGetEmployeeRequests>? {
  List<MyRequest> mapRemoteGetEmployeeRequestsListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
