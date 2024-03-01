import 'package:talent_link/src/core/utils/validation/attachment_validator.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_controller.dart';

class AttachmentValidationUseCase {
  List<AttachmentValidationState> validateFormUseCase({
    required AttachmentController attachmentController,
    required String issueDate,
    required String file,
  }) {
    List<AttachmentValidationState> validations = List.empty(growable: true);
    AttachmentValidationState validation;
    validation = validateFile(file.trim());
    if (validation != AttachmentValidationState.valid) {
      validations.add(validation);
    }
    validation = validateIssueDate(issueDate.trim());
    if (validation != AttachmentValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateDocumentNo(attachmentController.documentNo.text.trim());
    if (validation != AttachmentValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateAttachmentType(attachmentController.attachmentType.text.trim());
    if (validation != AttachmentValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  AttachmentValidationState validateAttachmentType(String attachmentType) {
    return AttachmentValidator.validateAttachmentType(
      attachmentType,
    );
  }

  AttachmentValidationState validateDocumentNo(String documentNo) {
    return AttachmentValidator.validateDocumentNo(
      documentNo,
    );
  }

  AttachmentValidationState validateIssueDate(String issueDate) {
    return AttachmentValidator.validateIssueDate(
      issueDate,
    );
  }

  AttachmentValidationState validateFile(String file) {
    return AttachmentValidator.validateFile(
      file,
    );
  }
}
