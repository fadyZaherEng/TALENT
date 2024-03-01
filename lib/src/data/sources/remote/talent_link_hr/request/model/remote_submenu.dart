import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/request/request.dart';

part 'remote_submenu.g.dart';

@JsonSerializable()
class RemoteSubmenu {
  @JsonKey(name: 'path')
  final String? path;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'class1')
  final String? class1;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'labelClass')
  final String? labelClass;
  @JsonKey(name: 'extralink')
  final bool? extralink;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'order')
  final int? order;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'submenu')
  final List<RemoteSubmenu>? submenu;

  RemoteSubmenu({
    this.title,
    this.id,
    this.path,
    this.label,
    this.icon,
    this.class1,
    this.extralink,
    this.labelClass,
    this.order,
    this.submenu,
  });

  factory RemoteSubmenu.fromJson(Map<String, dynamic> json) =>
      _$RemoteSubmenuFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSubmenuToJson(this);
}

extension RemoteSubmenuExtension on RemoteSubmenu {
  Request mapToDomain() {
    return Request(
      id: id!,
      text: label!,
      requests: submenu.remoteSubmenuToDomain(),
    );
  }
}

extension RemoteSubmenuListExtension on List<RemoteSubmenu>? {
  List<Request> remoteSubmenuToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
