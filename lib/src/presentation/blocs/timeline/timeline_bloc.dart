import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';
import 'package:talent_link/src/domain/entities/timeline/timeline.dart';
import 'package:talent_link/src/domain/usecase/get_time_line/get_time_line_use_case.dart';

part 'timeline_event.dart';

part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  final GetTimeLineUseCase _getTimeLineUseCase;

  TimelineBloc(this._getTimeLineUseCase) : super(TimelineInitialState()) {
    on<TimelineBackEvent>(_onTimelineBackEvent);
    on<GetTimelineEvent>(_onGetTimelineEvent);
  }

  List<GetTimeLine> _timelines = [];

  FutureOr<void> _onTimelineBackEvent(
      TimelineBackEvent event, Emitter<TimelineState> emit) {
    emit(TimelineBackState());
  }

  FutureOr<void> _onGetTimelineEvent(
      GetTimelineEvent event, Emitter<TimelineState> emit) async {
    emit(GetTimeLineSkeletonState());

    DataState dataState = await _getTimeLineUseCase(
        tableId: event.timeline.tableId,
        transactionId: event.timeline.transactionId,
        baseUrl: event.timeline.baseUrl);
    if (dataState is DataSuccess<List<GetTimeLine>>) {
      _timelines = dataState.data!;
      emit(GetTimeLineSuccessState(timelines: _timelines));
    } else {
      emit(GetTimeLineErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }
}
