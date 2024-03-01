part of 'address_bloc.dart';

@immutable
abstract class AddressState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressBackState extends AddressState {}

//check if enter data filling
class AddressDataFillingSuccessState extends AddressState {}

class AddressDataFillingErrorState extends AddressState {}

class AddressValidationNameEmptyState extends AddressState {
  final String validationMessage;

  AddressValidationNameEmptyState({
    required this.validationMessage,
  });
}

class AddressValidationBuildingEmptyState extends AddressState {
  final String validationMessage;

  AddressValidationBuildingEmptyState({
    required this.validationMessage,
  });
}

class AddressValidationAreaEmptyState extends AddressState {
  final String validationMessage;

  AddressValidationAreaEmptyState({
    required this.validationMessage,
  });
}

class AddressValidationFlatEmptyState extends AddressState {
  final String validationMessage;

  AddressValidationFlatEmptyState({
    required this.validationMessage,
  });
}

class AddressValidationFloorEmptyState extends AddressState {
  final String validationMessage;

  AddressValidationFloorEmptyState({
    required this.validationMessage,
  });
}

class AddressValidationStreetEmptyState extends AddressState {
  final String validationMessage;

  AddressValidationStreetEmptyState({
    required this.validationMessage,
  });
}

class AddressValidationNameValidState extends AddressState {}

class AddressValidationAreaValidState extends AddressState {}

class AddressValidationBuildingValidState extends AddressState {}

class AddressValidationFlatValidState extends AddressState {}

class AddressValidationFloorValidState extends AddressState {}

class AddressValidationStreetValidState extends AddressState {}

class AddressOpenAreaBottomSheetState extends AddressState {}

class GetAreasSuccessState extends AddressState {
  final List<RequestType> areas;

  GetAreasSuccessState({
    required this.areas,
  });
}

class GetAreasErrorState extends AddressState {
  final String errorMessage;

  GetAreasErrorState({
    required this.errorMessage,
  });
}

class SelectAreaState extends AddressState {
  final RequestType area;

  SelectAreaState({
    required this.area,
  });
}

class AddressSubmitSuccessState extends AddressState {
  final String successMessage;

  AddressSubmitSuccessState({
    required this.successMessage,
  });
}

class AddressSubmitErrorState extends AddressState {
  final String errorMessage;

  AddressSubmitErrorState({
    required this.errorMessage,
  });
}
class AddressClearAreaState extends AddressState{}
