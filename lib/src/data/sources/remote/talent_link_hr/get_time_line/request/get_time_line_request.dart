import 'package:json_annotation/json_annotation.dart';

part 'get_time_line_request.g.dart';

@JsonSerializable()
class GetTimeLineRequest {
  @JsonKey(name: "tableId")
  final int? tableId;
  @JsonKey(name: "transactionId")
  final int? transactionId;
  @JsonKey(name: "baseUrl")
  final String? baseUrl;

  const GetTimeLineRequest({
    this.tableId,
    this.transactionId,
    this.baseUrl,
  });

  factory GetTimeLineRequest.fromJson(Map<String, dynamic> json) =>
      _$GetTimeLineRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetTimeLineRequestToJson(this);
}
