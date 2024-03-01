// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:talent_link/src/domain/usecase/more/get_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/save_language_use_case.dart';

part 'main_state.dart';

class MainCubit extends Cubit<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SaveLanguageUseCase _saveLanguageUseCase;

  MainCubit(this._getLanguageUseCase, this._saveLanguageUseCase)
      : super(Locale(window.locale.languageCode)) {
    getLanguage();
  }

  Future<void> getLanguage() async {
    final language = await _getLanguageUseCase();
    await _saveLanguageUseCase(language ?? "en");
    emit(Locale(language ?? "en"));
  }
}
