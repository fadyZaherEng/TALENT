// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_loan_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'loan_details_state.dart';

part 'loan_details_event.dart';

class LoanDetailsBloc extends Bloc<LoanDetailsEvent, LoanDetailsState> {
  final GetLoanDetailsUseCase _getLoanDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  LoanDetailsBloc(
    this._getLoanDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(RequestDetailsLoanInitial()) {
    on<GetLoanDetailsEvent>(_onGetLoanDetailsEvent);
    on<LoanDetailsApproveEvent>(_onLoanDetailsApproveEvent);
    on<LoanDetailsRejectEvent>(_onLoanDetailsRejectEvent);
  }

  FutureOr<void> _onGetLoanDetailsEvent(
      GetLoanDetailsEvent event, Emitter<LoanDetailsState> emit) async {
    emit(RequstDetailsLoanLoadingState());
    DataState dataState = await _getLoanDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetLoanDetails>) {
      emit(RequstDetailsLoanSuccessState(dataState.data!));
    } else {
      emit(RequstDetailsLoanErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onLoanDetailsRejectEvent(
      LoanDetailsRejectEvent event, Emitter<LoanDetailsState> emit) async {
    emit(RequestDetailsLoanShowLoading());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(RequestDetailsLoanHideLoading());
      emit(RequstDetailsLoanRejectState(dataState));
    } else if (dataState is DataFailed) {
      emit(RequestDetailsLoanHideLoading());
      emit(RequstDetailsLoanErrorState(errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onLoanDetailsApproveEvent(
      LoanDetailsApproveEvent event, Emitter<LoanDetailsState> emit) async {
    emit(RequestDetailsLoanShowLoading());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(RequestDetailsLoanHideLoading());
      emit(RequstDetailsLoanApproveState(dataState));
    } else if (dataState is DataFailed) {
      emit(RequestDetailsLoanHideLoading());
      emit(RequstDetailsLoanErrorState(errorMSG: dataState.message.toString()));
    }
  }
}
