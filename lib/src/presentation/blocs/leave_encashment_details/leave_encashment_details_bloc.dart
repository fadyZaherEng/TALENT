// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/get_leave_encashment_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_leave_encashment_details.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';

part 'leave_encashment_details_event.dart';
part 'leave_encashment_details_state.dart';

class LeaveEncashmentDetailsBloc
    extends Bloc<LeaveEncashmentDetailsEvent, LeaveEncashmentDetailsState> {
  final GetLeaveEncashmentDetailsUseCase _getLeaveEncashmentDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  LeaveEncashmentDetailsBloc(
    this._getLeaveEncashmentDetailsUseCase,
    this._approveRequestUseCase,
    this._rejectRequestUseCase,
  ) : super(LeaveEncashmentDetailsInitialState()) {
    on<GetLeaveEncashmentDetailsEvent>(_onRequstDetailsEncashmentEvent);
    on<LeaveEncashmentDetailsApproveEvent>(
        _onRequstDetailsEncashmentApproveEvent);
    on<LeaveEncashmentDetailsRejectEvent>(
        _onRequstDetailsEncashmentRejectEvent);
  }

  FutureOr<void> _onRequstDetailsEncashmentEvent(
      GetLeaveEncashmentDetailsEvent event,
      Emitter<LeaveEncashmentDetailsState> emit) async {
    emit(LeaveEncashmentDetailsLoadingState());
    DataState dataState = await _getLeaveEncashmentDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetLeaveEncashmentDetails>) {
      emit(GetLeaveEncashmentDetailsSuccessState(
          getLeaveEncashmentDetails: dataState.data!));
    } else {
      emit(LeaveEncashmentDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsEncashmentApproveEvent(
      LeaveEncashmentDetailsApproveEvent event,
      Emitter<LeaveEncashmentDetailsState> emit) async {
    emit(LeaveEncashmentDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      employeeId: event.employeeId,
      requestTypeId: event.referenceId,
    );
    if (dataState is DataSuccess) {
      emit(LeaveEncashmentDetailsHideLoadingState());
      emit(LeaveEncashmentDetailsApproveState(dataState));
    } else if (dataState is DataFailed) {
      emit(LeaveEncashmentDetailsHideLoadingState());
      emit(LeaveEncashmentDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsEncashmentRejectEvent(
      LeaveEncashmentDetailsRejectEvent event,
      Emitter<LeaveEncashmentDetailsState> emit) async {
    emit(LeaveEncashmentDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      employeeId: event.employeeId,
      requestTypeId: event.referenceId,
    );
    if (dataState is DataSuccess) {
      emit(LeaveEncashmentDetailsHideLoadingState());
      emit(LeaveEncashmentDetailsRejectState(dataState));
    } else if (dataState is DataFailed) {
      emit(LeaveEncashmentDetailsHideLoadingState());
      emit(LeaveEncashmentDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }
}
