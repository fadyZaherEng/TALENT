part of 'attachment_bloc.dart';

@immutable
abstract class AttachmentEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AttachmentBackEvent extends AttachmentEvent {}

class AttachmentDataFillingEvent extends AttachmentEvent {
  AttachmentController attachmentController;
  String issueDate;
  String expireDate;
  String filePath;

  AttachmentDataFillingEvent({
    required this.attachmentController,
    required this.expireDate,
    required this.issueDate,
    required this.filePath,
  });
}

class GetAttachmentTypeEvent extends AttachmentEvent {}

class OpenAttachmentTypeBottomSheetEvent extends AttachmentEvent {}

class ValidationAttachmentTypeEvent extends AttachmentEvent {
  final RequestType attachmentType;

  ValidationAttachmentTypeEvent({required this.attachmentType});
}

class AttachmentValidationDocumentNumberEvent extends AttachmentEvent {
  final String value;

  AttachmentValidationDocumentNumberEvent({required this.value});
}

class AttachmentValidationIssueDateEvent extends AttachmentEvent {
  final String value;

  AttachmentValidationIssueDateEvent({required this.value});
}
class AttachmentSelectExpireDateEvent extends AttachmentEvent{
  final String value;

  AttachmentSelectExpireDateEvent({required this.value});
}

class AttachmentOpenUploadFileBottomSheetEvent extends AttachmentEvent {}

class AttachmentValidationFileEvent extends AttachmentEvent {
  final String filePath;

  AttachmentValidationFileEvent({
    required this.filePath,
  });
}

class AttachmentSubmitEvent extends AttachmentEvent {
  final AttachmentController attachmentController;
  final String filePath;
  final String issueDate;
  final String expiryDate;
  final int attachmentTypeId;

  AttachmentSubmitEvent({
    required this.filePath,
    required this.issueDate,
    required this.attachmentController,
    required this.expiryDate,
    required this.attachmentTypeId,
  });
}

class AttachmentOpenCameraEvent extends AttachmentEvent {}

class AttachmentOpenGalleryEvent extends AttachmentEvent {}

class AttachmentOpenFileEvent extends AttachmentEvent {}
