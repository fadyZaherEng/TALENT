// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_indemnity_encashment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment_details/idemnity_encashment_details_state.dart';
import 'idemnity_encashment_details_event.dart';

class IndemnityEncashmentDetailsBloc extends Bloc<
    IndemnityEncashmentDetailsEvent, IndemnityEncashmentDetailsState> {
  final GetIndemnityEncashmentDetailsUseCase
      _getIndemnityEncashmentDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  IndemnityEncashmentDetailsBloc(
    this._getIndemnityEncashmentDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(IndemnityEncashmentDetailsInitialState()) {
    on<GetIndemnityEncashmentDetailsEvent>(
        _onGetIndemnityEncashmentDetailsEvent);
    on<IndemnityEncashmentDetailsApproveEvent>(
        _onIndemnityEncashmentDetailsApproveEvent);
    on<IndemnityEncashmentDetailsRejectEvent>(
        _onIndemnityEncashmentDetailsRejectEvent);
  }

  FutureOr<void> _onGetIndemnityEncashmentDetailsEvent(
      GetIndemnityEncashmentDetailsEvent event,
      Emitter<IndemnityEncashmentDetailsState> emit) async {
    emit(IndemnityEncashmentDetailsLoadingState());
    DataState dataState = await _getIndemnityEncashmentDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetIndemnityEncashmentDetails>) {
      emit(GetIndemnityEncashmentDetailsSuccessState(dataState.data!));
    } else {
      emit(GetIndemnityEncashmentDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onIndemnityEncashmentDetailsRejectEvent(
      IndemnityEncashmentDetailsRejectEvent event,
      Emitter<IndemnityEncashmentDetailsState> emit) async {
    emit(IndemnityEncashmentDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(IndemnityEncashmentDetailsHideLoadingState());
      emit(IndemnityEncashmentDetailsRejectSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(IndemnityEncashmentDetailsHideLoadingState());
      emit(GetIndemnityEncashmentDetailsErrorDataState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onIndemnityEncashmentDetailsApproveEvent(
      IndemnityEncashmentDetailsApproveEvent event,
      Emitter<IndemnityEncashmentDetailsState> emit) async {
    emit(IndemnityEncashmentDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(IndemnityEncashmentDetailsHideLoadingState());
      emit(IndemnityEncashmentDetailsApproveSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(IndemnityEncashmentDetailsHideLoadingState());
      emit(GetIndemnityEncashmentDetailsErrorDataState(
          errorMSG: dataState.message.toString()));
    }
  }
}
