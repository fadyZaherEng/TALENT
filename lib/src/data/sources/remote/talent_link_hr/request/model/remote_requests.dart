import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/request/model/remote_extra_field_data.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/request/model/remote_submenu.dart';

part 'remote_requests.g.dart';

@JsonSerializable()
class RemoteRequests {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'moduleId')
  final int? moduleId;
  @JsonKey(name: 'subscriberId')
  final dynamic subscriberId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'iconFilePath')
  final String? iconFilePath;
  @JsonKey(name: 'mainModulesForms')
  final dynamic mainModulesForms;
  @JsonKey(name: 'submenu')
  final List<RemoteSubmenu>? remoteSubmenu;
  @JsonKey(name: 'extrafieldData')
  final List<RemoteExtraFieldData>? extrafieldData;

  RemoteRequests({
    this.moduleId,
    this.id,
    this.name,
    this.iconFilePath,
    this.mainModulesForms,
    this.remoteSubmenu,
    this.subscriberId,
    this.extrafieldData,
  });

  factory RemoteRequests.fromJson(Map<String, dynamic> json) =>
      _$RemoteRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteRequestsToJson(this);



}


