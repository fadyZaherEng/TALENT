import 'package:json_annotation/json_annotation.dart';

part 'get_education_details_request.g.dart';

@JsonSerializable()
class GetEducationDetailsRequest {
  @JsonKey(name: 'transactionId')
  final int? transactionId;


  GetEducationDetailsRequest({
    required this.transactionId,
  });

  factory GetEducationDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetEducationDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetEducationDetailsRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'transactionId': transactionId,
    };
  }

  factory GetEducationDetailsRequest.fromMap(Map<String, dynamic> map) {
    return GetEducationDetailsRequest(
      transactionId: map['transactionId'] as int,
    );
  }
}
