import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';
import 'package:talent_link/src/domain/usecase/get_subscribe_info/get_subscribe_info_use_case.dart';

part 'terms_conditions_event.dart';

part 'terms_conditions_state.dart';

class TermsConditionsBloc
    extends Bloc<TermsConditionsEvent, TermsConditionsState> {
  final GetSubscribeInfoUseCase _getSubscribeInfoUseCase;

  TermsConditionsBloc(this._getSubscribeInfoUseCase)
      : super(TermsConditionsInitialState()) {
    on<GetTermsConditionsEvent>(_onTermsConditionsEvent);
    on<TermsConditionsBackEvent>(_onTermsConditionsBackEvent);
  }

  FutureOr<void> _onTermsConditionsEvent(
      GetTermsConditionsEvent event, Emitter<TermsConditionsState> emit) async {
    emit(TermsConditionsLoadingState());
    DataState dataState = await _getSubscribeInfoUseCase();
    if (dataState is DataSuccess<GetSubscribeInfo>) {
      emit(TermsConditionsSuccessState(getSubscribeInfo: dataState.data!));
    } else {
      emit(TermsConditionsErrorState(errorMassage: dataState.toString()));
    }
  }

  FutureOr<void> _onTermsConditionsBackEvent(
      TermsConditionsBackEvent event, Emitter<TermsConditionsState> emit) {
    emit(TermsConditionsBackState());
  }
}
