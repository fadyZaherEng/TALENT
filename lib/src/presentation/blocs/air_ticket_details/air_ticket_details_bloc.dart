// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/git_air_ticket_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_air_ticket_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket_details/air_ticket_details_state.dart';

part 'air_ticket_details_event.dart';

class AirTicketDetailsBloc
    extends Bloc<AirTicketDetailsEvent, AirTicketDetailsState> {
  final GetAirTicketDetailsUseCase _getAirTicketDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  AirTicketDetailsBloc(
    this._getAirTicketDetailsUseCase,
    this._rejectRequestUseCase,
    this._approveRequestUseCase,
  ) : super(GetAirTicketDetailsInitial()) {
    on<GetAirTicketDetailsEvent>(_onRequstDetailsGetAirTicketEvent);
    on<AirTicketApproveDetailsEvent>(_onRequstDetailsGetAirTicketApproveEvent);
    on<AirTicketDetailsRejectEvent>(_onRequstDetailsGetAirTicketRejectEvent);
  }

  FutureOr<void> _onRequstDetailsGetAirTicketEvent(
      GetAirTicketDetailsEvent event,
      Emitter<AirTicketDetailsState> emit) async {
    emit(GetAirTicketDetailsLoadingState());
    DataState dataState = await _getAirTicketDetailsUseCase(
      transactionId: event.transactionId,
    );
    if (dataState is DataSuccess<GetAirTicketDetails>) {
      emit(GetAirTicketDetailsSuccessState(dataState.data!));
    } else {
      emit(GetAirTicketDetailsErrorDataState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsGetAirTicketRejectEvent(
      AirTicketDetailsRejectEvent event,
      Emitter<AirTicketDetailsState> emit) async {
    emit(AirTicketDetailsShowLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AirTicketDetailsHideLoadingState());
      emit(AirTicketDetailsRejectSuccessState(dataState));
    } else {
      emit(AirTicketDetailsHideLoadingState());
      emit(GetAirTicketDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }

  FutureOr<void> _onRequstDetailsGetAirTicketApproveEvent(
      AirTicketApproveDetailsEvent event,
      Emitter<AirTicketDetailsState> emit) async {
    emit(AirTicketDetailsShowLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AirTicketDetailsHideLoadingState());
      emit(AirTicketDetailsApproveSuccessState(dataState));
    } else if (dataState is DataFailed) {
      emit(AirTicketDetailsHideLoadingState());
      emit(GetAirTicketDetailsErrorState(
          errorMSG: dataState.message.toString()));
    }
  }
}
