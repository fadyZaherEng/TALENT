part of 'attachment_details_bloc.dart';

@immutable
abstract class AttachmentDetailsState {}

class AttachmentDetailsInitialState extends AttachmentDetailsState {}

class AttachmentDetailsLoadingState extends AttachmentDetailsState {}

class AttachmentDetailsSuccessState extends AttachmentDetailsState {
  final AttachmentDetails attachmentDetails;

  AttachmentDetailsSuccessState({required this.attachmentDetails});
}

class AttachmentDetailsErrorState extends AttachmentDetailsState {
  final String errorMessage;

  AttachmentDetailsErrorState({required this.errorMessage});
}

class AttachmentDetailsApproveSuccessState extends AttachmentDetailsState {
  final DataSuccess dataSuccess;

  AttachmentDetailsApproveSuccessState({required this.dataSuccess});
}

class AttachmentDetailsApproveErrorState extends AttachmentDetailsState {
  final String errorMessage;

  AttachmentDetailsApproveErrorState({required this.errorMessage});
}

class AttachmentDetailsRejectSuccessState extends AttachmentDetailsState {
  final DataSuccess dataSuccess;

  AttachmentDetailsRejectSuccessState({required this.dataSuccess});
}

class AttachmentDetailsRejectErrorState extends AttachmentDetailsState {
  final String errorMessage;

  AttachmentDetailsRejectErrorState({required this.errorMessage});
}
