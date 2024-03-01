part of 'about_us_bloc.dart';

@immutable
abstract class AboutUsState {}

class AboutUsInitialState extends AboutUsState {}

class AboutUsLoadingState extends AboutUsState {}

class GetAboutUsSuccessState extends AboutUsState {
  final GetSubscribeInfo getSubscribeInfo;

  GetAboutUsSuccessState({required this.getSubscribeInfo});
}

class GetAboutUsErrorState extends AboutUsState {
  final String errorMessage;

  GetAboutUsErrorState({required this.errorMessage});
}

class AboutUsBackState extends AboutUsState {}
