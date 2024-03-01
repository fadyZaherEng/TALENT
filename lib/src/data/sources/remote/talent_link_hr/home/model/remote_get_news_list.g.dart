// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_news_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetNewsList _$RemoteGetNewsListFromJson(Map<String, dynamic> json) =>
    RemoteGetNewsList(
      newsHeader: json['newsHeader'] as String?,
      newsBody: json['newsBody'] as String?,
      fromDate: json['fromDate'] as String?,
      attachments: json['attachments'] as String?,
    );

Map<String, dynamic> _$RemoteGetNewsListToJson(RemoteGetNewsList instance) =>
    <String, dynamic>{
      'newsHeader': instance.newsHeader,
      'newsBody': instance.newsBody,
      'fromDate': instance.fromDate,
      'attachments': instance.attachments,
    };
