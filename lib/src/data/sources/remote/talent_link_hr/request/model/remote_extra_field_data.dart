import 'package:json_annotation/json_annotation.dart';

part 'remote_extra_field_data.g.dart';

@JsonSerializable()
class RemoteExtraFieldData {
  @JsonKey(name: 'name')
  final String? name;

  RemoteExtraFieldData({this.name});

  factory RemoteExtraFieldData.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtraFieldDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtraFieldDataToJson(this);
}
