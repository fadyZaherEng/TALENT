import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/notifications/notifications.dart';
import 'package:talent_link/src/domain/usecase/notifications/get_notifications_use_case.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase _getNotificationsUseCase;

  NotificationsBloc(this._getNotificationsUseCase)
      : super(NotificationInitialState()) {
    on<GetNotificationsEvent>(_onGetNotificationsEvent);
    on<NotificationsBackEvent>(_onNotificationsBackEvent);
  }

  List<Notifications> _notifications = [];

  FutureOr<void> _onGetNotificationsEvent(
      GetNotificationsEvent event, Emitter<NotificationsState> emit) async {
    emit(NotificationSkeletonState());

    DataState dataState = await _getNotificationsUseCase();
    if (dataState is DataSuccess<List<Notifications>>) {
      _notifications = dataState.data!;
      emit(GetNotificationsSuccessState(notifications: _notifications));
    } else {
      emit(GetNotificationsErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onNotificationsBackEvent(
      NotificationsBackEvent event, Emitter<NotificationsState> emit) {
    emit(NotificationsBackState());
  }
}
