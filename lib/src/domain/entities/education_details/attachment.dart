class Attachment {
  final int? id;
  final int? educationUpdatedRequestId;
  final String? filePath;
  final String? fileName;
  final dynamic fileSource;
  final bool? isDeleted;

  Attachment({
    this.id,
    this.educationUpdatedRequestId,
    this.filePath,
    this.fileName,
    this.fileSource,
    this.isDeleted,
  });
}
