import 'package:json_annotation/json_annotation.dart';

part 'get_details_requests.g.dart';

@JsonSerializable()
class GetDetailsRequests {
  @JsonKey(name: "transactionId")
  final int? transactionId;

  const GetDetailsRequests({
    this.transactionId,
  });

  factory GetDetailsRequests.fromJson(Map<String, dynamic> json) =>
      _$GetDetailsRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailsRequestsToJson(this);
}
