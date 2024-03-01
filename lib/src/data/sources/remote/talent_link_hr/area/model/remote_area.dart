import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_area.g.dart';

@JsonSerializable()
class RemoteArea {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  RemoteArea({this.id, this.name});

  factory RemoteArea.fromJson(Map<String, dynamic> json) =>
      _$RemoteAreaFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAreaToJson(this);
}

extension RemoteAreaExtension on RemoteArea {
  RequestType mapToDomain() {
    return RequestType(id: id!, name: name!);
  }
}

extension RemoteAreaListExtension on List<RemoteArea>? {
  List<RequestType> mapAreaToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
