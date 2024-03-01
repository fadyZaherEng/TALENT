import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request_type.dart';

part 'remote_qualification.g.dart';

@JsonSerializable()
class RemoteQualification {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  RemoteQualification({this.id, this.name});

  factory RemoteQualification.fromJson(Map<String, dynamic> json) =>
      _$RemoteQualificationFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQualificationToJson(this);
}

extension RemoteQualificationExtension on RemoteQualification {
  RequestType mapToDomain() {
    return RequestType(
      id: id!,
      name: name!,
    );
  }
}

extension RemoteQualificationListExtension on List<RemoteQualification>? {
  List<RequestType> mapQualificationToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
