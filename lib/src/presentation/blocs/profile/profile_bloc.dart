// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';
import 'package:talent_link/src/domain/usecase/home/get_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/get_employee_Id_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/get_employee_profile_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/profile_insert_attachment_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetEmployeeProfileUseCase _getEmployeeProfileUseCase;
  final GetProfileEmployeeIdUseCase _getProfileEmployeeIdUseCase;
  final GetProfileCompanyIdUseCase _getProfileCompanyIdUseCase;
  final ProfileInsertAttachmentUseCase _insertAttachmentUseCase;
  final GetCurrencyUseCase _getCurrencyUseCase;

  ProfileBloc(
    this._getEmployeeProfileUseCase,
    this._getProfileEmployeeIdUseCase,
    this._getProfileCompanyIdUseCase,
    this._insertAttachmentUseCase,
    this._getCurrencyUseCase,
  ) : super(ProfileInitialState()) {
    on<GetProfileInfoEvent>(_onGetProfileInfoEvent);
    on<ChangeProfileImageEvent>(_onChangeProfileImageEvent);
    on<ProfileChangeImagePopDialogEvent>(_onProfileChangeImageDialogEvent);
  }

  FutureOr<void> _onGetProfileInfoEvent(
      GetProfileInfoEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileGetInfoLoadingState());
    await Future.delayed(const Duration(milliseconds: 500)).then(
      (value) async {
        int? employeeId = (await _getProfileEmployeeIdUseCase());
        DataState dataState =
            await _getEmployeeProfileUseCase(employeeId: employeeId ?? 2220);
        if (dataState is DataSuccess<ProfileEmployee>) {
          ProfileEmployee profileEmployee = dataState.data!;
          profileEmployee.currency = (await _getCurrencyUseCase()) ?? "";
          emit(ProfileGetInfoSuccessState(
              dataState.data ??  ProfileEmployee()));
        } else {
          emit(ProfileGetInfoErrorState(errorMSG: dataState.error.toString()));
        }
      },
    );
  }

  FutureOr<void> _onChangeProfileImageEvent(
      ChangeProfileImageEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileChangeImageLoadingState());
    InsertAttachmentRequest insertAttachmentRequest = InsertAttachmentRequest(
      companyId: (await _getProfileCompanyIdUseCase()) ?? 0,
      employeeId: (await _getProfileEmployeeIdUseCase()) ?? 0,
      attachmentTypeId: 12,
    );
    DataState dataState = await _insertAttachmentUseCase.call(
        request: insertAttachmentRequest, file: event.file);
    if (dataState is DataSuccess<TalentLinkResponse>) {
      emit(ProfileChangeImageSuccessState(profileImage: dataState.data!.result[0]));
      emit(ProfileInsertAttachmentSuccessState(
          successMassage: dataState.data!.responseMessage.toString()));
      emit(ProfileHideLoadingState());
    } else {
      emit(ProfileInsertAttachmentErrorState(
          errorMassage: dataState.toString()));
      emit(ProfileChangeImageErrorState());
      emit(ProfileHideLoadingState());
    }
  }

  FutureOr<void> _onProfileChangeImageDialogEvent(
      ProfileChangeImagePopDialogEvent event, Emitter<ProfileState> emit) {
    emit(ProfileChangeImagePopDialogState());
  }
}
