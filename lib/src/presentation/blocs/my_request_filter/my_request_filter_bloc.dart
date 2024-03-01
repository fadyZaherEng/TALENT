import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/utils/validation/my_requests_filter_validator.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request_filter.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/domain/usecase/my_requests/my_requests_validation_use_case.dart';

part 'my_request_filter_event.dart';

part 'my_request_filter_state.dart';

class MyRequestFilterBloc
    extends Bloc<MyRequestFilterEvent, MyRequestFilterState> {
  final MyRequestsValidationUseCase _myRequestsValidationUseCase;

  MyRequestFilterBloc(this._myRequestsValidationUseCase)
      : super(MyRequestFilterInitial()) {
    on<OpenRequestScreenEvent>(_onOpenRequestScreenEvent);
    on<ApplyFilterEvent>(_onApplyFilterEvent);
    on<ValidationMyRequestFilterFromRequestedDateEvent>(
        _onValidationMyRequestFilterFromRequestedDateEvent);
    on<ValidationMyRequestFilterToRequestedDateEvent>(
        _onValidationMyRequestFilterToRequestedDateEvent);
    on<ValidationMyRequestFilterFromCreatedDateEvent>(
        _onValidationMyRequestFilterFromCreatedDateEvent);
    on<ValidationMyRequestFilterToCreatedDateEvent>(
        _onValidationMyRequestFilterToCreatedDateEvent);
    on<SelectRequestFromSearchScreenEvent>(
        _onSelectRequestFromSearchScreenEvent);
    on<ResetMyRequestsFilterEvent>(_onResetMyRequestsFilterEvent);
  }

  FutureOr<void> _onOpenRequestScreenEvent(
      OpenRequestScreenEvent event, Emitter<MyRequestFilterState> emit) {
    List<SearchableItem> searchable = [];
    for (var element in event.requests) {
      searchable.add(SearchableItem(
        isChecked: element.isSelected,
        id: element.id,
        title: element.name,
      ));
    }
    emit(OpenRequestScreenState(
      searchableModel:
          SearchableModel(title: event.title, searchableItems: searchable),
    ));
  }

  FutureOr<void> _onApplyFilterEvent(
      ApplyFilterEvent event, Emitter<MyRequestFilterState> emit) {
    final validationsState = _myRequestsValidationUseCase.validateFormUseCase(
      fromCreatedDate: event.fromCreateDate,
      fromRequestDate: event.fromRequestDate,
      toCreatedDate: event.toCreateDate,
      toRequestDate: event.toRequestDate,
    );
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == MyRequestsFilterValidationState.fromRequestDateEmpty) {
          emit(ValidationMyRequestFilterFromRequestedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyRequestsFilterValidationState.fromRequestDateNotValid) {
          emit(ValidationMyRequestFilterFromRequestedDateNotValidState(
              validationMessage: S.current.notValid));
        } else if (element ==
            MyRequestsFilterValidationState.toRequestDateEmpty) {
          emit(ValidationMyRequestFilterToRequestedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyRequestsFilterValidationState.toRequestDateNotValid) {
          emit(ValidationMyRequestFilterToRequestedDateNotValidState(
              validationMessage: S.current.notValid));
        } else if (element ==
            MyRequestsFilterValidationState.fromCreatedDateEmpty) {
          emit(ValidationMyRequestFilterFromCreatedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyRequestsFilterValidationState.fromCreatedDateNotValid) {
          emit(ValidationMyRequestFilterFromCreatedDateNotValidState(
              validationMessage: S.current.notValid));
        } else if (element ==
            MyRequestsFilterValidationState.toCreatedDateEmpty) {
          emit(ValidationMyRequestFilterToCreatedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyRequestsFilterValidationState.toCreatedDateNotValid) {
          emit(ValidationMyRequestFilterToCreatedDateNotValidState(
              validationMessage: S.current.notValid));
        }
      }
    } else {
      emit(ApplyFilterState(myRequestFilter: event.myRequestFilter));
    }
  }

  FutureOr<void> _onValidationMyRequestFilterFromRequestedDateEvent(
      ValidationMyRequestFilterFromRequestedDateEvent event,
      Emitter<MyRequestFilterState> emit) {
    MyRequestsFilterValidationState validationState =
        _myRequestsValidationUseCase.validateFromRequestDate(
            event.fromRequestDate, event.toRequestDate);
    if (validationState == MyRequestsFilterValidationState.valid) {
      emit(ValidationMyRequestFilterFromRequestedDateValidState());
    } else if (validationState ==
        MyRequestsFilterValidationState.fromRequestDateNotValid) {
      emit(ValidationMyRequestFilterFromRequestedDateNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      emit(ValidationMyRequestFilterFromRequestedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onValidationMyRequestFilterToRequestedDateEvent(
      ValidationMyRequestFilterToRequestedDateEvent event,
      Emitter<MyRequestFilterState> emit) {
    MyRequestsFilterValidationState validationState =
        _myRequestsValidationUseCase.validateToRequestDate(
            event.toRequestDate, event.fromRequestDate);
    if (validationState == MyRequestsFilterValidationState.valid) {
      emit(ValidationMyRequestFilterToRequestedDateValidState());
    } else if (validationState ==
        MyRequestsFilterValidationState.toRequestDateNotValid) {
      emit(ValidationMyRequestFilterToRequestedDateNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      emit(ValidationMyRequestFilterToRequestedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onValidationMyRequestFilterFromCreatedDateEvent(
      ValidationMyRequestFilterFromCreatedDateEvent event,
      Emitter<MyRequestFilterState> emit) {
    MyRequestsFilterValidationState validationState =
        _myRequestsValidationUseCase.validateFromCreatedDate(
            event.fromCreatedDate, event.toCreatedDate);
    if (validationState == MyRequestsFilterValidationState.valid) {
      emit(ValidationMyRequestFilterFromCreatedDateValidState());
    } else if (validationState ==
        MyRequestsFilterValidationState.fromCreatedDateNotValid) {
      emit(ValidationMyRequestFilterFromCreatedDateNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      emit(ValidationMyRequestFilterFromCreatedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onValidationMyRequestFilterToCreatedDateEvent(
      ValidationMyRequestFilterToCreatedDateEvent event,
      Emitter<MyRequestFilterState> emit) {
    MyRequestsFilterValidationState validationState =
        _myRequestsValidationUseCase.validateToCreatedDate(
            event.toCreatedDate, event.fromCreatedDate);
    if (validationState == MyRequestsFilterValidationState.valid) {
      emit(ValidationMyRequestFilterToCreatedDateValidState());
    } else if (validationState ==
        MyRequestsFilterValidationState.toCreatedDateNotValid) {
      emit(ValidationMyRequestFilterToCreatedDateNotValidState(
        validationMessage: S.current.notValid,
      ));
    } else {
      emit(ValidationMyRequestFilterToCreatedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onSelectRequestFromSearchScreenEvent(
      SelectRequestFromSearchScreenEvent event,
      Emitter<MyRequestFilterState> emit) {
    List<RequestType> requestResult = [];
    String requestController = '';
    for (var element in event.searchable) {
      if (element.isChecked == true) {
        requestController = element.title;
        for (var element in event.searchable) {
          requestResult.add(RequestType(
              id: element.id,
              isSelected: element.isChecked,
              name: element.title));
        }
        event.myRequestFilter.requests = requestResult;
        emit(SelectRequestFromSearchScreenState(
          requests: event.myRequestFilter.requests!,
          requestController: requestController,
        ));
      }
    }
  }

  FutureOr<void> _onResetMyRequestsFilterEvent(
      ResetMyRequestsFilterEvent event, Emitter<MyRequestFilterState> emit) {
    for (var element in event.myRequestFilter.status!) {
      element.isSelected = false;
    }
    for (var element in event.myRequestFilter.requests!) {
      element.isSelected = false;
    }
    event.myRequestFilter.fromRequestedDate =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    event.myRequestFilter.toCreatedDate =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    event.myRequestFilter.fromCreatedDate =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    event.myRequestFilter.toRequestedDate =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    emit(ResetMyRequestsFilterState(myRequestFilter: event.myRequestFilter));
  }
}
