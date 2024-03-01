part of 'education_details_bloc.dart';

@immutable
abstract class EducationDetailsEvent {}

class GetEducationDetailsEvent extends EducationDetailsEvent {
  final int transactionId;

  GetEducationDetailsEvent({required this.transactionId});
}


class EducationDetailsApproveEvent extends EducationDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  EducationDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class EducationDetailsRejectEvent extends EducationDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  EducationDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}


