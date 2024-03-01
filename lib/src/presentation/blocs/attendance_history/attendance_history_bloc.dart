import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/request/attendance_history_request.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';
import 'package:talent_link/src/domain/usecase/attendance_history/get_attendance_history_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';

part 'attendance_history_event.dart';

part 'attendance_history_state.dart';

class AttendanceHistoryBloc
    extends Bloc<AttendanceHistoryEvent, AttendanceHistoryState> {
  final GetAttendanceHistoryUseCase _attendanceHistoryUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;

  AttendanceHistoryBloc(
      this._attendanceHistoryUseCase, this._getEmployeeIdUseCase)
      : super(AttendanceHistorySkeletonState()) {
    on<AttendanceHistoryBackEvent>(_onAttendanceHistoryBackEvent);
    on<GetAttendanceHistoryEvent>(_onGetAttendanceHistoryEvent);
  }

  List<AttendanceHistory> _attendanceHistories = [];

  FutureOr<void> _onAttendanceHistoryBackEvent(
      AttendanceHistoryBackEvent event, Emitter<AttendanceHistoryState> emit) {
    emit(AttendanceHistoryBackState());
  }

  FutureOr<void> _onGetAttendanceHistoryEvent(GetAttendanceHistoryEvent event,
      Emitter<AttendanceHistoryState> emit) async {
    emit(AttendanceHistorySkeletonState());
    DataState dataState = await _attendanceHistoryUseCase.call(
        attendanceHistoryRequest: AttendanceHistoryRequest(
          employeeId: await _getEmployeeIdUseCase() ?? 0,
          month: event.attendanceHistoryRequest.month,
          year: event.attendanceHistoryRequest.year

        ));
    if (dataState is DataSuccess<List<AttendanceHistory>>) {
      _attendanceHistories = dataState.data ?? [];
      emit(GetAttendanceHistorySuccessState(
          attendanceHistories: _attendanceHistories));
    } else {
      emit(GetAttendanceHistoryErrorState(
          errorMessage: dataState.error?.message.toString() ?? ""));
    }
  }
}
