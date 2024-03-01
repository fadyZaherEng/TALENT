import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_get_transaction_status.g.dart';

@JsonSerializable()
class RemoteGetTransactionStatus {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  const RemoteGetTransactionStatus({this.id, this.name});

  factory RemoteGetTransactionStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetTransactionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetTransactionStatusToJson(this);
}

extension RemoteGetTransactionStatusExtension on RemoteGetTransactionStatus {
  RequestType mapToDomain() {
    return RequestType(id: id!, name: name!);
  }
}

extension RemoteGetTransactionStatusListExtension on List<RemoteGetTransactionStatus>? {
  List<RequestType> mapTransactionStatusToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
