import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';

@immutable
abstract class LoanDetailsState {}

class RequestDetailsLoanInitial extends LoanDetailsState {}

class RequestDetailsLoanShowLoading extends LoanDetailsState {}

class RequestDetailsLoanHideLoading extends LoanDetailsState {}

class RquestDetailsLoanInitial extends LoanDetailsState {}

class RequstDetailsLoanLoadingState extends LoanDetailsState {}

class RequstDetailsLoanSuccessState extends LoanDetailsState {
  GetLoanDetails getLoanDetails;

  RequstDetailsLoanSuccessState(this.getLoanDetails);
}

class RequstDetailsLoanErrorState extends LoanDetailsState {
  String errorMSG;

  RequstDetailsLoanErrorState({
    required this.errorMSG,
  });
}

class RequstDetailsLoanErrorDataState extends LoanDetailsState {
  String errorMSG;

  RequstDetailsLoanErrorDataState({
    required this.errorMSG,
  });
}

class RequstDetailsLoanApproveState extends LoanDetailsState {
  DataSuccess dataSuccess;

  RequstDetailsLoanApproveState(this.dataSuccess);
}

class RequstDetailsLoanRejectState extends LoanDetailsState {
  DataSuccess dataSuccess;

  RequstDetailsLoanRejectState(this.dataSuccess);
}
