// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/main.dart';
import 'package:talent_link/src/domain/entities/home/ess_permission_singleton.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_notification_status_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_user_type_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/remove_checkin_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/remove_checkout_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/remove_day_reset_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/save_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/save_notification_status_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/update_notification_use_case.dart';

part 'more_event.dart';

part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final SaveUserIdUseCase _saveUserIdUseCase;
  final UpdateNotificationUseCase _updateNotificationUseCase;
  final SaveNotificationStatusUseCase _saveNotificationStatusUseCase;
  final SaveLanguageUseCase _saveLanguageUseCase;
  final GetUserTypeIdUseCase _getUserTypeIdUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetNotificationStatusUseCase _getNotificationStatusUseCase;

  final RemoveResetDayUseCase removeResetDayUseCase;
  final RemoveCheckOutUseCase removeCheckOutUseCase;
  final RemoveCheckInUseCase removeCheckInUseCase;

  MoreBloc(
      this._saveUserIdUseCase,
      this._saveLanguageUseCase,
      this._saveNotificationStatusUseCase,
      this._updateNotificationUseCase,
      this._getUserTypeIdUseCase,
      this._getLanguageUseCase,
      this._getNotificationStatusUseCase,
      this.removeCheckInUseCase,
      this.removeCheckOutUseCase,
      this.removeResetDayUseCase)
      : super(MoreInitialState()) {
    on<MoreNavigateToUpdateProfileScreenEvent>(
        _onMoreNavigateToUpdateProfileScreenEvent);
    on<MoreNavigateToMyRequestsScreenEvent>(
        _onMoreNavigateToMyRequestsScreenEvent);
    on<MoreNavigateToMyTeamRequestsScreenEvent>(
        _onMoreNavigateToMyTeamRequestsScreenEvent);
    on<MoreNavigateToAttendanceHistoryScreenEvent>(
        _onMoreNavigateToAttendanceHistoryScreenEvent);
    on<MoreNavigateToMyTeamAttendanceScreenEvent>(
        _onMoreNavigateToMyTeamAttendanceScreenEvent);
    on<MoreNavigateToTermsConditionsScreenEvent>(
        _onMoreNavigateToTermsConditionsScreenEvent);
    on<MoreNavigateToAboutUsScreenEvent>(_onMoreNavigateToAboutUsScreenEvent);
    on<MoreNotificationsToggleEvent>(_onMoreNotificationsToggleEvent);
    on<MoreSwitchLanguageEvent>(_onMoreSwitchLanguageEvent);
    on<MoreLogoutEvent>(_onMoreLogoutEvent);
    on<MoreBackEvent>(_onMoreBackEvent);
    on<MoreGetNotificationStatusEvent>(_onMoreGetNotificationStatusEvent);
    on<MoreGetLanguageEvent>(_onMoreGetLanguageEvent);
    on<MoreTeamRequestAndAttendanceVisibilityEvent>(
        _onMoreTeamRequestAndAttendanceVisibilityEvent);
  }

  FutureOr<void> _onMoreNavigateToUpdateProfileScreenEvent(
      MoreNavigateToUpdateProfileScreenEvent event, Emitter<MoreState> emit) {
    emit(MoreNavigateToUpdateProfileScreenState());
  }

  FutureOr<void> _onMoreNavigateToMyRequestsScreenEvent(
      MoreNavigateToMyRequestsScreenEvent event, Emitter<MoreState> emit) {
    emit(MoreNavigateToMyRequestsScreenState());
  }

  FutureOr<void> _onMoreNavigateToMyTeamRequestsScreenEvent(
      MoreNavigateToMyTeamRequestsScreenEvent event, Emitter<MoreState> emit) {
    emit(MoreNavigateToMyTeamRequestsScreenState());
  }

  FutureOr<void> _onMoreNavigateToAttendanceHistoryScreenEvent(
      MoreNavigateToAttendanceHistoryScreenEvent event,
      Emitter<MoreState> emit) {
    emit(MoreNavigateToAttendanceHistoryScreenState());
  }

  FutureOr<void> _onMoreNavigateToMyTeamAttendanceScreenEvent(
      MoreNavigateToMyTeamAttendanceScreenEvent event,
      Emitter<MoreState> emit) {
    emit(MoreNavigateToMyTeamAttendanceScreenState());
  }

  FutureOr<void> _onMoreNavigateToTermsConditionsScreenEvent(
      MoreNavigateToTermsConditionsScreenEvent event, Emitter<MoreState> emit) {
    emit(MoreNavigateToTermsConditionsScreenState());
  }

  FutureOr<void> _onMoreNavigateToAboutUsScreenEvent(
      MoreNavigateToAboutUsScreenEvent event, Emitter<MoreState> emit) {
    emit(MoreNavigateToAboutUsScreenState());
  }

  FutureOr<void> _onMoreNotificationsToggleEvent(
      MoreNotificationsToggleEvent event, Emitter<MoreState> emit) async {
    emit(MoreNotificationsToggleState(value: event.value));
    if (event.value) {
      await _updateNotificationUseCase.call(isAllowedNotification: 1);
      _saveNotificationStatusUseCase.call(true);
    } else {
      await _updateNotificationUseCase.call(isAllowedNotification: 0);
      _saveNotificationStatusUseCase.call(false);
    }
  }

  FutureOr<void> _onMoreSwitchLanguageEvent(
      MoreSwitchLanguageEvent event, Emitter<MoreState> emit) async {
    await _saveLanguageUseCase.call(event.value ? "ar" : "en");
    emit(MoreSwitchLanguageState(value: event.value));
  }

  FutureOr<void> _onMoreLogoutEvent(
      MoreLogoutEvent event, Emitter<MoreState> emit) async {
    await _saveUserIdUseCase.call(-1);
    EssPermissionSingleTon.setEssPermission([]);
    await removeCheckOutUseCase();
    await removeCheckInUseCase();
    await removeResetDayUseCase();
    emit(MoreLogoutState());
  }

  FutureOr<void> _onMoreBackEvent(
      MoreBackEvent event, Emitter<MoreState> emit) {
    emit(MoreBackState());
  }

  FutureOr<void> _onMoreGetNotificationStatusEvent(
      MoreGetNotificationStatusEvent event, Emitter<MoreState> emit) async {
    bool status = await _getNotificationStatusUseCase() ?? false;
    emit(MoreGetNotificationStatusState(status: status));
  }

  //english equal true
  FutureOr<void> _onMoreGetLanguageEvent(
      MoreGetLanguageEvent event, Emitter<MoreState> emit) async {
    String languageCode = await _getLanguageUseCase() ?? "en";
    if (languageCode == "ar") {
      emit(MoreGetLanguageState(language: false));
    } else {
      emit(MoreGetLanguageState(language: true));
    }
  }

  FutureOr<void> _onMoreTeamRequestAndAttendanceVisibilityEvent(
      MoreTeamRequestAndAttendanceVisibilityEvent event,
      Emitter<MoreState> emit) async {
    int userTypeId = await _getUserTypeIdUseCase() ?? 0;
    emit(MoreTeamRequestAndAttendanceVisibilityState(userTypeId: userTypeId));
  }
}
