import 'package:json_annotation/json_annotation.dart';

part 'cancel_request.g.dart';

@JsonSerializable()
class CancelRequestRequest {
  @JsonKey(name: "tableId")
  final int? tableId;
  @JsonKey(name: "transactionId")
  final int? transactionId;

  const CancelRequestRequest({
    this.tableId,
    this.transactionId,
  });

  factory CancelRequestRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelRequestRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CancelRequestRequestToJson(this);
}
