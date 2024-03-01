import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_get_all_requests_list.g.dart';

@JsonSerializable()
class RemoteGetAllRequestsList {
  @JsonKey(name: "referenceId")
  final int? referenceId;
  @JsonKey(name: "name")
  final String? name;

  const RemoteGetAllRequestsList({this.referenceId, this.name});

  factory RemoteGetAllRequestsList.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetAllRequestsListFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetAllRequestsListToJson(this);
}

extension RemoteGetAllRequestsExtension on RemoteGetAllRequestsList {
  RequestType mapToDomain() {
    return RequestType(id: referenceId!, name: name!);
  }
}

extension RemoteGetAllRequestsListExtension on List<RemoteGetAllRequestsList>? {
  List<RequestType> mapAllRequestsToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
