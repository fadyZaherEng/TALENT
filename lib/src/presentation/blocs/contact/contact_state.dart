part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ContactInitialState extends ContactState {}

//check if enter data filling
class ContactDataFillingSuccessState extends ContactState {}

class ContactDataFillingErrorState extends ContactState {}

class ContactLoadingState extends ContactState {}

class GetContactTypeSuccessState extends ContactState {
  final List<RequestType> requestTypes;

  GetContactTypeSuccessState({required this.requestTypes});
}

class GetContactTypeErrorState extends ContactState {
  final String errorMessage;

  GetContactTypeErrorState({required this.errorMessage});
}

class ContactBackState extends ContactState {}

class OpenContactTypeBottomSheetState extends ContactState {}

class ContactValidationContactTypeEmptyState extends ContactState {
  final String validationMessage;

  ContactValidationContactTypeEmptyState({
    required this.validationMessage,
  });
}

class ContactValidationContactTypeValidState extends ContactState {}

class ContactValidationContactNoEmptyState extends ContactState {
  final String validationMessage;

  ContactValidationContactNoEmptyState({
    required this.validationMessage,
  });
}

class ContactValidationContactNoValidState extends ContactState {}

class SelectContactTypeState extends ContactState {
  final RequestType contactType;

  SelectContactTypeState({
    required this.contactType,
  });
}

class ContactSubmitSuccessState extends ContactState {
  final String successMessage;

  ContactSubmitSuccessState({required this.successMessage});
}

class ContactSubmitErrorState extends ContactState {
  final String errorMessage;

  ContactSubmitErrorState({
    required this.errorMessage,
  });
}
