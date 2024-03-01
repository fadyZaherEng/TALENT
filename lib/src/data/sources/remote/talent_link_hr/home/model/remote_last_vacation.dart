import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/last_requests.dart';

part 'remote_last_vacation.g.dart';

@JsonSerializable()
class RemoteLastVacation {
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

  RemoteLastVacation({
    this.referenceId,
    this.referenceName,
    this.transactionId,
    this.transactionStatusId,
    this.transactionStatusName,
    this.createdAt,
  });

  factory RemoteLastVacation.fromJson(Map<String, dynamic> json) =>
      _$RemoteLastVacationFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLastVacationToJson(this);
}

extension RemoteLastVacationExtension on RemoteLastVacation {
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

extension RemoteLastVacationListExtension on List<RemoteLastVacation>? {
  List<LastRequests> mapLastVacationListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
