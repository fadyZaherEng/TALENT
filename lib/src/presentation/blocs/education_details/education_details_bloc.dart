import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';
import 'package:talent_link/src/domain/usecase/education_details/get_education_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';

part 'education_details_event.dart';

part 'education_details_state.dart';

class EducationDetailsBloc
    extends Bloc<EducationDetailsEvent, EducationDetailsState> {
  final GetEducationDetailsUseCase _getEducationDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  EducationDetailsBloc(this._getEducationDetailsUseCase,
      this._approveRequestUseCase, this._rejectRequestUseCase)
      : super(EducationDetailsInitialState()) {
    on<GetEducationDetailsEvent>(_onGetEducationDetailsEvent);
    on<EducationDetailsApproveEvent>(_onEducationDetailsApproveEvent);
    on<EducationDetailsRejectEvent>(_onEducationDetailsRejectEvent);
  }

  FutureOr<void> _onGetEducationDetailsEvent(GetEducationDetailsEvent event,
      Emitter<EducationDetailsState> emit) async {
    DataState dataState =
        await _getEducationDetailsUseCase(transactionId: event.transactionId);
    if (dataState is DataSuccess<EducationDetails>) {
      emit(EducationDetailsSuccessState(educationDetails: dataState.data!));
    } else {
      emit(EducationDetailsErrorState(
          errorMessage: dataState.message!.toString()));
    }
  }

  FutureOr<void> _onEducationDetailsApproveEvent(
      EducationDetailsApproveEvent event,
      Emitter<EducationDetailsState> emit) async {
    emit(EducationDetailsLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(EducationDetailsApproveSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(EducationDetailsApproveErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onEducationDetailsRejectEvent(
      EducationDetailsRejectEvent event,
      Emitter<EducationDetailsState> emit) async {
    emit(EducationDetailsLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(EducationDetailsRejectSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(EducationDetailsRejectErrorState(
          errorMessage: dataState.message.toString()));
    }
  }
}
