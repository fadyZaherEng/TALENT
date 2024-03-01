import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/asset_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/request/insert_asset_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/asset/asset_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/asset/get_asset_type_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/asset/insert_asset_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_controller.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  final AssetValidationUseCase _assetValidationUseCase;
  final GetAssetTypeListUseCase _assetTypeListUseCase;
  final InsertAssetUseCase _insertAssetUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;

  AssetBloc(
    this._assetValidationUseCase,
    this._assetTypeListUseCase,
    this._insertAssetUseCase,
    this._getEmployeeIdUseCase,
    this._getCompanyIdUseCase,
  ) : super(AssetInitialState()) {
    on<AssetBackEvent>(_onAssetBackEvent);
    on<AssetValidationQuantityEvent>(_onAssetValidationQuantityEvent);
    on<AssetValidationAssetTypeEvent>(_onAssetValidationAssetTypeEvent);
    on<AssetSubmitEvent>(_onAssetSubmitEvent);
    on<GetAssetTypeListEvent>(_onGetAssetTypeListEvent);
    on<OpenAssetTypeBottomSheetEvent>(_onOpenAssetTypeBottomSheetEvent);
    on<SelectAssetTypeEvent>(_onSelectAssetTypeEvent);
    on<AssetDataFillingEvent>(_onAssetDataFillingEvent);
  }

  List<RequestType> _requestTypes = [];

  FutureOr<void> _onAssetBackEvent(
      AssetBackEvent event, Emitter<AssetState> emit) {
    emit(AssetBackState());
  }

  FutureOr<void> _onAssetValidationQuantityEvent(
      AssetValidationQuantityEvent event, Emitter<AssetState> emit) {
    AssetValidationState assetValidationState =
        _assetValidationUseCase.validateQuantity(event.value);
    if (assetValidationState == AssetValidationState.valid) {
      emit(AssetValidationQuantityValidState());
    } else {
      emit(AssetValidationQuantityEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAssetValidationAssetTypeEvent(
      AssetValidationAssetTypeEvent event, Emitter<AssetState> emit) {
    AssetValidationState assetValidationState =
        _assetValidationUseCase.validateQuantity(event.value);
    if (assetValidationState == AssetValidationState.valid) {
      emit(AssetValidationAssetTypeValidState());
    } else {
      emit(AssetValidationAssetTypeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onAssetSubmitEvent(
      AssetSubmitEvent event, Emitter<AssetState> emit) async {
    final validationsState = _assetValidationUseCase.validateAssetFormUseCase(
        assetController: event.assetController);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == AssetValidationState.typeEmpty) {
          emit(AssetValidationAssetTypeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == AssetValidationState.quantityEmpty) {
          emit(AssetValidationQuantityEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(AssetLoadingState());
      InsertAssetRequest insertAssetRequest = InsertAssetRequest(
          id: 0,
          companyId: await _getCompanyIdUseCase() ?? 0,
          employeeId: await _getEmployeeIdUseCase() ?? 0,
          transactionStatusId: 1,
          transactionStatusName: "string",
          transactionStatusCode: "string",
          remarks: event.assetController.remarks.text,
          workFlowId: 0,
          workFlowName: "string",
          isEnabled: true,
          quantity: event.assetController.quantity.text,
          assetFilePath: "string",
          assetFileName: "string",
          assetTypeId: "${event.typeId}",
          assetTypeName: event.assetController.assetType.text,
          isDeleted: false);
      DataState dataState = await _insertAssetUseCase(
        request: insertAssetRequest,
      );
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(AssetSubmitSuccessState(
            successMessage: dataState.data!.responseMessage ?? ""));
      } else {
        emit(AssetSubmitErrorState(
            errorMessage: dataState.error!.error.toString()));
      }
    }
  }

  FutureOr<void> _onGetAssetTypeListEvent(
      GetAssetTypeListEvent event, Emitter<AssetState> emit) async {
    emit(AssetLoadingState());
    DataState dataState = await _assetTypeListUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _requestTypes = dataState.data!;
      emit(GetAssetTypeListSuccessState(requestTypes: _requestTypes));
    } else {
      emit(GetAssetTypeListErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onOpenAssetTypeBottomSheetEvent(
      OpenAssetTypeBottomSheetEvent event, Emitter<AssetState> emit) {
    emit(OpenAssetTypeBottomSheetState());
  }

  FutureOr<void> _onSelectAssetTypeEvent(
      SelectAssetTypeEvent event, Emitter<AssetState> emit) {
    emit(SelectAssetTypeState(requestType: event.requestType));
  }

  FutureOr<void> _onAssetDataFillingEvent(
      AssetDataFillingEvent event, Emitter<AssetState> emit) {
    if (event.assetController.assetType.text != "" ||
        event.assetController.quantity.text != "" ||
        event.assetController.remarks.text != "") {
      emit(AssetDataFillingSuccessState());
    } else {
      emit(AssetDataFillingErrorState());
    }
  }
}
