// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_short_leave_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/short_leave_details/short_leave_details_state.dart';

part 'short_leave_details_event.dart';

class ShortLeaveDetailsBloc
    extends Bloc<ShortLeaveDetailsEvent, ShortLeaveDetailsState> {
  final GetShortLevelDetailsUseCase _getShortLevelDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  ShortLeaveDetailsBloc(
    this._getShortLevelDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(ShortLeaveDetailsInitialState()) {
    on<GetShortLeaveDetailsEvent>(_onRequstDetailsShortLeaveEvent);
    on<ShortLeaveDetailsApproveEvent>(_onRequstDetailsShortLeaveApproveEvent);
    on<ShortLeaveDetailsRejectEvent>(_onRequstDetailsShortLeaveRejectEvent);
  }

  FutureOr<void> _onRequstDetailsShortLeaveEvent(
      GetShortLeaveDetailsEvent event,
      Emitter<ShortLeaveDetailsState> emit) async {
    emit(ShortLeaveDetailsLoadingState());
    DataState dataState = await _getShortLevelDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetShortLevelDetails>) {
      emit(GetShortLeaveDetailsSuccessState(dataState.data!));
    } else {
      emit(ShortLeaveDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsShortLeaveApproveEvent(
      ShortLeaveDetailsApproveEvent event,
      Emitter<ShortLeaveDetailsState> emit) async {
    emit(ShortLeaveDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      employeeId: event.employeeId,
      requestTypeId: event.referenceId,
    );
    if (dataState is DataSuccess) {
      emit(ShortLeaveDetailsHideLoadingState());
      emit(ShortLeaveDetailsApproveState(dataState));
    } else if (dataState is DataFailed) {
      emit(ShortLeaveDetailsHideLoadingState());
      emit(ShortLeaveDetailsErrorState(errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsShortLeaveRejectEvent(
      ShortLeaveDetailsRejectEvent event,
      Emitter<ShortLeaveDetailsState> emit) async {
    emit(ShortLeaveDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      employeeId: event.employeeId,
      requestTypeId: event.referenceId,
    );
    if (dataState is DataSuccess) {
      emit(ShortLeaveDetailsHideLoadingState());
      emit(ShortLeaveDetailsRejectState(dataState));
    } else if (dataState is DataFailed) {
      emit(ShortLeaveDetailsHideLoadingState());
      emit(ShortLeaveDetailsErrorState(errorMSG: dataState.message.toString()));
    }
  }
}
