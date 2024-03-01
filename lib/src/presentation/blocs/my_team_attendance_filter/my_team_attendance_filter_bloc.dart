import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/utils/validation/my_team_attendance_filter_validator.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance_filter/my_team_attendance_filter.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/domain/usecase/my_team_attendance_history/my_team_attendance_validation_use_case.dart';

part 'my_team_attendance_filter_event.dart';

part 'my_team_attendance_filter_state.dart';

class MyTeamAttendanceFilterBloc
    extends Bloc<MyTeamAttendanceFilterEvent, MyTeamAttendanceFilterState> {
  final MyTeamAttendanceValidationUseCase _myTeamAttendanceValidationUseCase;

  MyTeamAttendanceFilterBloc(this._myTeamAttendanceValidationUseCase)
      : super(MyTeamAttendanceFilterInitialState()) {
    on<MyTeamAttendanceValidationFromDateEvent>(
        _onMyTeamAttendanceValidationFromDateEvent);
    on<MyTeamAttendanceValidationToDateEvent>(
        _onMyTeamAttendanceValidationToDateEvent);
    on<MyTeamAttendanceApplyFilterEvent>(_onMyTeamAttendanceApplyFilterEvent);
    on<OpenEmployeesScreenEvent>(_onOpenEmployeesScreenEvent);
    on<OpenCompaniesScreenEvent>(_onOpenCompaniesScreenEvent);
    on<SelectCompanyFromSearchScreenEvent>(
        _onSelectCompanyFromSearchScreenEvent);
    on<SelectEmployeeFromSearchScreenEvent>(
        _onSelectEmployeeFromSearchScreenEvent);
    on<SaveEmployeesFilterEvent>(_onSaveEmployeesFilterEvent);
    on<MyTeamAttendanceFilterSelectCompanyEvent>(
        _onMyTeamAttendanceFilterSelectCompanyEvent);
    on<MyTeamAttendanceFilterUnSelectCompanyEvent>(
        _onMyTeamAttendanceFilterUnSelectCompanyEvent);
    on<ResetMyTeamAttendanceFilterEvent>(_onResetMyTeamAttendanceFilterEvent);

  }

  final List<AllowEmployees> _employeesFilter = [];
  int _companyId = 0;

  FutureOr<void> _onMyTeamAttendanceValidationFromDateEvent(
      MyTeamAttendanceValidationFromDateEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    MyTeamAttendanceFilterValidationState validationState =
        _myTeamAttendanceValidationUseCase.validateFromDate(
            event.fromDate, event.toDate);
    if (validationState == MyTeamAttendanceFilterValidationState.valid) {
      emit(ValidationMyTeamAttendanceFilterFromDateValidState());
    } else if (validationState ==
        MyTeamAttendanceFilterValidationState.fromDateNotValid) {
      emit(ValidationMyTeamAttendanceFilterFromDateNotValidState(
        validationMessage: S.current.dateNotValid,
      ));
    } else {
      emit(ValidationMyTeamAttendanceFilterFromDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onMyTeamAttendanceValidationToDateEvent(
      MyTeamAttendanceValidationToDateEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    MyTeamAttendanceFilterValidationState validationState =
        _myTeamAttendanceValidationUseCase.validateToDate(
            event.toDate, event.fromDate);
    if (validationState == MyTeamAttendanceFilterValidationState.valid) {
      emit(ValidationMyTeamAttendanceFilterToDateValidState());
    } else if (validationState ==
        MyTeamAttendanceFilterValidationState.toDateNotValid) {
      emit(ValidationMyTeamAttendanceFilterToDateNotValidState(
        validationMessage: S.current.dateNotValid,
      ));
    } else {
      emit(ValidationMyTeamAttendanceFilterToDateNotValidState(
        validationMessage: S.current.cantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onMyTeamAttendanceApplyFilterEvent(
      MyTeamAttendanceApplyFilterEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    final validationsState = _myTeamAttendanceValidationUseCase
        .validateFormUseCase(fromDate: event.fromDate, toDate: event.toDate);
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == MyTeamAttendanceFilterValidationState.fromDateEmpty) {
          emit(ValidationMyTeamAttendanceFilterFromDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyTeamAttendanceFilterValidationState.fromDateNotValid) {
          emit(ValidationMyTeamAttendanceFilterFromDateNotValidState(
              validationMessage: S.current.dateNotValid));
        } else if (element ==
            MyTeamAttendanceFilterValidationState.toDateEmpty) {
          emit(ValidationMyTeamAttendanceFilterToDateNotValidState(
              validationMessage: S.current.cantBeEmpty));
        } else if (element ==
            MyTeamAttendanceFilterValidationState.toDateNotValid) {
          emit(ValidationMyTeamAttendanceFilterToDateNotValidState(
              validationMessage: S.current.dateNotValid));
        }
      }
    } else {
      emit(ApplyFilterState(
          myTeamAttendanceFilter: event.myTeamAttendanceFilter));
    }
  }

  FutureOr<void> _onOpenEmployeesScreenEvent(OpenEmployeesScreenEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    List<SearchableItem> searchable = [];
    for (var element in event.myTeamAttendanceFilter.employees!) {
      if (event.myTeamAttendanceFilter.companyId == element.companyId) {
        searchable.add(SearchableItem(
          isChecked: element.isSelected,
          id: element.employeeId,
          title: element.employeeName,
          parentId: element.companyId,
        ));
      }
    }

    emit(OpenEmployeesScreenState(
      searchableModel:
          SearchableModel(title: event.title, searchableItems: searchable),
    ));
  }

  FutureOr<void> _onOpenCompaniesScreenEvent(OpenCompaniesScreenEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    List<SearchableItem> searchable = [];
    for (var element in event.companies) {
      searchable.add(SearchableItem(
          isChecked: element.isSelected,
          id: element.companyId,
          title: element.companyName,
          parentId: element.parentId));
    }
    emit(OpenCompaniesScreenState(
      searchableModel:
          SearchableModel(title: event.title, searchableItems: searchable),
    ));
  }

  FutureOr<void> _onSelectCompanyFromSearchScreenEvent(
      SelectCompanyFromSearchScreenEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    List<AllowedCompanies> companyResult = [];
    _employeesFilter.clear();
    String companyController = '';
    String employeeController = '';
    for (var company in event.searchable) {
      if (company.isChecked == true) {
        companyController = company.title;
        employeeController = '';
        event.myTeamAttendanceFilter.companyId = company.id;
        event.myTeamAttendanceFilter.employees?.forEach((element) {
          element.isSelected = false;
          event.myTeamAttendanceFilter.employeeId = 0;
        });
        for (var element in event.searchable) {
          companyResult.add(AllowedCompanies(
              companyId: element.id,
              isSelected: element.isChecked,
              companyName: element.title,
              parentId: element.parentId));
        }
        for (var employee in event.myTeamAttendanceFilter.employees!) {
          if (employee.companyId == company.id) {
            employee.isSelected = false;
            _employeesFilter.add(employee);
          }
        }
        event.myTeamAttendanceFilter.companies = companyResult;
        emit(SelectCompanyFromSearchScreenState(
            companies: event.myTeamAttendanceFilter.companies!,
            employeeController: employeeController,
            companyController: companyController,
            employees: _employeesFilter));
      }
    }
  }

  FutureOr<void> _onSelectEmployeeFromSearchScreenEvent(
      SelectEmployeeFromSearchScreenEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    String employeeController = '';
    late AllowEmployees employeeResult;
    for (var element in event.searchable) {
      if (element.isChecked == true) {
        employeeController = element.title;
        event.myTeamAttendanceFilter.employeeId = element.id;
        for (var element in event.searchable) {
          employeeResult = AllowEmployees(
              companyId: element.parentId,
              isSelected: element.isChecked,
              employeeName: element.title,
              employeeId: element.id);
        }
        event.myTeamAttendanceFilter.employees?.forEach((element) {
          if (element.companyId == employeeResult.companyId) {
            element.isSelected = true;
          }
        });
        emit(SelectEmployeeFromSearchScreenState(
            employees: event.myTeamAttendanceFilter.employees!,
            employeeController: employeeController));
      }
    }
  }

  FutureOr<void> _onSaveEmployeesFilterEvent(SaveEmployeesFilterEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    emit(SaveEmployeesFilterState(myTeamAttendanceFilter: event.myTeamAttendanceFilter)) ;
  }

  FutureOr<void> _onMyTeamAttendanceFilterSelectCompanyEvent(
      MyTeamAttendanceFilterSelectCompanyEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    emit(MyTeamAttendanceFilterSelectCompanyState(
      allowedCompanies: _addSelectedAndChildren(event.companies, event.company),
      companyId: event.company.companyId,
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

  FutureOr<void> _onMyTeamAttendanceFilterUnSelectCompanyEvent(
      MyTeamAttendanceFilterUnSelectCompanyEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    emit(MyTeamAttendanceFilterUnSelectCompanyState(
        allowedCompanies:
            _backSelectedAndChildren(event.companies, event.company),
        companyId: _companyId));
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
  FutureOr<void> _onResetMyTeamAttendanceFilterEvent(
      ResetMyTeamAttendanceFilterEvent event,
      Emitter<MyTeamAttendanceFilterState> emit) {
    for (var element in event.myTeamAttendanceFilter.companies!) {
      element.isSelected = false;
    }
    for (var element in  event.myTeamAttendanceFilter.employees!) {
      element.isSelected = false;
    }
    event.myTeamAttendanceFilter.fromDate =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    event.myTeamAttendanceFilter.toDate =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    event.myTeamAttendanceFilter.employeeId = 0;
    event.myTeamAttendanceFilter.companyId = 0;
    emit(ResetMyTeamAttendanceFilterState(
        myTeamAttendanceFilter:  event.myTeamAttendanceFilter));
  }
}
