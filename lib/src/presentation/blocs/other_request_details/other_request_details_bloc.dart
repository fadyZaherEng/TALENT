import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/other_request_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_other_request_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/other_request_details/other_request_details_state.dart';

part 'other_request_details_event.dart';

class OtherRequestDetailsBloc extends Bloc<
    OtherRequestDetailsEvent, OtherRequestDetailsState> {
  final GetOtherRequestDetailsUseCase _getOtherRequestDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  OtherRequestDetailsBloc(
    this._getOtherRequestDetailsUseCase,
    this._approveRequestUseCase,
    this._rejectRequestUseCase,
  ) : super(OtherRequestDetailsInitialState()) {
    on<GetOtherRequestDetailsEvent>(_onRequstDetailsOtherRequestEvent);
    on<OtherRequestDetailsApproveEvent>(
        _onRequstDetailsOtherRequestApproveEvent);
    on<OtherRequestDetailsRejectEvent>(
        _onRequstDetailsOtherRequestRejectEvent);
  }

  FutureOr<void> _onRequstDetailsOtherRequestEvent(
      GetOtherRequestDetailsEvent event,
      Emitter<OtherRequestDetailsState> emit) async {
    emit(OtherRequestDetailsLoadingState());
    DataState dataState = await _getOtherRequestDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetOtherRequestDetails>) {
      emit(GetOtherRequestDetailsSuccessState(dataState.data!));
    } else {
      emit(GetOtherRequestDetailsErrorDataState(
          errorMSG: dataState.error.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsOtherRequestApproveEvent(
      OtherRequestDetailsApproveEvent event,
      Emitter<OtherRequestDetailsState> emit) async {
    emit(OtherRequestDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(OtherRequestDetailsHideLoadingState());
      emit(OtherRequestApproveSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(OtherRequestDetailsHideLoadingState());
      emit(GetOtherRequestDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsOtherRequestRejectEvent(
      OtherRequestDetailsRejectEvent event,
      Emitter<OtherRequestDetailsState> emit) async {
    emit(OtherRequestDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(OtherRequestDetailsHideLoadingState());
      emit(OtherRequestRejectSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(OtherRequestDetailsHideLoadingState());
      emit(GetOtherRequestDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }
}
