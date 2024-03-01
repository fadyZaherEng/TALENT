import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/news.dart';

part 'remote_get_news_list.g.dart';

@JsonSerializable()
class RemoteGetNewsList {
  @JsonKey(name: 'newsHeader')
  final String? newsHeader;
  @JsonKey(name: 'newsBody')
  final String? newsBody;
  @JsonKey(name: 'fromDate')
  final String? fromDate;
  @JsonKey(name: 'attachments')
  final String? attachments;

  RemoteGetNewsList({
    this.newsHeader,
    this.newsBody,
    this.fromDate,
    this.attachments,
  });

  factory RemoteGetNewsList.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetNewsListFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetNewsListToJson(this);
}

extension RemoteGetNewsExtension on RemoteGetNewsList {
  News mapToDomain() {
    return News(
        newsHeader: newsHeader!,
        newsBody: newsBody!,
        attachments: attachments!,
        fromDate: fromDate!);
  }
}

extension RemoteGetNewsListExtension on List<RemoteGetNewsList>? {
  List<News> mapNewsListToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
