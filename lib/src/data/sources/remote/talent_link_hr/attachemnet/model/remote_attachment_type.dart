import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_attachment_type.g.dart';

@JsonSerializable()
class RemoteAttachmentType {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  RemoteAttachmentType({this.id, this.name});

  factory RemoteAttachmentType.fromJson(Map<String, dynamic> json) =>
      _$RemoteAttachmentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAttachmentTypeToJson(this);
}

extension RemoteAttachmentTypeExtension on RemoteAttachmentType {
  RequestType mapToDomain() {
    return RequestType(id: id!, name: name!);
  }
}

extension RemoteAttachmentTypeListExtension on List<RemoteAttachmentType>? {
  List<RequestType> mapAttachmentToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
