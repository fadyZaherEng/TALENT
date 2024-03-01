import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/domain/entities/my_team_requests_filter/my_team_requests_filter.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_all_requests_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/get_my_team_request.dart';

part 'my_team_requests_event.dart';

part 'my_team_requests_state.dart';

class MyTeamRequestsBloc
    extends Bloc<MyTeamRequestsEvent, MyTeamRequestsState> {
  final GetMyTeamRequestUseCase _getMyTeamRequestUseCase;
  final GetCompaniesAndEmployeesListUseCase
      _getCompaniesAndEmployeesListUseCase;
  final GetAllRequestsListUseCase _getAllRequestsListUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;

  MyTeamRequestsBloc(
      this._getMyTeamRequestUseCase,
      this._getCompaniesAndEmployeesListUseCase,
      this._getAllRequestsListUseCase,
      this._getEmployeeIdUseCase)
      : super(GetMyTeamRequestSkeletonState()) {
    on<MyTeamRequestsBackEvent>(_onMyTeamRequestsBackEvent);
    on<GetMyTeamRequestsEvent>(_onGetMyTeamRequestsEvent);
    on<OpenMyTeamRequestFilterBottomSheetEvent>(
        _onOpenMyTeamRequestFilterBottomSheetEvent);
    on<ApplyFilterMyTeamRequestsEvent>(_onApplyFilterMyTeamRequestsEvent);
    on<GetMyTeamRequestsFilterEvent>(_onGetMyTeamRequestsFilterEvent);
    on<NavigateToTimeLineScreenEvent>(_onNavigateToTimeLineScreenEvent);
    on<GetCompaniesAndEmployeesEvent>(_onGetCompaniesAndEmployeesEvent);
    on<GetAllRequestsEvent>(_onGetAllRequestsEvent);

  }

  List<MyTeamRequest> _myTeamRequests = [];

  final MyTeamRequestFilter _myTeamRequestFilter = MyTeamRequestFilter(
    companies: [],
    requests: [],
    employees: [],
    fromRequestedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
    toRequestedDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
    fromCreatedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
    toCreatedDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
    fromRequestedDateErrorMessage: null,
    toRequestedDateErrorMessage: null,
    fromCreatedDateErrorMessage: null,
    toCreatedDateErrorMessage: null,
  );

  FutureOr<void> _onMyTeamRequestsBackEvent(
      MyTeamRequestsBackEvent event, Emitter<MyTeamRequestsState> emit) {
    emit(MyTeamRequestsBackState());
  }

  FutureOr<void> _onGetMyTeamRequestsEvent(
      GetMyTeamRequestsEvent event, Emitter<MyTeamRequestsState> emit) async {
    emit(GetMyTeamRequestSkeletonState());
    DataState dataState = await _getMyTeamRequestUseCase(
      managerEmployeeId: await _getEmployeeIdUseCase() ?? 0,
      filterCompanyId: event.myTeamRequestFilter.filterCompanyId ?? 0,
      filerEmployeeId: event.myTeamRequestFilter.filterEmployeeId ?? 0,
      requestTypeId: event.myTeamRequestFilter.filterRequestId ?? 0,
      requestFromDate: event.requestFromDate,
      requestToDate: event.requestToDate,
      createdDateAt: event.createdDateAt,
      createdDateFrom: event.createdDateFrom,
      requestDataId: event.requestDataId,
      transactionStatusId: event.transactionStatusId,
    );
    if (dataState is DataSuccess<List<MyTeamRequest>>) {
      _myTeamRequests = dataState.data ?? [];
      emit(GetMyTeamRequestSuccessState(myTeamRequests: _myTeamRequests));
    } else {
      emit(GetMyTeamRequestErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onOpenMyTeamRequestFilterBottomSheetEvent(
      OpenMyTeamRequestFilterBottomSheetEvent event,
      Emitter<MyTeamRequestsState> emit) {
    emit(OpenMyTeamRequestFilterBottomSheetState());
  }

  FutureOr<void> _onApplyFilterMyTeamRequestsEvent(
      ApplyFilterMyTeamRequestsEvent event, Emitter<MyTeamRequestsState> emit) {
    emit(ApplyFilterMyTeamRequestsState(
        myTeamRequestFilter: event.myTeamRequestFilter));
  }

  FutureOr<void> _onGetMyTeamRequestsFilterEvent(
      event, Emitter<MyTeamRequestsState> emit) {
    emit(GetMyTeamRequestSkeletonState());
    MyTeamRequestFilter copy = _myTeamRequestFilter.copy();

    int filterEmployeeId = 0;
    int filterCompanyId = 0;
    int filterRequestId = 0;
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
    for (var element in copy.requests!) {
      if (element.isSelected == true) {
        filterRequestId = element.id;
      }
    }

    emit(GetMyTeamRequestsFilterSuccessState(
        myTeamRequestFilter: copy,
        filterEmployeeId: filterEmployeeId,
        filterCompanyId: filterCompanyId,
        filterRequestId: filterRequestId));
  }

  FutureOr<void> _onNavigateToTimeLineScreenEvent(
      NavigateToTimeLineScreenEvent event, Emitter<MyTeamRequestsState> emit) {
    emit(NavigateToTimeLineScreenState(myTeamRequest: event.myTeamRequest));
  }

  FutureOr<void> _onGetCompaniesAndEmployeesEvent(
      GetCompaniesAndEmployeesEvent event,
      Emitter<MyTeamRequestsState> emit) async {
    emit(GetMyTeamRequestSkeletonState());
    DataState dataState = await _getCompaniesAndEmployeesListUseCase(
        employeeId: await _getEmployeeIdUseCase() ?? 0);
    if (dataState is DataSuccess<CompaniesAndEmployeesList>) {
      _myTeamRequestFilter.companies =
          buildCompanyHierarchy(dataState.data?.allowedCompanies ?? []);
      _myTeamRequestFilter.employees = dataState.data!.allowedEmployees;
      emit(GetCompaniesAndEmployeesSuccessState(
          myTeamRequestFilter: _myTeamRequestFilter));
    } else {
      emit(GetMyTeamRequestsFilterErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

  FutureOr<void> _onGetAllRequestsEvent(
      GetAllRequestsEvent event, Emitter<MyTeamRequestsState> emit) async {
    emit(GetMyTeamRequestSkeletonState());
    DataState dataState = await _getAllRequestsListUseCase();
    if (dataState is DataSuccess<List<RequestType>>) {
      _myTeamRequestFilter.requests = dataState.data!;
      add(GetMyTeamRequestsFilterEvent());
    } else {
      emit(GetAllRequestsErrorState(
          errorMessage: dataState.error!.error.toString()));
    }
  }

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
