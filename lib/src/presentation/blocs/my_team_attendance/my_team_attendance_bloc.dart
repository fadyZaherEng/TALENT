import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_employees.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance_filter/my_team_attendance_filter.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_attendance_history/get_my_team_attendance_history_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_attendance_history/get_my_team_attendance_statistics_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/get_companies_and_employees_list.dart';

part 'my_team_attendance_event.dart';

part 'my_team_attendance_state.dart';

class MyTeamAttendanceBloc
    extends Bloc<MyTeamAttendanceEvent, MyTeamAttendanceState> {
  final GetMyTeamAttendanceHistoryUseCase _getMyTeamAttendanceHistoryUseCase;
  final GetMyTeamAttendanceStatisticsUseCase
      _getMyTeamAttendanceStatisticsUseCase;
  final GetCompaniesAndEmployeesListUseCase
      _getCompaniesAndEmployeesListUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetLanguageUseCase _getLanguageUseCase;

  MyTeamAttendanceBloc(
    this._getMyTeamAttendanceHistoryUseCase,
    this._getMyTeamAttendanceStatisticsUseCase,
    this._getCompaniesAndEmployeesListUseCase,
    this._getEmployeeIdUseCase,
    this._getLanguageUseCase,
  ) : super(MyTeamAttendanceInitialState()) {
    on<MyTeamAttendanceBackEvent>(_onMyTeamAttendanceBackEvent);
    on<GetMyTeamAttendanceEvent>(_onGetMyTeamAttendanceEvent);
    on<GetMyTeamAttendanceStatisticsEvent>(
        _onGetMyTeamAttendanceStatisticsEvent);
    on<OpenMyTeamAttendanceFilterEvent>(_onOpenMyTeamAttendanceFilterEvent);
    on<GetMyTeamAttendanceFilterEvent>(_onGetMyTeamAttendanceFilterEvent);
    on<ApplyFilterMyTeamAttendanceEvent>(_onApplyFilterMyTeamAttendanceEvent);
    on<GetCompaniesAndEmployeesEvent>(_onGetCompaniesAndEmployeesEvent);
    on<UpdateDateEvent>(_onUpdateDateEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
  }

  List<MyTeamAttendance> _myTeamAttendances = [];
  late MyTeamAttendanceStatistics _myTeamAttendanceStatistics;
  final MyTeamAttendanceFilter _myTeamAttendanceFilter = MyTeamAttendanceFilter(
    companies: [],
    employees: [],
    fromDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
    toDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
    fromDateErrorMessage: null,
    toDateErrorMessage: null,
  );
  List<AllowEmployees> _employees = [];

  FutureOr<void> _onMyTeamAttendanceBackEvent(
      MyTeamAttendanceBackEvent event, Emitter<MyTeamAttendanceState> emit) {
    emit(MyTeamAttendanceBackState());
  }

  FutureOr<void> _onGetMyTeamAttendanceEvent(GetMyTeamAttendanceEvent event,
      Emitter<MyTeamAttendanceState> emit) async {
    emit(MyTeamAttendanceSkeletonState());
    DataState dataState = await _getMyTeamAttendanceHistoryUseCase(
        attendanceDateFrom: event.fromDate,
        attendanceDateTo: event.toDate,
        filterCompanyId: event.myTeamAttendanceFilter.companyId ?? 0,
        filterEmployeeId: event.myTeamAttendanceFilter.employeeId ?? 0,
        managerEmployeeId: await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<List<MyTeamAttendance>>) {
      _myTeamAttendances = dataState.data!;
      emit(GetMyTeamAttendanceSuccessState(
        myTeamAttendance: _myTeamAttendances,
        companyId: event.myTeamAttendanceFilter.companyId ?? 0,
        employeeId: event.myTeamAttendanceFilter.employeeId ?? 0,
      ));
    } else {
      emit(GetMyTeamAttendanceErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetMyTeamAttendanceStatisticsEvent(
      GetMyTeamAttendanceStatisticsEvent event,
      Emitter<MyTeamAttendanceState> emit) async {
    emit(MyTeamAttendanceSkeletonState());
    DataState dataState = await _getMyTeamAttendanceStatisticsUseCase(
        attendanceDate: event.attendanceDate,
        managerEmployeeId: await _getEmployeeIdUseCase() ?? 0,
        filterCompanyId: event.myTeamAttendanceFilter.companyId ?? 0);
    if (dataState is DataSuccess<MyTeamAttendanceStatistics>) {
      _myTeamAttendanceStatistics = dataState.data!;
      emit(GetMyTeamAttendanceStatisticsSuccessState(
          myTeamAttendanceStatistics: _myTeamAttendanceStatistics));
    } else {
      emit(GetMyTeamAttendanceStatisticsErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onOpenMyTeamAttendanceFilterEvent(
      OpenMyTeamAttendanceFilterEvent event,
      Emitter<MyTeamAttendanceState> emit) {
    emit(OpenMyTeamAttendanceFilterState());
  }

  FutureOr<void> _onGetMyTeamAttendanceFilterEvent(
      GetMyTeamAttendanceFilterEvent event,
      Emitter<MyTeamAttendanceState> emit) {
    MyTeamAttendanceFilter copy = _myTeamAttendanceFilter.copy();
    int filterEmployeeId = 0;
    int filterCompanyId = 0;
    for (var element in copy.employees!) {
      if (element.isSelected == true) {
        filterEmployeeId = element.employeeId;
      }
    }
    for (var element in copy.companies!) {
      if (element.isSelected == true) {
        filterCompanyId = element.companyId;
      }
    }

    emit(GetMyTeamAttendanceFilterSuccessState(
        myTeamAttendanceFilter: copy,
        filterEmployeeId: filterEmployeeId,
        filterCompanyId: filterCompanyId));
  }

  FutureOr<void> _onApplyFilterMyTeamAttendanceEvent(
      ApplyFilterMyTeamAttendanceEvent event,
      Emitter<MyTeamAttendanceState> emit) {
    emit(MyTeamAttendanceApplyFilterState(
        myTeamAttendanceFilter: event.myTeamAttendanceFilter));
  }

  FutureOr<void> _onGetCompaniesAndEmployeesEvent(
      GetCompaniesAndEmployeesEvent event,
      Emitter<MyTeamAttendanceState> emit) async {
    emit(MyTeamAttendanceSkeletonState());
    DataState dataState = await _getCompaniesAndEmployeesListUseCase(
        employeeId: await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<CompaniesAndEmployeesList>) {
      _myTeamAttendanceFilter.companies =
          buildCompanyHierarchy(dataState.data?.allowedCompanies ?? []);
      _myTeamAttendanceFilter.employees = dataState.data!.allowedEmployees;
      _employees = dataState.data!.allowedEmployees;
      emit(GetCompaniesAndEmployeesSuccessState(
          myTeamAttendanceFilter: _myTeamAttendanceFilter));
      // add(GetMyTeamAttendanceFilterEvent());
    } else {
      emit(GetMyTeamAttendanceFilterErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onUpdateDateEvent(
      UpdateDateEvent event, Emitter<MyTeamAttendanceState> emit) {
    _myTeamAttendanceFilter.fromDate = event.fromDate;
    _myTeamAttendanceFilter.toDate = event.toDate;
    emit(UpdateDateState(
      myTeamAttendanceFilter: _myTeamAttendanceFilter,
    ));
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<MyTeamAttendanceState> emit) async {
    String isEnglish = await _getLanguageUseCase() ?? "";
    emit(GetLanguageState(isEnglish: isEnglish == "en" ? true : false));
  }

  // List<AllowedCompanies> buildCompanyHierarchy(
  //     List<AllowedCompanies> allCompanies) {
  //   final Map<int, AllowedCompanies> companyMap = {};
  //
  //   // Create a map to look up companies by their companyId
  //   allCompanies.forEach((company) {
  //     companyMap[company.companyId] = company;
  //   });
  //
  //   final List<AllowedCompanies> hierarchy = [];
  //
  //   allCompanies.forEach((company) {
  //     final parentCompany = companyMap[company.parentId];
  //     if (parentCompany != null) {
  //       parentCompany.addChild(company);
  //     } else {
  //       hierarchy.add(company);
  //     }
  //   });
  //
  //   return hierarchy;
  // }

  List<AllowedCompanies> buildCompanyHierarchy(
      List<AllowedCompanies> companyData) {
    Map<int, AllowedCompanies> companiesMap = {};

    for (var company in companyData) {
      companiesMap[company.companyId] = company;
    }

    void buildHierarchy(AllowedCompanies companyModel) {
      for (var company in companyData) {
        if (companyModel.companyId == company.parentId) {
          companyModel.addChild(company);
          buildHierarchy(company);
        }
      }
    }

    List<AllowedCompanies> rootCompanies = [];
    for (var company in companiesMap.values) {
      if (!companiesMap.containsKey(company.parentId)) {
        rootCompanies.add(company);
        buildHierarchy(company);
      }
    }
    return rootCompanies;
  }
}
