import 'package:json_annotation/json_annotation.dart';

part 'get_attachment_details_request.g.dart';

@JsonSerializable()
class GetAttachmentDetailsRequest {
  @JsonKey(name: 'transactionId')
  final int? transactionId;


  GetAttachmentDetailsRequest({
    required this.transactionId,
  });

  factory GetAttachmentDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAttachmentDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAttachmentDetailsRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'transactionId': transactionId,
    };
  }

  factory GetAttachmentDetailsRequest.fromMap(Map<String, dynamic> map) {
    return GetAttachmentDetailsRequest(
      transactionId: map['transactionId'] as int,
    );
  }
}
