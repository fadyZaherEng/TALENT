part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitialState extends MainState {}

class MainGetLanguageState extends MainState {
  String? languageCode;
  MainGetLanguageState({required this.languageCode});
}
