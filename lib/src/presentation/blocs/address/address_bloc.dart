import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/address_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/address/request/insert_address_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/address/address_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/address/insert_address_use_case.dart';
import 'package:talent_link/src/domain/usecase/area/get_area_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_controller.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressValidationUseCase _addressValidationUseCase;
  final GetAreaUseCase _getAreaUseCase;
  final InsertAddressUseCase _insertAddressUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;

  AddressBloc(
    this._addressValidationUseCase,
    this._getAreaUseCase,
    this._insertAddressUseCase,
    this._getEmployeeIdUseCase,
    this._getCompanyIdUseCase,
  ) : super(AddressInitialState()) {
    on<AddressBackEvent>(_onAddressBackEvent);
    on<AddressValidationNameEvent>(_onAddressValidationNameEvent);
    on<AddressValidationBuildingEvent>(_onAddressValidationBuildingEvent);
    on<AddressValidationFlatEvent>(_onAddressValidationFlatEvent);
    on<AddressValidationFloorEvent>(_onAddressValidationFloorEvent);
    on<AddressValidationStreetEvent>(_onAddressValidationStreetEvent);
    on<AddressOpenAreaBottomSheetEvent>(_onAddressOpenAreaBottomSheetEvent);
    on<AddressSubmitEvent>(_onAddressSubmitEvent);
    on<GetAreasEvent>(_onGetAreasEvent);
    on<SelectAreaEvent>(_onSelectAreaEvent);
    on<AddressDataFillingEvent>(_onAddressDataFillingEvent);
    on<AddressClearAreaEvent>(_onAddressClearAreaEvent);
  }

  List<RequestType> _areas = [];

  FutureOr<void> _onAddressBackEvent(
      AddressBackEvent event, Emitter<AddressState> emit) {
    emit(AddressBackState());
  }

  FutureOr<void> _onAddressValidationNameEvent(
      AddressValidationNameEvent event, Emitter<AddressState> emit) {
    AddressValidationState addressValidationState =
        _addressValidationUseCase.validateName(event.value);
    if (addressValidationState == AddressValidationState.valid) {
      emit(AddressValidationNameValidState());
    } else {
      emit(AddressValidationNameEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAddressValidationBuildingEvent(
      AddressValidationBuildingEvent event, Emitter<AddressState> emit) {
    AddressValidationState addressValidationState =
        _addressValidationUseCase.validateBuilding(event.value);
    if (addressValidationState == AddressValidationState.valid) {
      emit(AddressValidationBuildingValidState());
    } else {
      emit(AddressValidationBuildingEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAddressValidationFlatEvent(
      AddressValidationFlatEvent event, Emitter<AddressState> emit) {
    AddressValidationState addressValidationState =
        _addressValidationUseCase.validateFlat(event.value);
    if (addressValidationState == AddressValidationState.valid) {
      emit(AddressValidationFlatValidState());
    } else {
      emit(AddressValidationFlatEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAddressValidationFloorEvent(
      AddressValidationFloorEvent event, Emitter<AddressState> emit) {
    AddressValidationState addressValidationState =
        _addressValidationUseCase.validateFloor(event.value);
    if (addressValidationState == AddressValidationState.valid) {
      emit(AddressValidationFloorValidState());
    } else {
      emit(AddressValidationFloorEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAddressValidationStreetEvent(
      AddressValidationStreetEvent event, Emitter<AddressState> emit) {
    AddressValidationState addressValidationState =
        _addressValidationUseCase.validateStreet(event.value);
    if (addressValidationState == AddressValidationState.valid) {
      emit(AddressValidationStreetValidState());
    } else {
      emit(AddressValidationStreetEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAddressOpenAreaBottomSheetEvent(
      AddressOpenAreaBottomSheetEvent event, Emitter<AddressState> emit) {
    emit(AddressOpenAreaBottomSheetState());
  }

  FutureOr<void> _onAddressSubmitEvent(
      AddressSubmitEvent event, Emitter<AddressState> emit) async {
    final validationsState = _addressValidationUseCase
        .validateAddressFormUseCase(addressController: event.addressController);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == AddressValidationState.nameEmpty) {
          emit(AddressValidationNameEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AddressValidationState.areaEmpty) {
          emit(AddressValidationAreaEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AddressValidationState.streetEmpty) {
          emit(AddressValidationStreetEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AddressValidationState.buildingEmpty) {
          emit(AddressValidationBuildingEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AddressValidationState.floorEmpty) {
          emit(AddressValidationFloorEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AddressValidationState.flatEmpty) {
          emit(AddressValidationFlatEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(AddressLoadingState());
      InsertAddressRequest insertAddressRequest = InsertAddressRequest(
          id: 0,
          companyId: await _getCompanyIdUseCase() ?? 0,
          employeeId: await _getEmployeeIdUseCase() ?? 0,
          transactionStatusId: 0,
          transactionStatusName: "string",
          transactionStatusCode: "string",
          remarks: event.addressController.remarks.text,
          workFlowId: 0,
          workFlowName: "string",
          isEnabled: true,
          addressName: event.addressController.name.text,
          street: event.addressController.street.text,
          buildingNo: event.addressController.building.text,
          floor: event.addressController.floor.text,
          flat: event.addressController.flat.text,
          longitude: "22",
          latitude: "22",
          addressDetails: event.addressController.addressDetails.text,
          addressFilePath: "string",
          addressFileName: "string",
          fileSource: "string",
          areaId: event.areaId,
          isDeleted: false,
          areaName: event.addressController.area.text);
      DataState dataState =
          await _insertAddressUseCase(request: insertAddressRequest);
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(AddressSubmitSuccessState(
            successMessage: dataState.data!.responseMessage ?? ""));
      } else {
        emit(AddressSubmitErrorState(
            errorMessage: dataState.error!.error.toString()));
      }
    }
  }

  FutureOr<void> _onGetAreasEvent(
      GetAreasEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoadingState());
    DataState dataState = await _getAreaUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _areas = dataState.data!;
      emit(GetAreasSuccessState(areas: _areas));
    } else {
      emit(GetAreasErrorState(errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onSelectAreaEvent(
      SelectAreaEvent event, Emitter<AddressState> emit) {
    emit(SelectAreaState(area: event.area));
  }

  FutureOr<void> _onAddressDataFillingEvent(
      AddressDataFillingEvent event, Emitter<AddressState> emit) {
    if (event.addressController.name.text != "" ||
        event.addressController.street.text != "" ||
        event.addressController.floor.text != "" ||
        event.addressController.flat.text != "" ||
        event.addressController.building.text != "" ||
        event.addressController.area.text != "" ||
        event.addressController.addressDetails.text != "" ||
        event.addressController.remarks.text != "") {
      emit(AddressDataFillingSuccessState());
    } else {
      emit(AddressDataFillingErrorState());
    }
  }

  FutureOr<void> _onAddressClearAreaEvent(AddressClearAreaEvent event, Emitter<AddressState> emit) {
    emit(AddressClearAreaState());
  }
}
