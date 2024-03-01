part of 'address_details_bloc.dart';

@immutable
abstract class AddressDetailsState {}

class AddressDetailsInitialState extends AddressDetailsState {}

class AddressDetailsLoadingState extends AddressDetailsState {}

class AddressDetailsSuccessState extends AddressDetailsState {
  final AddressDetails addressDetails;

  AddressDetailsSuccessState({required this.addressDetails});
}

class AddressDetailsErrorState extends AddressDetailsState {
  final String errorMessage;

  AddressDetailsErrorState({required this.errorMessage});
}

class AddressDetailsApproveSuccessState extends AddressDetailsState {
     final DataSuccess dataSuccess;
  AddressDetailsApproveSuccessState({required this.dataSuccess});
}

class AddressDetailsApproveErrorState extends AddressDetailsState {
  final String errorMessage;

  AddressDetailsApproveErrorState({required this.errorMessage});
}

class AddressDetailsRejectSuccessState extends AddressDetailsState {
  final DataSuccess dataSuccess;
  AddressDetailsRejectSuccessState({required this.dataSuccess});
}

class AddressDetailsRejectErrorState extends AddressDetailsState {
  final String errorMessage;

  AddressDetailsRejectErrorState({required this.errorMessage});
}
