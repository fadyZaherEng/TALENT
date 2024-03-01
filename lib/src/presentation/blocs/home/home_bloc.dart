// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_gross_salary_and_currency.dart';
import 'package:talent_link/src/domain/entities/home/ess_permission_singleton.dart';
import 'package:talent_link/src/domain/entities/home/home.dart';
import 'package:talent_link/src/domain/entities/home/home_data.dart';
import 'package:talent_link/src/domain/entities/home/last_requests.dart';
import 'package:talent_link/src/domain/entities/home/last_update_request.dart';
import 'package:talent_link/src/domain/entities/home/news.dart';
import 'package:talent_link/src/domain/entities/home/policies.dart';
import 'package:talent_link/src/domain/entities/home/punch.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_finger_print_number_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_type_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_user_name_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_number_of_digits_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_gross_salary_and_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_home_data_for_dashboard_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_last_requests_for_dashboard_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_news_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_policies_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/insert_punch_from_dashboard_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/navigate_to_quick_access_requests_screen_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_currency_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_gross_salary_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_reset_time_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_ess_permission_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_requests_list_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNewsListUseCase _getNewsListUseCase;
  final GetPoliciesUseCase _getPoliciesUseCase;
  final GetEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetUserNameUseCase _getUserNameUseCase;
  final InsertPunchFromDashboardUseCase _insertPunchFromDashBoardUseCase;
  final GetFingerPrintNumberUseCase _getFingerPrintNumberUseCase;
  final SaveResetTimeUseCase _saveResetTimeUseCase;
  final GetEssPermissionUseCase _getEssPermissionUseCase;
  final GetTypeIdUseCase _getTypeIdUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetRequestsListUseCase _getRequestsListUseCase;
  final NavigateToQuickAccessRequestsScreenUseCase
      _navigateToQuickAccessRequestsScreenUseCase;
  final GetLastRequestsForDashboardUseCase _getLastRequestsForDashboardUseCase;
  final GetHomeDataForDashboardUseCase _getHomeDataForDashboardUseCase;
  final GetGrossSalaryAndCurrencyUseCase _getGrossSalaryAndCurrencyUseCase;
  final SaveNumberOfDigitsUseCase _saveNumberOfDigitsUseCase;
  final SaveBasicSalaryAmountUseCase _saveBasicSalaryAmountUseCase;
  final SaveTotalAllowanceUseCase _saveTotalAllowanceUseCase;
  final SaveCurrencyIdUseCase _saveCurrencyIdUseCase;
  final SaveCurrencyUseCase _saveCurrencyUseCase;
  final SaveGrossSalaryUseCase _saveGrossSalaryUseCase;

  HomeBloc(
    this._getNewsListUseCase,
    this._getPoliciesUseCase,
    this._getEmployeeIdUseCase,
    this._getFingerPrintNumberUseCase,
    this._getUserNameUseCase,
    this._insertPunchFromDashBoardUseCase,
    this._saveResetTimeUseCase,
    this._getEssPermissionUseCase,
    this._getTypeIdUseCase,
    this._getLanguageUseCase,
    this._getRequestsListUseCase,
    this._navigateToQuickAccessRequestsScreenUseCase,
    this._getLastRequestsForDashboardUseCase,
    this._getHomeDataForDashboardUseCase,
    this._getGrossSalaryAndCurrencyUseCase,
    this._saveBasicSalaryAmountUseCase,
    this._saveNumberOfDigitsUseCase,
    this._saveTotalAllowanceUseCase,
    this._saveCurrencyIdUseCase,
    this._saveCurrencyUseCase,
    this._saveGrossSalaryUseCase,
  ) : super(HomeInitialState()) {
    on<HomeGetNewsListEvent>(_onHomeGetNewsListEvent);
    on<HomeGetPoliciesEvent>(_onHomeGetPoliciesEvent);
    on<GetHomeDataEvent>(_onGetHomeDataEvent);
    on<HomeDialogPopEvent>(_onHomeDialogPopEvent);
    on<HomeInsertPunchEvent>(_onHomeInsertPunchEvent);
    on<HomeNavigateToNotificationScreenEvent>(
        _onHomeNavigateToNotificationScreenEvent);
    on<HomeNavigateToAttendanceHistoryScreenEvent>(
        _onHomeNavigateToAttendanceHistoryScreenEvent);
    on<HomeGetEssPermissionEvent>(_onHomeGetEssPermissionEvent);
    on<HomeGetLanguageEvent>(_onHomeGetLanguageEvent);
    on<HomeGetRequestsEvent>(_onHomeGetRequestsEvent);
    on<NavigateToQuickAccessRequestsDetailsScreen>(
        _onNavigateToRequestsDetailsScreen);
    on<GetLastRequestsForDashboardEvent>(_onGetLastRequestsForDashboardEvent);
    on<HomeNavigateToLastRequestDetailsEvent>(
        _onHomeNavigateToLastRequestDetailsEvent);
    on<GetGrossSalaryAndCurrencyEvent>(_onGetGrossSalaryAndCurrencyEvent);
  }

  bool _isPlusTime = false;
  List<Request> _requests = [
    Request(
        id: 4151,
        text: '',
        imagePath: ImagePaths.leave,
        imageColor: "#FF664DC9"),
    Request(
        id: 4152,
        text: '',
        imagePath: ImagePaths.shortLeave,
        imageColor: "#FF38CB89"),
    Request(
        id: 4153,
        text: '',
        imagePath: ImagePaths.leaveCncashment,
        imageColor: "#FFFFAB00"),
    Request(
        id: 4155,
        text: '',
        imagePath: ImagePaths.loan,
        imageColor: "#FF3E80EB"),
    Request(
        id: 4156,
        text: '',
        imagePath: ImagePaths.indemnityEncashment,
        imageColor: "#FFEF4B4B"),
    Request(
        id: 4157,
        text: '',
        imagePath: ImagePaths.airTicket,
        imageColor: "#FF06C0D9"),
    Request(
        id: 4159,
        text: 'Half Day Leave',
        imagePath: ImagePaths.halfDayLeave,
        imageColor: "#FF5238FF"),
    Request(
        id: 5158,
        text: '',
        imagePath: ImagePaths.resumeDuty,
        imageColor: "#FF1D996D"),
    Request(
        id: 5157,
        text: '',
        imagePath: ImagePaths.businessTrip,
        imageColor: "#FF00635B"),
    Request(
        id: 6168,
        text: '',
        imagePath: ImagePaths.otherRequest,
        imageColor: "#FFDC4405"),
  ];
  List<News> _news = [];
  Home home = Home();

  FutureOr<void> _onHomeGetNewsListEvent(
      HomeGetNewsListEvent event, Emitter<HomeState> emit) async {
    emit(HomeShowSkeletonState());
    DataState dataState = await _getNewsListUseCase();
    if (dataState is DataSuccess<List<News>>) {
      _news = dataState.data ?? [];
      home.news = _news;
      emit(HomeGetNewsListSuccessState(home: home));
      emit(HomeHideSkeletonState());
    } else {
      emit(HomeGetNewsListErrorState(
          errorMessage: dataState.error?.error.toString() ?? ""));
    }
  }

  FutureOr<void> _onHomeGetPoliciesEvent(
      HomeGetPoliciesEvent event, Emitter<HomeState> emit) async {
    final int employeeId = await _getEmployeeIdUseCase() ?? 0;
    DataState dataState = await _getPoliciesUseCase(employeeId: employeeId);
    if (dataState is DataSuccess<Policies>) {
      home.policies = dataState.data ?? const Policies();
      await _saveResetTimeUseCase(home.policies.resetTime ?? "");
      emit(HomeUpdateScreenState(home: home));
    }
  }

  FutureOr<void> _onGetHomeDataEvent(
      GetHomeDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeShowSkeletonState());
    DataState dataState = await _getHomeDataForDashboardUseCase();
    if (dataState is DataSuccess<HomeData>) {
      emit(HomeHideSkeletonState());
      String userName = await _getUserNameUseCase() ?? '';
      home.userName = userName;
      home.homeData = dataState.data!;
      home.homeData!.remainingTime = _subtractMinutesFromTime(
          home.homeData!.shiftTime, home.homeData!.remainingWorkHours);
      home.homeData!.remainingWorkHoursProgress =
          _calculatePercentageAfterSubtract(
              home.homeData!.shiftTime, home.homeData!.remainingWorkHours);
      home.homeData!.isPlusTime = _isPlusTime;
      emit(HomeUpdateScreenState(home: home));
    } else {
      emit(HomeShowMassageDialogResponseState(dataState.message.toString()));
    }
  }

  FutureOr<void> _onHomeInsertPunchEvent(
      HomeInsertPunchEvent event, Emitter<HomeState> emit) async {
    if (event.punchType == "in") {
      emit(HomeShowLoadingState());
      final String fingerPrintNumber =
          await _getFingerPrintNumberUseCase() ?? "";
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position == null) {
        emit(HomeFailedToGetCurrentLocationState());
      } else if (position != null) {
        DataState dataState = await _insertPunchFromDashBoardUseCase(
          punchTypeSystemCode: event.punchType,
          fingerPrint: fingerPrintNumber,
          longitude: position.longitude.toString(),
          latitude: position.latitude.toString(),
        );
        if (dataState is DataSuccess<Punch>) {
          home.homeData!.checkInTime = dataState.data!.punchTime;
          home.homeData!.remainingTime = dataState.data!.remainingTime;
          home.homeData!.remainingWorkHoursProgress =
              _calculatePercentageRemaining(
                  home.homeData!.shiftTime, dataState.data!.remainingTime);
          emit(HomeUpdateScreenState(home: home));
          emit(HomeHideLoadingState());
          emit(
              HomeShowMassageDialogResponseState(dataState.message.toString()));
        } else if (dataState is DataFailed) {
          emit(HomeUpdateScreenState(home: home));
          emit(HomeHideLoadingState());
          emit(
              HomeShowMassageDialogResponseState(dataState.message.toString()));
        }
      }
    } else {
      emit(HomeShowLoadingState());
      final String fingerPrintNumber =
          await _getFingerPrintNumberUseCase() ?? "";
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position == null) {
        emit(HomeFailedToGetCurrentLocationState());
      } else if (position != null) {
        DataState dataState = await _insertPunchFromDashBoardUseCase(
          punchTypeSystemCode: event.punchType,
          fingerPrint: fingerPrintNumber,
          longitude: position.longitude.toString(),
          latitude: position.latitude.toString(),
        );
        if (dataState is DataSuccess<Punch>) {
          home.homeData!.checkOutTime = dataState.data!.punchTime;
          home.homeData!.remainingTime = dataState.data!.remainingTime;
          home.homeData!.remainingWorkHoursProgress =
              _calculatePercentageRemaining(
                  home.homeData!.shiftTime, dataState.data!.remainingTime);
          emit(HomeUpdateScreenState(home: home));
          emit(HomeHideLoadingState());
          emit(
              HomeShowMassageDialogResponseState(dataState.message.toString()));
        } else if (dataState is DataFailed) {
          emit(HomeUpdateScreenState(home: home));
          emit(HomeHideLoadingState());
          emit(
              HomeShowMassageDialogResponseState(dataState.message.toString()));
        }
      }
    }
  }

  void _onHomeNavigateToNotificationScreenEvent(
      HomeNavigateToNotificationScreenEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToNotificationScreenState());
  }

  FutureOr<void> _onHomeDialogPopEvent(
      HomeDialogPopEvent event, Emitter<HomeState> emit) {
    emit(HomeDialogPopState());
  }

  FutureOr<void> _onHomeNavigateToAttendanceHistoryScreenEvent(
      HomeNavigateToAttendanceHistoryScreenEvent event,
      Emitter<HomeState> emit) {
    emit(HomeNavigateToAttendanceHistoryScreenState());
  }

  Future<void> _onHomeGetEssPermissionEvent(
      HomeGetEssPermissionEvent event, Emitter<HomeState> emit) async {
    emit(HomeHideSkeletonState());
    resetRequests();
    DataState state =
        await _getEssPermissionUseCase(userTypeId: await _getTypeIdUseCase());
    if (state is DataSuccess<List<Request>>) {
      EssPermissionSingleTon.setEssPermission(state.data ?? []);
      add(HomeGetRequestsEvent());
    }
  }

  FutureOr<void> _onHomeGetLanguageEvent(
      HomeGetLanguageEvent event, Emitter<HomeState> emit) async {
    String language = await _getLanguageUseCase() ?? '';
    emit(HomeGetLanguageState(isEnglish: language == "en" ? true : false));
  }

  FutureOr<void> _onHomeGetRequestsEvent(
      HomeGetRequestsEvent event, Emitter<HomeState> emit) {
    emit(GetRequestsSuccessState(
        requests: _getRequestsListUseCase(
            allRequests: EssPermissionSingleTon.getEssPermission,
            requests: _requests,
            id: 4150)));
  }

  FutureOr<void> _onNavigateToRequestsDetailsScreen(
      NavigateToQuickAccessRequestsDetailsScreen event,
      Emitter<HomeState> emit) {
    emit(_navigateToQuickAccessRequestsScreenUseCase(
      requestState: state,
      id: event.request.id,
    ));
  }

  FutureOr<void> _onGetLastRequestsForDashboardEvent(
      GetLastRequestsForDashboardEvent event, Emitter<HomeState> emit) async {
    emit(HomeShowSkeletonState());
    DataState dataState = await _getLastRequestsForDashboardUseCase();
    if (dataState is DataSuccess<LastUpdateRequests>) {
      emit(HomeHideSkeletonState());
      emit(GetLastRequestsForDashboardSuccessState(
          lastUpdateRequests: dataState.data!));
    } else {
      emit(HomeShowMassageDialogResponseState(dataState.message.toString()));
    }
  }

  String _subtractMinutesFromTime(String initialTime, int minutesToSubtract) {
    if (initialTime != '' && minutesToSubtract != 0) {
      List<String> timeParts = initialTime.split(':');
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      int totalMinutes = hours * 60 + minutes;
      totalMinutes -= minutesToSubtract;
      if (totalMinutes < 0) {
        totalMinutes = 0;
      }
      int newHours = totalMinutes ~/ 60;
      int newMinutes = totalMinutes % 60;
      String result =
          '${newHours.toString().padLeft(2, '0')}:${newMinutes.toString().padLeft(2, '0')}';
      return result;
    } else {
      return '';
    }
  }

  double _calculatePercentageAfterSubtract(
      String initialTime, int minutesToSubtract) {
    if (initialTime.isNotEmpty && minutesToSubtract != null) {
      List<String> timeParts = initialTime.split(':');
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      int totalMinutes = hours * 60 + minutes;

      if (minutesToSubtract > totalMinutes) {
        return 1.0;
      }
      totalMinutes -= minutesToSubtract;
      double remainingFraction = totalMinutes / (hours * 60.0);
      remainingFraction > 1.0 ? _isPlusTime = true : false;
      return remainingFraction > 1.0 ? 1.0 : remainingFraction;
    } else {
      return 0.0;
    }
  }

  double _calculatePercentageRemaining(
      String initialTime, String remainingTime) {
    List<String> initialTimeParts = initialTime.split(':');
    int initialHours = int.parse(initialTimeParts[0]);
    int initialMinutes = int.parse(initialTimeParts[1]);
    int initialTotalMinutes = initialHours * 60 + initialMinutes;
    List<String> remainingTimeParts = remainingTime.split(':');
    int remainingHours = int.parse(remainingTimeParts[0]);
    int remainingMinutes = int.parse(remainingTimeParts[1]);
    int remainingTotalMinutes = remainingHours * 60 + remainingMinutes;

    double remainingFraction =
        remainingTotalMinutes / (initialTotalMinutes * 1.0);
    return 1 - remainingFraction;
  }

  FutureOr<void> _onHomeNavigateToLastRequestDetailsEvent(
      HomeNavigateToLastRequestDetailsEvent event, Emitter<HomeState> emit) {
    if (event.lastRequests.referenceId == 1) {
      emit(HomeNavigateToLeaveDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 5) {
      emit(HomeNavigateToHalfDayLeaveDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 6) {
      emit(HomeNavigateToLoanDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 9) {
      emit(HomeNavigateToOtherRequestDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 12) {
      emit(HomeNavigateToLeaveEncashmentDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 19) {
      emit(HomeNavigateToResumeDutyDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 22) {
      emit(HomeNavigateToAirTicketDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 25) {
      emit(HomeNavigateToIndemnityEncashmentDetailsScreenState(
          lastRequests: event.lastRequests));
    } else if (event.lastRequests.referenceId == 3) {
      emit(HomeNavigateToShortLeaveDetailsScreenState(
          lastRequests: event.lastRequests));
    }
  }

  void resetRequests() {
    _requests = [
      Request(
          id: 4151,
          text: '',
          imagePath: ImagePaths.leave,
          imageColor: "#FF664DC9"),
      Request(
          id: 4152,
          text: '',
          imagePath: ImagePaths.shortLeave,
          imageColor: "#FF38CB89"),
      Request(
          id: 4153,
          text: '',
          imagePath: ImagePaths.leaveCncashment,
          imageColor: "#FFFFAB00"),
      Request(
          id: 4155,
          text: '',
          imagePath: ImagePaths.loan,
          imageColor: "#FF3E80EB"),
      Request(
          id: 4156,
          text: '',
          imagePath: ImagePaths.indemnityEncashment,
          imageColor: "#FFEF4B4B"),
      Request(
          id: 4157,
          text: '',
          imagePath: ImagePaths.airTicket,
          imageColor: "#FF06C0D9"),
      Request(
          id: 4159,
          text: 'Half Day Leave',
          imagePath: ImagePaths.halfDayLeave,
          imageColor: "#FF5238FF"),
      Request(
          id: 5158,
          text: '',
          imagePath: ImagePaths.resumeDuty,
          imageColor: "#FF1D996D"),
      Request(
          id: 5157,
          text: '',
          imagePath: ImagePaths.businessTrip,
          imageColor: "#FF00635B"),
      Request(
          id: 6168,
          text: '',
          imagePath: ImagePaths.otherRequest,
          imageColor: "#FFDC4405"),
    ];
  }

  FutureOr<void> _onGetGrossSalaryAndCurrencyEvent(
      GetGrossSalaryAndCurrencyEvent event, Emitter<HomeState> emit) async {
    emit(HomeShowSkeletonState());
    DataState dataState = await _getGrossSalaryAndCurrencyUseCase();
    if (dataState is DataSuccess<RemoteGetGrossSalaryAndCurrency>) {
      await _saveNumberOfDigitsUseCase(dataState.data?.noOfDigits ?? 0);
      await _saveBasicSalaryAmountUseCase(dataState.data?.basicSalary ?? 0);
      await _saveTotalAllowanceUseCase(dataState.data?.totalAllowances ?? 0);
      await _saveGrossSalaryUseCase(dataState.data?.grossSalary ?? 0);
      await _saveCurrencyUseCase(dataState.data?.currency ?? '');
      await _saveCurrencyIdUseCase(dataState.data?.currencyId ?? 0);
      emit(HomeHideSkeletonState());
    } else {
      emit(HomeShowMassageDialogResponseState(dataState.message.toString()));
    }
  }
}
