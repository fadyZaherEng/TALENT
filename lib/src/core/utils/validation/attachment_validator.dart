class AttachmentValidator {
  static AttachmentValidationState validateAttachmentType(
      String attachmentType) {
    if (attachmentType.isEmpty) {
      return AttachmentValidationState.attachmentTypeEmpty;
    } else {
      return AttachmentValidationState.valid;
    }
  }

  static AttachmentValidationState validateDocumentNo(String documentNo) {
    if (documentNo.isEmpty) {
      return AttachmentValidationState.documentNoEmpty;
    } else {
      return AttachmentValidationState.valid;
    }
  }

  static AttachmentValidationState validateIssueDate(String issueDate) {
    if (issueDate.isEmpty) {
      return AttachmentValidationState.issueDateEmpty;
    } else {
      return AttachmentValidationState.valid;
    }
  }

  static AttachmentValidationState validateFile(String file) {
    if (file.isEmpty) {
      return AttachmentValidationState.fileEmpty;
    } else {
      return AttachmentValidationState.valid;
    }
  }
}

enum AttachmentValidationState {
  attachmentTypeEmpty,
  documentNoEmpty,
  issueDateEmpty,
  fileEmpty,
  valid,
}
