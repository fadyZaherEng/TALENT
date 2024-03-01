import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/utils/validation/contact_validatior.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/request/insert_contact_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/contact/contact_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/contact/get_contact_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/contact/insert_contact_use_case.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_controller.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactValidationUseCase _contactValidationUseCase;
  final GetContactTypesUseCase _getContactTypesUseCase;
  final InsertContactUseCase _insertContactUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCompanyIdUseCase _getCompanyIdUseCase;

  ContactBloc(
      this._contactValidationUseCase,
      this._getContactTypesUseCase,
      this._insertContactUseCase,
      this._getEmployeeIdUseCase,
      this._getCompanyIdUseCase)
      : super(ContactInitialState()) {
    on<ContactBackEvent>(_onContactBackEvent);
    on<OpenContactTypeBottomSheetEvent>(_onOpenContactTypeBottomSheetEvent);
    on<GetContactTypeEvent>(_onGetContactTypeEvent);
    on<ContactValidationContactTypeEvent>(_onContactValidationContactTypeEvent);
    on<ContactValidationContactNoEvent>(_onContactValidationContactNoEvent);
    on<ContactSubmitEvent>(_onContactSubmitEvent);
    on<SelectContactTypeEvent>(_onSelectContactTypeEvent);
    on<ContactDataFillingEvent>(_onContactDataFillingEvent);
  }

  List<RequestType> _contactType = [];

  FutureOr<void> _onContactBackEvent(
      ContactBackEvent event, Emitter<ContactState> emit) {
    emit(ContactBackState());
  }

  FutureOr<void> _onOpenContactTypeBottomSheetEvent(
      OpenContactTypeBottomSheetEvent event, Emitter<ContactState> emit) {
    emit(OpenContactTypeBottomSheetState());
  }

  FutureOr<void> _onGetContactTypeEvent(
      GetContactTypeEvent event, Emitter<ContactState> emit) async {
    emit(ContactLoadingState());
    DataState dataState = await _getContactTypesUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _contactType = dataState.data!;
      emit(GetContactTypeSuccessState(requestTypes: _contactType));
    } else {
      emit(GetContactTypeErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onContactValidationContactTypeEvent(
      ContactValidationContactTypeEvent event, Emitter<ContactState> emit) {
    ContactValidationState contactValidationState =
        _contactValidationUseCase.validateContactType(event.value);
    if (contactValidationState == ContactValidationState.valid) {
      emit(ContactValidationContactTypeValidState());
    } else {
      emit(ContactValidationContactTypeEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onContactValidationContactNoEvent(
      ContactValidationContactNoEvent event, Emitter<ContactState> emit) {
    ContactValidationState contactValidationState =
        _contactValidationUseCase.validateContactNo(event.value);
    if (contactValidationState == ContactValidationState.valid) {
      emit(ContactValidationContactNoValidState());
    } else {
      emit(ContactValidationContactNoEmptyState(
        validationMessage: S.current.thisFieldIsRequired,
      ));
    }
  }

  FutureOr<void> _onContactSubmitEvent(
      ContactSubmitEvent event, Emitter<ContactState> emit) async {
    final validationsState = _contactValidationUseCase.validateFormUseCase(
        contactController: event.contactController);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == ContactValidationState.contactTypeEmpty) {
          emit(ContactValidationContactTypeEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        } else if (element == ContactValidationState.contactNoEmpty) {
          emit(ContactValidationContactNoEmptyState(
            validationMessage: S.current.thisFieldIsRequired,
          ));
        }
      }
    } else {
      emit(ContactLoadingState());
      InsertContactRequest insertContactRequest = InsertContactRequest(
          id: 0,
          companyId: await _getCompanyIdUseCase() ?? 0,
          employeeId: await _getEmployeeIdUseCase() ?? 0,
          transactionStatusId: 1,
          transactionStatusName: "string",
          transactionStatusCode: "string",
          remarks: event.contactController.remark.text,
          workFlowId: 0,
          workFlowName: "string",
          isEnabled: true,
          contactName: event.contactController.contactType.text,
          contactTypeId: "${event.contactTypeId}",
          contactNo: event.contactController.contactNo.text,
          isDeleted: false);
      DataState dataState = await _insertContactUseCase(
        request: insertContactRequest,
      );
      if (dataState is DataSuccess<TalentLinkResponse>) {
        emit(ContactSubmitSuccessState(
            successMessage: dataState.data!.responseMessage ?? ""));
      } else {
        emit(ContactSubmitErrorState(
            errorMessage: dataState.error!.error.toString()));
      }
    }
  }

  FutureOr<void> _onSelectContactTypeEvent(
      SelectContactTypeEvent event, Emitter<ContactState> emit) {
    emit(SelectContactTypeState(contactType: event.contactType));
  }

  FutureOr<void> _onContactDataFillingEvent(
      ContactDataFillingEvent event, Emitter<ContactState> emit) {
    if (event.contactController.contactNo.text != "" ||
        event.contactController.contactType.text != "" ||
        event.contactController.remark.text != "") {
      emit(ContactDataFillingSuccessState());
    } else {
      emit(ContactDataFillingErrorState());
    }
  }
}
