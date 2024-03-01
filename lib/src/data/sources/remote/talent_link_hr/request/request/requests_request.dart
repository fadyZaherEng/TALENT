import 'package:json_annotation/json_annotation.dart';

part 'requests_request.g.dart';

@JsonSerializable()
class RequestsRequest {
  @JsonKey(name: 'userTypeId')
  final int userTypeId;

  RequestsRequest({this.userTypeId = 1});

  factory RequestsRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestsRequestToJson(this);
}
