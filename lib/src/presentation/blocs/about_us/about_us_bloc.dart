import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';
import 'package:talent_link/src/domain/usecase/get_subscribe_info/get_subscribe_info_use_case.dart';

part 'about_us_event.dart';

part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final GetSubscribeInfoUseCase _getSubscribeInfoUseCase;

  AboutUsBloc(this._getSubscribeInfoUseCase) : super(AboutUsInitialState()) {
    on<GetAboutUsEvent>(_onGetAboutUsEvent);
    on<AboutUsBackEvent>(_onAboutUsBackEvent);
  }

  FutureOr<void> _onGetAboutUsEvent(
      GetAboutUsEvent event, Emitter<AboutUsState> emit) async {
    emit(AboutUsLoadingState());
    DataState dataState = await _getSubscribeInfoUseCase();
    if (dataState is DataState<GetSubscribeInfo>) {
      emit(GetAboutUsSuccessState(getSubscribeInfo: dataState.data!));
    } else {
      GetAboutUsErrorState(errorMessage: dataState.message.toString());
    }
  }

  FutureOr<void> _onAboutUsBackEvent(
      AboutUsBackEvent event, Emitter<AboutUsState> emit) {
    emit(AboutUsBackState());
  }
}
