// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/half_day_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_half_day_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/half_day_details/half_day_details_event.dart';
import 'package:talent_link/src/presentation/blocs/half_day_details/half_day_details_state.dart';

class HalfDayDetailsBloc
    extends Bloc<HalfDayDetailsEvent, HalfDayDetailsState> {
  final GetHalfDayDetailsUseCase _getHalfDayDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  HalfDayDetailsBloc(
    this._getHalfDayDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(HalfDayDetailsInitialState()) {
    on<GetHalfDayDetailsEvent>(_onGetHalfDayDetailsEvent);
    on<HalfDayDetailsApproveEvent>(_onHalfDayDetailsApproveEvent);
    on<HalfDayDetailsRejectEvent>(_onHalfDayDetailsRejectEvent);
  }

  FutureOr<void> _onGetHalfDayDetailsEvent(
      GetHalfDayDetailsEvent event, Emitter<HalfDayDetailsState> emit) async {
    emit(HalfDayDetailsLoadingState());
    DataState dataState = await _getHalfDayDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetHalfDayLeaveDetails>) {
      emit(GetHalfDayDetailsSuccessState(dataState.data!));
    } else {
      emit(GetHalfDayDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onHalfDayDetailsRejectEvent(HalfDayDetailsRejectEvent event,
      Emitter<HalfDayDetailsState> emit) async {
    emit(HalfDayDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(HalfDayDetailsHideLoadingState());
      emit(HalfDayDetailsRejectSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(HalfDayDetailsHideLoadingState());
      emit(GetHalfDayDetailsErrorDataState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onHalfDayDetailsApproveEvent(HalfDayDetailsApproveEvent event,
      Emitter<HalfDayDetailsState> emit) async {
    emit(HalfDayDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(HalfDayDetailsHideLoadingState());
      emit(HalfDayDetailsApproveSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(HalfDayDetailsHideLoadingState());
      emit(GetHalfDayDetailsErrorDataState(
          errorMSG: dataState.message.toString()));
    }
  }
}
