import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/domain/entities/home/ess_permission_singleton.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/usecase/requests/get_ess_permission_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_requests_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/update_profile/navigate_to_update_profile_details_screens_use_case.dart';

part 'update_profile_event.dart';

part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final NavigateToUpdateProfileDetailsScreensUseCase
      _navigateToUpdateProfileDetailsScreensUseCase;
  final GetEssPermissionUseCase _getEssPermissionUseCase;
  final GetRequestsListUseCase _getRequestsListUseCase;

  UpdateProfileBloc(this._navigateToUpdateProfileDetailsScreensUseCase,
      this._getRequestsListUseCase, this._getEssPermissionUseCase)
      : super(UpdateProfileInitialState()) {
    on<UpdateProfileBackEvent>(_onUpdateProfileBackEvent);
    on<GetUpdateProfileListEvent>(_onGetUpdateProfileListEvent);
    on<NavigateToUpdateProfileScreensEvent>(
        _onNavigateToUpdateProfileScreensEvent);
  }

  List<Request> _requests = [
    Request(
        id: 6171,
        text: '',
        imagePath: ImagePaths.address,
        imageColor: "#FFEB001B"),
    Request(
        id: 6180,
        text: '',
        imagePath: ImagePaths.contact,
        imageColor: "#FFEB001B"),
    Request(
        id: 6173,
        text: '',
        imagePath: ImagePaths.attachment,
        imageColor: "#FFEB001B"),
    Request(
        id: 6174,
        text: '',
        imagePath: ImagePaths.assets,
        imageColor: "#FFEB001B"),
    Request(
        id: 6181,
        text: '',
        imagePath: ImagePaths.education,
        imageColor: "#FFEB001B"),
  ];

  FutureOr<void> _onUpdateProfileBackEvent(
      UpdateProfileBackEvent event, Emitter<UpdateProfileState> emit) {
    emit(UpdateProfileBackState());
  }

  FutureOr<void> _onGetUpdateProfileListEvent(
      GetUpdateProfileListEvent event, Emitter<UpdateProfileState> emit) async {
    emit(UpdateProfileSkeletonState());
    resetRequest();
    emit(UpdateProfileSuccessState(
        requests: _getRequestsListUseCase(
            allRequests: EssPermissionSingleTon.getEssPermission,
            requests: _requests,
            id: 6170)));
  }

  FutureOr<void> _onNavigateToUpdateProfileScreensEvent(
      NavigateToUpdateProfileScreensEvent event,
      Emitter<UpdateProfileState> emit) {
    emit(_navigateToUpdateProfileDetailsScreensUseCase(
      requestState: state,
      id: event.request.id,
    ));
  }

  resetRequest() {
    _requests = [
      Request(
          id: 6171,
          text: '',
          imagePath: ImagePaths.address,
          imageColor: "#FFEB001B"),
      Request(
          id: 6180,
          text: '',
          imagePath: ImagePaths.contact,
          imageColor: "#FFEB001B"),
      Request(
          id: 6173,
          text: '',
          imagePath: ImagePaths.attachment,
          imageColor: "#FFEB001B"),
      Request(
          id: 6174,
          text: '',
          imagePath: ImagePaths.assets,
          imageColor: "#FFEB001B"),
      Request(
          id: 6181,
          text: '',
          imagePath: ImagePaths.education,
          imageColor: "#FFEB001B"),
    ];
  }
}
