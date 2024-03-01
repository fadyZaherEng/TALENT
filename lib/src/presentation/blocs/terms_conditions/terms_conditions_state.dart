part of 'terms_conditions_bloc.dart';

@immutable
abstract class TermsConditionsState {}

class TermsConditionsInitialState extends TermsConditionsState {}

class TermsConditionsLoadingState extends TermsConditionsState {}

class TermsConditionsSuccessState extends TermsConditionsState {
  final GetSubscribeInfo getSubscribeInfo;

  TermsConditionsSuccessState({required this.getSubscribeInfo});
}

class TermsConditionsErrorState extends TermsConditionsState {
  final String errorMassage;

  TermsConditionsErrorState({required this.errorMassage});
}

class TermsConditionsBackState extends TermsConditionsState {}
