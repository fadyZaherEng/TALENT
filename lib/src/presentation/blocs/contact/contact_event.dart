part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ContactBackEvent extends ContactEvent {}

class OpenContactTypeBottomSheetEvent extends ContactEvent {}

class ContactDataFillingEvent extends ContactEvent {
  ContactController contactController;
  ContactDataFillingEvent({required this.contactController});
}

class GetContactTypeEvent extends ContactEvent {}

class ContactValidationContactTypeEvent extends ContactEvent {
  final String value;

  ContactValidationContactTypeEvent({required this.value});
}

class ContactValidationContactNoEvent extends ContactEvent {
  final String value;

  ContactValidationContactNoEvent({required this.value});
}

class ContactSubmitEvent extends ContactEvent {
  final ContactController contactController;
  final int contactTypeId;

  ContactSubmitEvent({
    required this.contactController,
    required this.contactTypeId,
  });
}

class SelectContactTypeEvent extends ContactEvent {
  final RequestType contactType;

  SelectContactTypeEvent({
    required this.contactType,
  });
}
