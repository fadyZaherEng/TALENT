import 'package:json_annotation/json_annotation.dart';

import '../../../../../../domain/entities/attachment_details/attachment.dart';
part 'remote_attachment.g.dart';

@JsonSerializable()
class RemoteAttachment {
  final int? id;
  final int? educationUpdatedRequestId;
  final String? filePath;
  final String? fileName;
  final dynamic fileSource;
  final bool? isDeleted;

  RemoteAttachment({
    this.id,
    this.educationUpdatedRequestId,
    this.filePath,
    this.fileName,
    this.fileSource,
    this.isDeleted,
  });

  factory RemoteAttachment.fromJson(Map<String, dynamic> json) =>
      _$RemoteAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAttachmentToJson(this);
}

extension RemoteAttachmentExtension on RemoteAttachment {
  Attachment mapToDomain() {
    return Attachment(
      id: id,
      educationUpdatedRequestId: educationUpdatedRequestId,
      filePath: filePath,
      fileName: fileName,
      fileSource: fileSource,
      isDeleted: isDeleted,
    );
  }
}
