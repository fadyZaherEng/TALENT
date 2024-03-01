import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/utils/validation/my_team_requests_filter_validator.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';
import 'package:talent_link/src/domain/entities/my_team_requests_filter/my_team_requests_filter.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/my_team_request_filter_validation_use_case.dart';

part 'my_team_requests_filter_event.dart';

part 'my_team_requests_filter_state.dart';

class MyTeamRequestsFilterBloc
    extends Bloc<MyTeamRequestsFilterEvent, MyTeamRequestsFilterState> {
  final MyTeamRequestsValidationUseCase _myTeamRequestsValidationUseCase;

  MyTeamRequestsFilterBloc(this._myTeamRequestsValidationUseCase)
      : super(MyTeamRequestsFilterInitialState()) {
    on<NavigateToCompaniesScreenEvent>(_onNavigateToCompaniesScreenEvent);
    on<NavigateToRequestsScreenEvent>(_onNavigateToRequestsScreenEvent);
    on<NavigateToEmployeesScreenEvent>(_onNavigateToEmployeesScreenEvent);
    on<ValidationMyTeamRequestFilterFromRequestedDateEvent>(
        _onValidationMyTeamRequestFilterFromRequestedDateEvent);
    on<ValidationMyTeamRequestFilterToRequestedDateEvent>(
        _onValidationMyTeamRequestFilterToRequestedDateEvent);
    on<ValidationMyTeamRequestFilterFromCreatedDateEvent>(
        _onValidationMyTeamRequestFilterFromCreatedDateEvent);
    on<ValidationMyTeamRequestFilterToCreatedDateEvent>(
        _onValidationMyTeamRequestFilterToCreatedDateEvent);
    on<ApplyFilterEvent>(_onApplyFilterEvent);
    on<SelectCompanyFromSearchScreenEvent>(
        _onSelectCompanyFromSearchScreenEvent);
    on<SelectEmployeeFromSearchScreenEvent>(
        _onSelectEmployeeFromSearchScreenEvent);
    on<SelectRequestFromSearchScreenEvent>(
        _onSelectRequestFromSearchScreenEvent);
    on<SaveEmployeesFilterEvent>(_onSaveMyTeamRequestFilterEvent);
    on<MyTeamRequestsFilterSelectCompanyEvent>(
        _onMyTeamRequestsFilterSelectCompanyEvent);
    on<MyTeamRequestsFilterUnSelectCompanyEvent>(
        _onMyTeamRequestsFilterUnSelectCompanyEvent);
    on<ResetMyTeamRequestsFilterEvent>(_onResetMyTeamRequestsFilterEvent);
  }

  final List<AllowEmployees> _employeesFilter = [];
  int _companyId = 0;

  FutureOr<void> _onNavigateToCompaniesScreenEvent(
      NavigateToCompaniesScreenEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    List<SearchableItem> searchable = [];
    for (var element in event.companies) {
      searchable.add(SearchableItem(
          isChecked: element.isSelected,
          id: element.companyId,
          title: element.companyName,
          parentId: element.parentId));
    }

    emit(NavigateToCompaniesScreenState(
        searchableModel: SearchableModel(
      title: event.title,
      searchableItems: searchable,
    )));
  }

  FutureOr<void> _onNavigateToRequestsScreenEvent(
      NavigateToRequestsScreenEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    List<SearchableItem> searchable = [];
    for (var element in event.requests) {
      searchable.add(SearchableItem(
        isChecked: element.isSelected,
        id: element.id,
        title: element.name,
      ));
    }
    emit(NavigateToRequestsScreenState(
        searchableModel: SearchableModel(
      title: event.title,
      searchableItems: searchable,
    )));
  }

  FutureOr<void> _onNavigateToEmployeesScreenEvent(
      NavigateToEmployeesScreenEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    List<SearchableItem> searchable = [];
    for (var element in event.myTeamRequestFilter.employees!) {
      if (event.myTeamRequestFilter.filterCompanyId == element.companyId) {
        searchable.add(SearchableItem(
          isChecked: element.isSelected,
          id: element.employeeId,
          title: element.employeeName,
          parentId: element.companyId,
        ));
      }
    }
    emit(NavigateToEmployeesScreenState(
        searchableModel: SearchableModel(
      title: event.title,
      searchableItems: searchable,
    )));
  }

  FutureOr<void> _onValidationMyTeamRequestFilterFromRequestedDateEvent(
      ValidationMyTeamRequestFilterFromRequestedDateEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    MyTeamRequestsFilterValidationState validationState =
        _myTeamRequestsValidationUseCase.validateFromRequestDate(
            event.fromRequestDate, event.toRequestDate);
    if (validationState == MyTeamRequestsFilterValidationState.valid) {
      emit(ValidationMyTeamRequestFilterFromRequestedDateValidState());
    } else if (validationState ==
        MyTeamRequestsFilterValidationState.fromRequestDateNotValid) {
      emit(ValidationMyTeamRequestFilterFromRequestedDateNotValidState(
        validationMessage: S.current.dateNotValid,
      ));
    } else {
      emit(ValidationMyTeamRequestFilterFromRequestedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onValidationMyTeamRequestFilterToRequestedDateEvent(
      ValidationMyTeamRequestFilterToRequestedDateEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    MyTeamRequestsFilterValidationState validationState =
        _myTeamRequestsValidationUseCase.validateToRequestDate(
            event.toRequestDate, event.fromRequestDate);
    if (validationState == MyTeamRequestsFilterValidationState.valid) {
      emit(ValidationMyTeamRequestFilterToRequestedDateValidState());
    } else if (validationState ==
        MyTeamRequestsFilterValidationState.toRequestDateNotValid) {
      emit(ValidationMyTeamRequestFilterToRequestedDateNotValidState(
        validationMessage: S.current.dateNotValid,
      ));
    } else {
      emit(ValidationMyTeamRequestFilterToRequestedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onValidationMyTeamRequestFilterFromCreatedDateEvent(
      ValidationMyTeamRequestFilterFromCreatedDateEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    MyTeamRequestsFilterValidationState validationState =
        _myTeamRequestsValidationUseCase.validateFromCreatedDate(
            event.fromCreatedDate, event.toCreatedDate);
    if (validationState == MyTeamRequestsFilterValidationState.valid) {
      emit(ValidationMyTeamRequestFilterFromCreatedDateValidState());
    } else if (validationState ==
        MyTeamRequestsFilterValidationState.fromCreatedDateNotValid) {
      emit(ValidationMyTeamRequestFilterFromCreatedDateNotValidState(
        validationMessage: S.current.dateNotValid,
      ));
    } else {
      emit(ValidationMyTeamRequestFilterFromCreatedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onValidationMyTeamRequestFilterToCreatedDateEvent(
      ValidationMyTeamRequestFilterToCreatedDateEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    MyTeamRequestsFilterValidationState validationState =
        _myTeamRequestsValidationUseCase.validateToCreatedDate(
            event.toCreatedDate, event.fromCreatedDate);
    if (validationState == MyTeamRequestsFilterValidationState.valid) {
      emit(ValidationMyTeamRequestFilterToCreatedDateValidState());
    } else if (validationState ==
        MyTeamRequestsFilterValidationState.toCreatedDateNotValid) {
      emit(ValidationMyTeamRequestFilterToCreatedDateNotValidState(
        validationMessage: S.current.dateNotValid,
      ));
    } else {
      emit(ValidationMyTeamRequestFilterToCreatedDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onApplyFilterEvent(
      ApplyFilterEvent event, Emitter<MyTeamRequestsFilterState> emit) {
    final validationsState =
        _myTeamRequestsValidationUseCase.validateFormUseCase(
      fromCreatedDate: event.fromCreateDate,
      fromRequestDate: event.fromRequestDate,
      toCreatedDate: event.toCreateDate,
      toRequestDate: event.toRequestDate,
    );
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element ==
            MyTeamRequestsFilterValidationState.fromRequestDateEmpty) {
          emit(ValidationMyTeamRequestFilterFromRequestedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyTeamRequestsFilterValidationState.fromRequestDateNotValid) {
          emit(ValidationMyTeamRequestFilterFromRequestedDateNotValidState(
              validationMessage: S.current.dateNotValid));
        } else if (element ==
            MyTeamRequestsFilterValidationState.toRequestDateEmpty) {
          emit(ValidationMyTeamRequestFilterToRequestedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyTeamRequestsFilterValidationState.toRequestDateNotValid) {
          emit(ValidationMyTeamRequestFilterToRequestedDateNotValidState(
              validationMessage: S.current.dateNotValid));
        } else if (element ==
            MyTeamRequestsFilterValidationState.fromCreatedDateEmpty) {
          emit(ValidationMyTeamRequestFilterFromCreatedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyTeamRequestsFilterValidationState.fromCreatedDateNotValid) {
          emit(ValidationMyTeamRequestFilterFromCreatedDateNotValidState(
              validationMessage: S.current.dateNotValid));
        } else if (element ==
            MyTeamRequestsFilterValidationState.toCreatedDateEmpty) {
          emit(ValidationMyTeamRequestFilterToCreatedDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyTeamRequestsFilterValidationState.toCreatedDateNotValid) {
          emit(ValidationMyTeamRequestFilterToCreatedDateNotValidState(
              validationMessage: S.current.dateNotValid));
        }
      }
    } else {
      emit(ApplyFilterState(myTeamRequestFilter: event.myTeamRequestFilter));
    }
  }

  FutureOr<void> _onSelectCompanyFromSearchScreenEvent(
      SelectCompanyFromSearchScreenEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    List<AllowedCompanies> companyResult = [];
    _employeesFilter.clear();
    String companyController = '';
    String employeeController = '';
    for (var company in event.searchable) {
      if (company.isChecked == true) {
        companyController = company.title;
        event.myTeamRequestFilter.filterCompanyId = company.id;
        employeeController = '';
        event.myTeamRequestFilter.employees?.forEach((element) {
          element.isSelected = false;
          event.myTeamRequestFilter.filterEmployeeId = 0;
        });
        for (var employee in event.myTeamRequestFilter.employees!) {
          if (employee.companyId == company.id) {
            employee.isSelected = false;
            _employeesFilter.add(employee);
          }
        }
        for (var element in event.searchable) {
          companyResult.add(AllowedCompanies(
              companyId: element.id,
              isSelected: element.isChecked,
              companyName: element.title,
              parentId: element.parentId));
        }
        event.myTeamRequestFilter.companies = companyResult;
        emit(SelectCompanyFromSearchScreenState(
          companies: event.myTeamRequestFilter.companies!,
          employeeController: employeeController,
          companyController: companyController,
          employees: _employeesFilter,
        ));
      }
    }
  }

  FutureOr<void> _onSelectEmployeeFromSearchScreenEvent(
      SelectEmployeeFromSearchScreenEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    late AllowEmployees employeeResult;
    String employeeController = '';
    for (var element in event.searchable) {
      if (element.isChecked == true) {
        employeeController = element.title;
        event.myTeamRequestFilter.filterEmployeeId = element.id;
        for (var element in event.searchable) {
          employeeResult = AllowEmployees(
              companyId: element.parentId,
              isSelected: element.isChecked,
              employeeName: element.title,
              employeeId: element.id);
        }
        event.myTeamRequestFilter.employees?.forEach((element) {
          if (element.companyId == employeeResult.companyId) {
            element.isSelected = true;
          }
        });
        emit(SelectEmployeeFromSearchScreenState(
            employees: event.myTeamRequestFilter.employees!,
            employeeController: employeeController));
      }
    }
  }

  FutureOr<void> _onSelectRequestFromSearchScreenEvent(
      SelectRequestFromSearchScreenEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    List<RequestType> requestsResult = [];
    String requestController = '';
    for (var element in event.searchable) {
      if (element.isChecked == true) {
        requestController = element.title;
        event.myTeamRequestFilter.filterRequestId = element.id;
        for (var element in event.searchable) {
          requestsResult.add(RequestType(
              name: element.title,
              isSelected: element.isChecked,
              id: element.id));
        }
        event.myTeamRequestFilter.requests = requestsResult;
        emit(SelectRequestsFromSearchScreenState(
            requests: event.myTeamRequestFilter.requests!,
            requestController: requestController));
      }
    }
  }

  FutureOr<void> _onSaveMyTeamRequestFilterEvent(
      SaveEmployeesFilterEvent event, Emitter<MyTeamRequestsFilterState> emit) {
    emit(SaveEmployeesFilterState(
        myTeamRequestFilter: event.myTeamRequestFilter));
  }

  FutureOr<void> _onMyTeamRequestsFilterSelectCompanyEvent(
      MyTeamRequestsFilterSelectCompanyEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    emit(MyTeamRequestsFilterSelectCompanyState(
      allowedCompanies: _addSelectedAndChildren(event.companies, event.company),
      companyId: event.company.companyId,
    ));
  }

  FutureOr<void> _onMyTeamRequestsFilterUnSelectCompanyEvent(
      MyTeamRequestsFilterUnSelectCompanyEvent event,
      Emitter<MyTeamRequestsFilterState> emit) {
    emit(MyTeamRequestsFilterUnSelectCompanyState(
      allowedCompanies:
          _backSelectedAndChildren(event.companies, event.company),
      companyId: _companyId,
    ));
  }

  List<AllowedCompanies> _addSelectedAndChildren(
      List<AllowedCompanies> companies, AllowedCompanies company) {
    List<AllowedCompanies> filteredCompanies = [];
    for (var element in companies) {
      if (element.companyId == company.companyId) {
        element.isSelected = true;
        if (element.children != null) {
          filteredCompanies.add(element);
          filteredCompanies.addAll(element.children!);
        }
      } else if (company.parentId == element.companyId) {
        company.isSelected = true;
        filteredCompanies.add(company);
      }
    }
    return filteredCompanies;
  }

  List<AllowedCompanies> _backSelectedAndChildren(
      List<AllowedCompanies> companies, AllowedCompanies company) {
    List<AllowedCompanies> filteredCompanies = [];
    company.isSelected = false;
    for (var element in companies) {
      if (company.parentId == element.companyId) {
        filteredCompanies.add(element);
        filteredCompanies.addAll(element.children!);
        _companyId = element.companyId;
      } else if (company.children!.isNotEmpty) {
        filteredCompanies.add(element);
        _companyId = element.companyId;
      } else if (element.companyId == company.companyId &&
          element.children!.isEmpty) {
        filteredCompanies.addAll(companies);
        _companyId = element.companyId;
      }
    }
    return filteredCompanies;
  }

  FutureOr<void> _onResetMyTeamRequestsFilterEvent(
      ResetMyTeamRequestsFilterEvent event, Emitter<MyTeamRequestsFilterState> emit) {
    for (var element in event.myTeamRequestFilter.requests!) {
      element.isSelected = false;
    }
    for (var element in event.myTeamRequestFilter.employees!) {
      element.isSelected = false;
    }
    for (var element in event.myTeamRequestFilter.companies!) {
      element.isSelected =false;
      if(element.children!.isNotEmpty){
        for (var element in element.children!) {
          element.isSelected =false;
        }
      }
    }
    event.myTeamRequestFilter.fromRequestedDate =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    event.myTeamRequestFilter.toRequestedDate =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    event.myTeamRequestFilter.fromCreatedDate =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    event.myTeamRequestFilter.toCreatedDate =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    event.myTeamRequestFilter.filterEmployeeId = 0;
    event.myTeamRequestFilter.filterCompanyId = 0;
    event.myTeamRequestFilter.filterRequestId = 0;
    emit(ResetMyTeamRequestsFilterState(
        myTeamRequestFilter: event.myTeamRequestFilter));
  }
}
