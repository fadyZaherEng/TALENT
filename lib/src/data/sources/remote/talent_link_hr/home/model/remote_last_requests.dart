import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/last_requests.dart';

part 'remote_last_requests.g.dart';

@JsonSerializable()
class RemoteLastRequests {
  @JsonKey(name: 'referenceId')
  final int? referenceId;
  @JsonKey(name: 'referenceName')
  final String? referenceName;
  @JsonKey(name: 'transactionId')
  final int? transactionId;
  @JsonKey(name: 'transactionStatusId')
  final int? transactionStatusId;
  @JsonKey(name: 'transactionStatusName')
  final String? transactionStatusName;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  RemoteLastRequests({
    this.referenceId,
    this.referenceName,
    this.transactionId,
    this.transactionStatusId,
    this.transactionStatusName,
    this.createdAt,
  });

  factory RemoteLastRequests.fromJson(Map<String, dynamic> json) =>
      _$RemoteLastRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLastRequestsToJson(this);
}

extension RemoteLastRequestsExtension on RemoteLastRequests {
  LastRequests mapToDomain() {
    return LastRequests(
      referenceId: referenceId!,
      transactionStatusId: transactionStatusId!,
      transactionId: transactionId!,
      createdAt: createdAt!,
      referenceName: referenceName!,
      transactionStatusName: transactionStatusName!,
    );
  }
}

extension RemoteLastRequestsListExtension on List<RemoteLastRequests>? {
  List<LastRequests> mapLastRequestsListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
