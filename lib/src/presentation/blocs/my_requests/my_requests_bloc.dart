import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request_filter.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/timeline/timeline.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/cancel_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_all_requests_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_employee_requests_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_transaction_status_use_case.dart';

part 'my_requests_event.dart';

part 'my_requests_state.dart';

class MyRequestsBloc extends Bloc<MyRequestsEvent, MyRequestsState> {
  final GetEmployeeRequestsUseCase _getEmployeeRequestsUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final CancelRequestUseCase _cancelRequestUseCase;
  final GetAllRequestsListUseCase _getAllRequestsListUseCase;
  final GetTransactionStatusUseCase _getTransactionStatusUseCase;

  MyRequestsBloc(
    this._getEmployeeRequestsUseCase,
    this._getEmployeeIdUseCase,
    this._cancelRequestUseCase,
    this._getAllRequestsListUseCase,
    this._getTransactionStatusUseCase,
  ) : super(MyRequestsInitialState()) {
    on<GetMyRequestsEvent>(_onGetMyRequestsEvent);
    on<MyRequestsBackEvent>(_onMyRequestsBackEvent);
    on<OpenMyRequestFilterBottomSheetEvent>(
        _onOpenMyRequestFilterBottomSheetEvent);
    on<ApplyFilterMyRequestsEvent>(_onApplyFilterMyRequestsEvent);
    on<GetMyRequestsFilterEvent>(_onGetMyRequestsFilterEvent);
    on<CancelRequestEvent>(_onCancelRequestEvent);
    on<GetAllRequestsListEvent>(_onGetAllRequestsListEvent);
    on<GetTransactionStatusEvent>(_onGetTransactionStatusEvent);
    on<MyRequestsNavigationToTimelineScreenEvent>(
        _onMyRequestsNavigationToTimelineScreenEvent);

  }

  List<MyRequest> _myRequests = [];

  final MyRequestFilter _myRequestFilter = MyRequestFilter(
      requests: [],
      fromRequestedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
      toCreatedDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      fromCreatedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
      toRequestedDate:
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      status: [],
      fromCreatedDateErrorMessage: null,
      fromRequestedDateErrorMessage: null,
      toCreatedDateErrorMessage: null,
      toRequestedDateErrorMessage: null);

  List<RequestType> _requests = [];

  List<RequestType> _status = [];

  FutureOr<void> _onGetMyRequestsEvent(
      GetMyRequestsEvent event, Emitter<MyRequestsState> emit) async {
    emit(GetMyRequestsSkeletonState());
    int transactionStatusId = 0;
    int requestTypeId = 0;
    event.myRequestFilter.status?.forEach((element) {
      if (element.isSelected) {
        transactionStatusId = element.id;
      }
    });
    event.myRequestFilter.requests?.forEach((element) {
      if (element.isSelected) {
        requestTypeId = element.id;
      }
    });
    DataState dataState = await _getEmployeeRequestsUseCase(
        requestTypeId: requestTypeId,
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        createdDateAt:
            event.myRequestFilter.toCreatedDate.toString().split(" ")[0],
        createdDateFrom:
            event.myRequestFilter.fromCreatedDate.toString().split(" ")[0],
        requestDataId: 0,
        requestFromDate:
            event.myRequestFilter.fromRequestedDate.toString().split(" ")[0],
        requestToDate:
            event.myRequestFilter.toRequestedDate.toString().split(" ")[0],
        transactionStatusId: transactionStatusId);
    if (dataState is DataSuccess<List<MyRequest>>) {
      _myRequests = dataState.data ?? [];
      emit(GetMyRequestsSuccessState(myRequests: _myRequests));
    } else {
      emit(GetMyRequestsErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onMyRequestsBackEvent(
      MyRequestsBackEvent event, Emitter<MyRequestsState> emit) {
    emit(MyRequestsBackState());
  }

  FutureOr<void> _onOpenMyRequestFilterBottomSheetEvent(
      OpenMyRequestFilterBottomSheetEvent event,
      Emitter<MyRequestsState> emit) {
    emit(OpenMyRequestFilterBottomSheetState());
  }

  FutureOr<void> _onApplyFilterMyRequestsEvent(
      ApplyFilterMyRequestsEvent event, Emitter<MyRequestsState> emit) {
    emit(ApplyFilterMyRequestsState(myRequestFilter: event.myRequestFilter));
  }

  FutureOr<void> _onGetMyRequestsFilterEvent(
      GetMyRequestsFilterEvent event, Emitter<MyRequestsState> emit) async {
    _myRequestFilter.status = _status;
    MyRequestFilter copy = _myRequestFilter.copy();
    emit(GetMyRequestsFilterSuccessState(myRequestFilter: copy));
  }

  FutureOr<void> _onCancelRequestEvent(
      CancelRequestEvent event, Emitter<MyRequestsState> emit) async {
    emit(CancelRequestLoadingState());
    DataState dataState = await _cancelRequestUseCase(
        transactionId: event.myRequest.transactionId,
        tableId: event.myRequest.id);
    if (dataState is DataSuccess<TalentLinkResponse>) {
      emit(CancelRequestSuccessState(
          successMessage: dataState.data!.responseMessage ?? ""));
    } else {
      emit(CancelRequestErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onGetAllRequestsListEvent(
      GetAllRequestsListEvent event, Emitter<MyRequestsState> emit) async {
    emit(GetMyRequestsSkeletonState());
    DataState dataState = await _getAllRequestsListUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _requests = dataState.data!;
      _myRequestFilter.requests = _requests;
      add(GetMyRequestsFilterEvent());
    } else {
      emit(GetAllRequestsListErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetTransactionStatusEvent(
      GetTransactionStatusEvent event, Emitter<MyRequestsState> emit) async {
    emit(GetMyRequestsSkeletonState());
    DataState dataState = await _getTransactionStatusUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _status = dataState.data!;
      _myRequestFilter.status = _status;
      add(GetMyRequestsFilterEvent());
    } else {
      emit(GetTransactionStatueErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onMyRequestsNavigationToTimelineScreenEvent(
      MyRequestsNavigationToTimelineScreenEvent event,
      Emitter<MyRequestsState> emit) {
    emit(MyRequestsNavigationToTimelineScreenState(timeline: event.timeline));
  }

}
