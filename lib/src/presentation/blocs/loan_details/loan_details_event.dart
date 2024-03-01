part of 'loan_details_bloc.dart';

@immutable
abstract class LoanDetailsEvent {}

class GetLoanDetailsEvent extends LoanDetailsEvent {
 final  int transactionId;

  GetLoanDetailsEvent({required this.transactionId});
}

class LoanDetailsApproveEvent extends LoanDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  LoanDetailsApproveEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}

class LoanDetailsRejectEvent extends LoanDetailsEvent {
  final int transactionId;
  final int employeeId;
  final int referenceId;

  LoanDetailsRejectEvent({
    required this.transactionId,
    required this.employeeId,
    required this.referenceId,
  });
}
