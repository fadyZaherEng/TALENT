import 'package:json_annotation/json_annotation.dart';

part 'insert_attachment_request.g.dart';

@JsonSerializable()
class InsertAttachmentRequest {
  @JsonKey(name: "companyId")
  final int? companyId;
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "attachmentTypeId")
  final int? attachmentTypeId;

  const InsertAttachmentRequest({
    required this.companyId,
    required this.employeeId,
    required this.attachmentTypeId,
  });

  factory InsertAttachmentRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertAttachmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertAttachmentRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'employeeId': employeeId,
      'attachmentTypeId': attachmentTypeId,
    };
  }

  factory InsertAttachmentRequest.fromMap(Map<String, dynamic> map) {
    return InsertAttachmentRequest(
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      attachmentTypeId: map['attachmentTypeId'] as int,
    );
  }
}
