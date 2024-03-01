// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_leave_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/leave_details/leave_details_state.dart';

part 'leave_details_event.dart';

class LeaveDetailsBloc
    extends Bloc<LeaveDetailsEvent, LeaveDetailsState> {
  final GetLeaveDetailsUseCase _getLeaveDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  LeaveDetailsBloc(
    this._getLeaveDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(LeaveDetailsInitialState()) {
    on<GetLeaveDetailsEvent>(_onRequstDetailsLeaveEvent);
    on<LeaveDetailsApproveEvent>(_onRequstDetailsLeaveApproveEvent);
    on<LeaveDetailsRejectEvent>(_onRequestDetailsLeaveRejectEvent);
    on<LeaveDetailsPopEvent>(_onRequestDetailsLeavePopEvent);
  }

  FutureOr<void> _onRequstDetailsLeaveEvent(GetLeaveDetailsEvent event,
      Emitter<LeaveDetailsState> emit) async {
    emit(LeaveDetailsLoadingState());
    DataState dataState = await _getLeaveDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetLeaveDetails>) {
      emit(GetLeaveDetailsSuccessState(dataState.data!));
    } else {
      emit(LeaveDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onRequestDetailsLeaveRejectEvent(
      LeaveDetailsRejectEvent event,
      Emitter<LeaveDetailsState> emit) async {
      emit(LeaveDetailsShowLoadingState());
      DataState dataState = await _rejectRequestUseCase(
        transactionId: event.transactionId,
        requestTypeId: event.referenceId,
        employeeId: event.employeeId,
      );
      if (dataState is DataSuccess) {
        emit(LeaveDetailsHideLoadingState());
        emit(LeaveDetailsRejectState(dataState));
      } else if (dataState is DataFailed) {
        emit(LeaveDetailsHideLoadingState());
        emit(LeaveDetailsErrorState(
            errorMSG: dataState.message.toString()));
      }

  }

  FutureOr<void> _onRequstDetailsLeaveApproveEvent(
      LeaveDetailsApproveEvent event,
      Emitter<LeaveDetailsState> emit) async {
    emit(LeaveDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(LeaveDetailsHideLoadingState());
      emit(LeaveDetailsApproveState(dataState));
    } else if (dataState is DataFailed) {
      emit(LeaveDetailsHideLoadingState());
      emit(LeaveDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }


  FutureOr<void> _onRequestDetailsLeavePopEvent(
      LeaveDetailsPopEvent event,
      Emitter<LeaveDetailsState> emit) {
    emit(LeaveDetailsPopState());
  }
}
