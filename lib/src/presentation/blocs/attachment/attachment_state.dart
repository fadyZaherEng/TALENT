part of 'attachment_bloc.dart';

@immutable
abstract class AttachmentState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

//check if enter data filling
class AttachmentDataFillingSuccessState extends AttachmentState {}

class AttachmentDataFillingErrorState extends AttachmentState {}

class AttachmentInitialState extends AttachmentState {}

class AttachmentLoadingState extends AttachmentState {}

class AttachmentBackState extends AttachmentState {}

class GetAttachmentTypeSuccessState extends AttachmentState {
  final List<RequestType> attachmentTypes;

  GetAttachmentTypeSuccessState({required this.attachmentTypes});
}

class GetAttachmentTypeErrorState extends AttachmentState {
  final String errorMessage;

  GetAttachmentTypeErrorState({
    required this.errorMessage,
  });
}

class OpenAttachmentTypeBottomSheetState extends AttachmentState {}

class ValidationAttachmentTypeValidState extends AttachmentState {
  final RequestType attachmentType;

  ValidationAttachmentTypeValidState({required this.attachmentType});
}

class ValidationAttachmentTypeNotValidState extends AttachmentState {
  final String validationMessage;

  ValidationAttachmentTypeNotValidState({required this.validationMessage});
}

class AttachmentValidationDocumentNoNotValidState extends AttachmentState {
  final String validationMessage;

  AttachmentValidationDocumentNoNotValidState(
      {required this.validationMessage});
}

class AttachmentValidationDocumentNoValidState extends AttachmentState {}

class AttachmentValidationIssueDateNotValidState extends AttachmentState {
  final String validationMessage;

  AttachmentValidationIssueDateNotValidState({
    required this.validationMessage,
  });
}

class AttachmentValidationIssueDateValidState extends AttachmentState {}

class AttachmentOpenUploadFileBottomSheetState extends AttachmentState {}

class AttachmentValidationFileNotValidState extends AttachmentState {
  final String validationMessage;

  AttachmentValidationFileNotValidState({
    required this.validationMessage,
  });
}

class AttachmentValidationFileValidState extends AttachmentState {
  final String filePath;
  AttachmentValidationFileValidState({required this.filePath});
}

class AttachmentSubmitSuccessState extends AttachmentState {
  final String successMessage;
  AttachmentSubmitSuccessState({required this.successMessage});
}

class AttachmentSubmitErrorState extends AttachmentState {
  final String errorMessage;
  AttachmentSubmitErrorState({required this.errorMessage});
}

class AttachmentOpenCameraState extends AttachmentState {}

class AttachmentOpenGalleryState extends AttachmentState {}

class AttachmentOpenFileState extends AttachmentState {}
class AttachmentSelectExpireDateState extends AttachmentState {
  final String value;
  AttachmentSelectExpireDateState({required this.value});
}
