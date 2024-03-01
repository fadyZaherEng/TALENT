// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_resume_duty_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty_details/resume_duty_details_event.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty_details/resume_duty_details_state.dart';

class ResumeDutyDetailsBloc extends Bloc<
    ResumeDutyDetailsEvent, ResumeDutyDetailsState> {
  final GetResumeDutyDetailsUseCase _getResumeDutyDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  ResumeDutyDetailsBloc(
    this._getResumeDutyDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(ResumeDutyDetailsInitialState()) {
    on<GetResumeDutyDetailsEvent>(_onRequstDetailsGetResumeDutyEvent);
    on<ResumeDutyDetailsApproveEvent>(
        _onRequstDetailsGetResumeDutyApproveEvent);
    on<ResumeDutyDetailsRejectEvent>(
        _onRequstDetailsGetResumeDutyRejectEvent);
  }

  FutureOr<void> _onRequstDetailsGetResumeDutyEvent(
      GetResumeDutyDetailsEvent event,
      Emitter<ResumeDutyDetailsState> emit) async {
    emit(ResumeDutyDetailsLoadingState());
    DataState dataState = await _getResumeDutyDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetResumeDutyDetails>) {
      emit(GetResumeDutyDetailsSuccessState(dataState.data!));
    } else {
      emit(ResumeDutyDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsGetResumeDutyRejectEvent(
      ResumeDutyDetailsRejectEvent event,
      Emitter<ResumeDutyDetailsState> emit) async {
    emit(ResumeDutyDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(ResumeDutyDetailsHideLoadingState());
      emit(ResumeDutyDetailsRejectSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(ResumeDutyDetailsHideLoadingState());
      emit(ResumeDutyDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsGetResumeDutyApproveEvent(
      ResumeDutyDetailsApproveEvent event,
      Emitter<ResumeDutyDetailsState> emit) async {
    emit(ResumeDutyDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(ResumeDutyDetailsHideLoadingState());
      emit(ResumeDutyDetailsApproveSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(ResumeDutyDetailsHideLoadingState());
      emit(ResumeDutyDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }
}
