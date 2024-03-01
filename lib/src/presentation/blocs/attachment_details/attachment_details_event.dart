part of 'attachment_details_bloc.dart';

@immutable
abstract class AttachmentDetailsEvent {}

class GetAttachmentDetailsEvent extends AttachmentDetailsEvent {
  final int transactionId;

  GetAttachmentDetailsEvent({required this.transactionId});
}

class AttachmentDetailsApproveEvent extends AttachmentDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  AttachmentDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class AttachmentDetailsRejectEvent extends AttachmentDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  AttachmentDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
