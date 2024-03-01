part of 'address_bloc.dart';

@immutable
abstract class AddressEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AddressBackEvent extends AddressEvent {}

class AddressDataFillingEvent extends AddressEvent {
  AddressController addressController;
  AddressDataFillingEvent({required this.addressController});
}

class AddressValidationNameEvent extends AddressEvent {
  final String value;

  AddressValidationNameEvent({required this.value});
}

class AddressValidationBuildingEvent extends AddressEvent {
  final String value;

  AddressValidationBuildingEvent({required this.value});
}

class AddressValidationFlatEvent extends AddressEvent {
  final String value;

  AddressValidationFlatEvent({required this.value});
}

class AddressValidationFloorEvent extends AddressEvent {
  final String value;

  AddressValidationFloorEvent({required this.value});
}

class AddressValidationStreetEvent extends AddressEvent {
  final String value;

  AddressValidationStreetEvent({required this.value});
}

class AddressOpenAreaBottomSheetEvent extends AddressEvent {}

class AddressAreaValidationEvent extends AddressEvent {}

class AddressSubmitEvent extends AddressEvent {
  final AddressController addressController;
  final int areaId;

  AddressSubmitEvent({
    required this.addressController,
    required this.areaId,
  });
}

class GetAreasEvent extends AddressEvent {}

class SelectAreaEvent extends AddressEvent {
  final RequestType area;

  SelectAreaEvent({required this.area});
}

class AddressClearAreaEvent extends AddressEvent{}