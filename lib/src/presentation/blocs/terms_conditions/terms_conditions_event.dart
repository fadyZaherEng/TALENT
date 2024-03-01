part of 'terms_conditions_bloc.dart';

@immutable
abstract class TermsConditionsEvent {}

class GetTermsConditionsEvent extends TermsConditionsEvent {}

class TermsConditionsBackEvent extends TermsConditionsEvent {}
