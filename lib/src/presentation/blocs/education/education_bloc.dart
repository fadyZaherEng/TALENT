import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/education_validator.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education/request/insert_education_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/countries/countries.dart';
import 'package:talent_link/src/domain/entities/countries/country.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/countries/get_countries_and_cities_use_case.dart';
import 'package:talent_link/src/domain/usecase/education/education_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/education/insert_education_use_case.dart';
import 'package:talent_link/src/domain/usecase/qualification/qualification_use_case.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_controller.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final EducationValidationUseCase _educationValidationUseCase;
  final QualificationUseCase _qualificationUseCase;
  final GetCountriesAndCitiesTypesUseCase _getCountriesAndCitiesTypesUseCase;
  final InsertEducationUseCase _insertEducationUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;

  EducationBloc(
    this._educationValidationUseCase,
    this._qualificationUseCase,
    this._getCountriesAndCitiesTypesUseCase,
    this._insertEducationUseCase,
    this._getEmployeeIdUseCase,
    this._getCompanyIdUseCase,
  ) : super(EducationInitialState()) {
    on<EducationBackEvent>(_onEducationBackEvent);
    on<EducationOpenQualificationTypeBottomSheetEvent>(
        _onEducationOpenQualificationTypeBottomSheetEvent);
    on<EducationValidationQualificationPlaceNameEvent>(
        _onEducationValidationQualificationPlaceNameEvent);
    on<EducationOpenCountryBottomSheetEvent>(
        _onEducationOpenCountryBottomSheetEvent);
    on<EducationValidationExpiryDateEvent>(
        _onEducationValidationExpiryDateEvent);
    on<EducationValidationIssueDateEvent>(_onEducationValidationIssueDateEvent);
    on<EducationOpenFileBottomSheetEvent>(_onEducationOpenFileBottomSheetEvent);
    on<EducationDeleteFileEvent>(_onEducationDeleteFileEvent);
    on<EducationSubmitEvent>(_onEducationSubmitEvent);
    on<EducationOpenCameraEvent>(_onEducationOpenCameraEvent);
    on<EducationOpenGalleryEvent>(_onEducationOpenGalleryEvent);
    on<EducationOpenFileEvent>(_onEducationOpenFileEvent);
    on<EducationSelectFileEvent>(_onEducationSelectFileEvent);
    on<EducationValidationQualificationTypeEvent>(
        _onEducationValidationQualificationTypeEvent);
    on<GetQualificationTypeEvent>(_onGetQualificationTypeEvent);
    on<GetCountriesEvent>(_onGetCountriesEvent);
    on<EducationValidationCountryEvent>(_onEducationValidationCountryEvent);
    on<EducationDataFillingEvent>(_onEducationDataFillingEvent);
  }

  List<RequestType> _qualificationTypes = [];

  List<Country> _countries = [];

  FutureOr<void> _onEducationBackEvent(
      EducationBackEvent event, Emitter<EducationState> emit) {
    emit(EducationBackState());
  }

  FutureOr<void> _onEducationOpenQualificationTypeBottomSheetEvent(
      EducationOpenQualificationTypeBottomSheetEvent event,
      Emitter<EducationState> emit) {
    emit(EducationOpenQualificationTypeBottomSheetState());
  }

  FutureOr<void> _onEducationValidationQualificationPlaceNameEvent(
      EducationValidationQualificationPlaceNameEvent event,
      Emitter<EducationState> emit) {
    EducationValidationState educationValidationState =
        _educationValidationUseCase.validateQualificationPlaceName(event.value);
    if (educationValidationState == EducationValidationState.valid) {
      emit(EducationValidationQualificationPlaceNameValidState());
    } else {
      emit(EducationValidationQualificationPlaceNameNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onEducationOpenCountryBottomSheetEvent(
      EducationOpenCountryBottomSheetEvent event,
      Emitter<EducationState> emit) {
    emit(EducationOpenCountryBottomSheetState());
  }

  FutureOr<void> _onEducationValidationExpiryDateEvent(
      EducationValidationExpiryDateEvent event, Emitter<EducationState> emit) {
    EducationValidationState educationValidationState =
        _educationValidationUseCase.validateExpiryDate(event.value);
    if (educationValidationState == EducationValidationState.valid) {
      emit(EducationValidationExpiryDateValidState());
    } else {
      emit(EducationValidationExpiryDateNotValidState(
        validationState: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onEducationOpenFileBottomSheetEvent(
      EducationOpenFileBottomSheetEvent event, Emitter<EducationState> emit) {
    emit(EducationOpenFileBottomSheetState());
  }

  FutureOr<void> _onEducationDeleteFileEvent(
      EducationDeleteFileEvent event, Emitter<EducationState> emit) {
    emit(EducationDeleteFileState(file: ''));
  }

  FutureOr<void> _onEducationSubmitEvent(
      EducationSubmitEvent event, Emitter<EducationState> emit) async {
    final validationsState = _educationValidationUseCase.validateFormUseCase(
        expiryDate: event.expiryDate,
        issueDate: event.issueDate,
        educationController: event.educationController);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == EducationValidationState.qualificationTypeEmpty) {
          emit(EducationValidationQualificationTypeNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element ==
            EducationValidationState.qualificationPlaceNameEmpty) {
          emit(EducationValidationQualificationPlaceNameNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == EducationValidationState.countryEmpty) {
          emit(EducationValidationCountryNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == EducationValidationState.issueDateEmpty) {
          emit(EducationValidationIssueDateNotValidState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == EducationValidationState.expiryDateEmpty) {
          emit(EducationValidationExpiryDateNotValidState(
            validationState: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(EducationLoadingState());
      InsertEducationRequest insertEducationRequest = InsertEducationRequest(
        id: 0,
        companyId: await _getCompanyIdUseCase() ?? 0,
        employeeId: await _getEmployeeIdUseCase() ?? 0,
        transactionStatusId: 1,
        transactionStatusName: "string",
        transactionStatusCode: "string",
        remarks: event.educationController.remarks.text,
        workFlowId: 0,
        workFlowName: "string",
        isEnabled: true,
        issueDate: event.issueDate,
        expiryDate: event.expiryDate,
        qualificationPlaceName:
            event.educationController.qualificationPlaceName.text,
        documentFilePath: event.file,
        documentFileName: event.file,
        fileSource: "string",
        qualificationTypeId: event.qualificationTypeId,
        isDeleted: false,
        qualificationTypeName: event.educationController.qualificationType.text,
        qualificationFilePath: "string",
        countryId: event.countryId,
        countryName: event.educationController.country.text,
      );
      DataState dataState = await _insertEducationUseCase(
          request: insertEducationRequest, file: File(event.file));
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(EducationSubmitSuccessState(
            successMessage: dataState.data!.responseMessage ?? ""));
      } else {
        emit(EducationSubmitErrorState(
            errorMessage: dataState.message!.toString()));
      }
    }
  }

  FutureOr<void> _onEducationOpenCameraEvent(
      EducationOpenCameraEvent event, Emitter<EducationState> emit) {
    emit(EducationOpenCameraState());
  }

  FutureOr<void> _onEducationOpenGalleryEvent(
      EducationOpenGalleryEvent event, Emitter<EducationState> emit) {
    emit(EducationOpenGalleryState());
  }

  FutureOr<void> _onEducationOpenFileEvent(
      EducationOpenFileEvent event, Emitter<EducationState> emit) {
    emit(EducationOpenFileState());
  }

  FutureOr<void> _onEducationValidationQualificationTypeEvent(
      EducationValidationQualificationTypeEvent event,
      Emitter<EducationState> emit) {
    EducationValidationState educationValidationState =
        _educationValidationUseCase.validateQualificationType(event.value.name);
    if (educationValidationState == EducationValidationState.valid) {
      emit(EducationValidationQualificationTypeValidState(
          qualificationType: event.value));
    } else {
      emit(EducationValidationQualificationTypeNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onEducationSelectFileEvent(
      EducationSelectFileEvent event, Emitter<EducationState> emit) {
    emit(EducationSelectFileState(filePath: event.filePath));
  }

  FutureOr<void> _onEducationValidationIssueDateEvent(
      EducationValidationIssueDateEvent event, Emitter<EducationState> emit) {
    EducationValidationState educationValidationState =
        _educationValidationUseCase.validateIssueDate(event.value);
    if (educationValidationState == EducationValidationState.valid) {
      emit(EducationValidationIssueDateValidState());
    } else {
      emit(EducationValidationIssueDateNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onGetQualificationTypeEvent(
      GetQualificationTypeEvent event, Emitter<EducationState> emit) async {
    emit(EducationLoadingState());
    DataState dataState = await _qualificationUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _qualificationTypes = dataState.data!;
      emit(GetQualificationTypeSuccessState(
          qualificationTypes: _qualificationTypes));
    } else {
      emit(GetQualificationTypeErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetCountriesEvent(
      GetCountriesEvent event, Emitter<EducationState> emit) async {
    emit(EducationLoadingState());
    DataState dataState = await _getCountriesAndCitiesTypesUseCase();
    if (dataState is DataSuccess<Countries>) {
      _countries = dataState.data!.countries!;
      emit(GetCountriesSuccessState(countries: _countries));
    } else {
      emit(GetCountriesErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onEducationValidationCountryEvent(
      EducationValidationCountryEvent event, Emitter<EducationState> emit) {
    EducationValidationState educationValidationState =
        _educationValidationUseCase.validateCountry(event.value.countryName);
    if (educationValidationState == EducationValidationState.valid) {
      emit(EducationValidationCountryValidState(country: event.value));
    } else {
      emit(EducationValidationCountryNotValidState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onEducationDataFillingEvent(
      EducationDataFillingEvent event, Emitter<EducationState> emit) {
    if (event.educationController.qualificationPlaceName.text != "" ||
        event.educationController.qualificationType.text != "" ||
        event.educationController.country.text != "" ||
        event.educationController.remarks.text != "" ||
        event.issueDate != "" ||
        event.pathFile != "" ||
        event.expireDate != "") {
      emit(EducationDataFillingSuccessState());
    } else {
      emit(EducationDataFillingErrorState());
    }
  }
}
