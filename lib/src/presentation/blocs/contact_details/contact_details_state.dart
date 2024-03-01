part of 'contact_details_bloc.dart';

@immutable
abstract class ContactDetailsState {}

class ContactDetailsInitialState extends ContactDetailsState {}

class ContactDetailsLoadingState extends ContactDetailsState {}

class ContactDetailsSuccessState extends ContactDetailsState {
  final ContactDetails contactDetails;

  ContactDetailsSuccessState({required this.contactDetails});
}

class ContactDetailsErrorState extends ContactDetailsState {
  final String errorMessage;

  ContactDetailsErrorState({required this.errorMessage});
}

class ContactDetailsApproveSuccessState extends ContactDetailsState {
  final DataSuccess dataSuccess;

  ContactDetailsApproveSuccessState({required this.dataSuccess});
}

class ContactDetailsApproveErrorState extends ContactDetailsState {
  final String errorMessage;

  ContactDetailsApproveErrorState({required this.errorMessage});
}

class ContactDetailsRejectSuccessState extends ContactDetailsState {
  final DataSuccess dataSuccess;

  ContactDetailsRejectSuccessState({required this.dataSuccess});
}

class ContactDetailsRejectErrorState extends ContactDetailsState {
  final String errorMessage;

  ContactDetailsRejectErrorState({required this.errorMessage});
}
