part of 'about_us_bloc.dart';

@immutable
abstract class AboutUsEvent {}

class GetAboutUsEvent extends AboutUsEvent {}

class AboutUsBackEvent extends AboutUsEvent {}
