import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/domain/entities/home/ess_permission_singleton.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/usecase/request/navigate_to_requests_details_screen_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_ess_permission_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_requests_list_use_case.dart';

part 'request_event.dart';

part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final NavigateToRequestsDetailsScreenUseCase
      _navigateToRequestsDetailsScreenUseCase;

  final GetEssPermissionUseCase _getEssPermissionUseCase;
  final GetRequestsListUseCase _getRequestsListUseCase;
  List<Request> _requests = [
    Request(
        id: 4151,
        text: '',
        imagePath: ImagePaths.leave,
        imageColor: "#FF664DC9"),
    Request(
        id: 4152,
        text: '',
        imagePath: ImagePaths.shortLeave,
        imageColor: "#FF38CB89"),
    Request(
        id: 4153,
        text: '',
        imagePath: ImagePaths.leaveCncashment,
        imageColor: "#FFFFAB00"),
    Request(
        id: 4155,
        text: '',
        imagePath: ImagePaths.loan,
        imageColor: "#FF3E80EB"),
    Request(
        id: 4156,
        text: '',
        imagePath: ImagePaths.indemnityEncashment,
        imageColor: "#FFEF4B4B"),
    Request(
        id: 4157,
        text: '',
        imagePath: ImagePaths.airTicket,
        imageColor: "#FF06C0D9"),
    Request(
        id: 4159,
        text: 'Half Day Leave',
        imagePath: ImagePaths.halfDayLeave,
        imageColor: "#FF5238FF"),
    Request(
        id: 5158,
        text: '',
        imagePath: ImagePaths.resumeDuty,
        imageColor: "#FF1D996D"),
    Request(
        id: 5157,
        text: '',
        imagePath: ImagePaths.businessTrip,
        imageColor: "#FF00635B"),
    Request(
        id: 6168,
        text: '',
        imagePath: ImagePaths.otherRequest,
        imageColor: "#FFDC4405"),
  ];

  RequestBloc(this._navigateToRequestsDetailsScreenUseCase,
      this._getEssPermissionUseCase, this._getRequestsListUseCase)
      : super(RequestInitialState()) {
    on<GetRequestsEvent>(_onGetRequestsEvent);
    on<NavigateToRequestsDetailsScreen>(_onNavigateToRequestsDetailsScreen);
    on<RequestPopEvent>(_onRequestPopEvent);
  }

  FutureOr<void> _onGetRequestsEvent(
      GetRequestsEvent event, Emitter<RequestState> emit) async {
    emit(GetRequestsSkeletonState());
    resetRequests();
    emit(GetRequestsSuccessState(
        requests: _getRequestsListUseCase(
            allRequests: EssPermissionSingleTon.getEssPermission,
            requests: _requests,
            id: 4150)));
  }

  FutureOr<void> _onNavigateToRequestsDetailsScreen(
      NavigateToRequestsDetailsScreen event, Emitter<RequestState> emit) {
    emit(_navigateToRequestsDetailsScreenUseCase(
      requestState: state,
      id: event.request.id,
    ));
  }

  FutureOr<void> _onRequestPopEvent(
      RequestPopEvent event, Emitter<RequestState> emit) {
    emit(RequestPopState());
  }

  void resetRequests() {
    _requests = [
      Request(
          id: 4151,
          text: '',
          imagePath: ImagePaths.leave,
          imageColor: "#FF664DC9"),
      Request(
          id: 4152,
          text: '',
          imagePath: ImagePaths.shortLeave,
          imageColor: "#FF38CB89"),
      Request(
          id: 4153,
          text: '',
          imagePath: ImagePaths.leaveCncashment,
          imageColor: "#FFFFAB00"),
      Request(
          id: 4155,
          text: '',
          imagePath: ImagePaths.loan,
          imageColor: "#FF3E80EB"),
      Request(
          id: 4156,
          text: '',
          imagePath: ImagePaths.indemnityEncashment,
          imageColor: "#FFEF4B4B"),
      Request(
          id: 4157,
          text: '',
          imagePath: ImagePaths.airTicket,
          imageColor: "#FF06C0D9"),
      Request(
          id: 4159,
          text: 'Half Day Leave',
          imagePath: ImagePaths.halfDayLeave,
          imageColor: "#FF5238FF"),
      Request(
          id: 5158,
          text: '',
          imagePath: ImagePaths.resumeDuty,
          imageColor: "#FF1D996D"),
      Request(
          id: 5157,
          text: '',
          imagePath: ImagePaths.businessTrip,
          imageColor: "#FF00635B"),
      Request(
          id: 6168,
          text: '',
          imagePath: ImagePaths.otherRequest,
          imageColor: "#FFDC4405"),
    ];
  }
}
