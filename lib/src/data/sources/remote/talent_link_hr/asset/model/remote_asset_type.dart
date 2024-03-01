import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_asset_type.g.dart';

@JsonSerializable()
class RemoteAssetType {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  RemoteAssetType({this.id, this.name});

  factory RemoteAssetType.fromJson(Map<String, dynamic> json) =>
      _$RemoteAssetTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAssetTypeToJson(this);
}

extension RemoteAssetTypeExtension on RemoteAssetType {
  RequestType mapToDomain() {
    return RequestType(
      id: id!,
      name: name!,
    );
  }
}

extension RemoteAssetTypeListExtension on List<RemoteAssetType>? {
  List<RequestType> mapAssetTypeToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
