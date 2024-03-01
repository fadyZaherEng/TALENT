import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_contect_type.g.dart';

@JsonSerializable()
class RemoteContactType {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  RemoteContactType({this.id, this.name});

  factory RemoteContactType.fromJson(Map<String, dynamic> json) =>
      _$RemoteContactTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteContactTypeToJson(this);
}

extension RemoteContactTypeExtension on RemoteContactType {
  RequestType mapToDomain() {
    return RequestType(id: id!, name: name!);
  }
}

extension RemoteContactTypeListExtension on List<RemoteContactType>? {
  List<RequestType> mapContactTypeToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
