// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class HomeInitialState extends HomeState {}

class HomeShowSkeletonState extends HomeState {}

class HomeShowLoadingState extends HomeState {}

class HomeHideLoadingState extends HomeState {}

class HomeShowDialogCheckInState extends HomeState {}

class HomeShowMassageDialogResponseState extends HomeState {
  String massage;

  HomeShowMassageDialogResponseState(this.massage);
}

class HomeShowDialogCheckOutState extends HomeState {}

class HomeHideSkeletonState extends HomeState {}

class HomeGetNewsListErrorState extends HomeState {
  final String errorMessage;

  HomeGetNewsListErrorState({
    required this.errorMessage,
  });
}

class HomeGetNewsListSuccessState extends HomeState {
  final Home home;

  HomeGetNewsListSuccessState({
    required this.home,
  });
}

class HomeUpdateScreenState extends HomeState {
  final Home home;

  HomeUpdateScreenState({required this.home});
}

class HomeEmployeeAlreadyCheckedIn extends HomeState {
  final String message;

  HomeEmployeeAlreadyCheckedIn({required this.message});
}

class HomeEmployeeAlreadyCheckedOut extends HomeState {
  final String message;

  HomeEmployeeAlreadyCheckedOut({required this.message});
}

class HomeEmployeeNotCheckedInState extends HomeState {
  final String message;

  HomeEmployeeNotCheckedInState({required this.message});
}

class HomeNavigateToNotificationScreenState extends HomeState {}

class HomeFailedToGetCurrentLocationState extends HomeState {}

class HomeDialogPopState extends HomeState {}

class HomeNavigateToAttendanceHistoryScreenState extends HomeState {}

class HomeGetLanguageState extends HomeState {
  final bool isEnglish;

  HomeGetLanguageState({required this.isEnglish});
}

class GetRequestsSuccessState extends HomeState {
  final List<Request> requests;

  GetRequestsSuccessState({required this.requests});
}

class NavigateToLeaveScreenState extends HomeState {}

class NavigateToShortLeaveScreenState extends HomeState {}

class NavigateToLeaveEncashmentScreenState extends HomeState {}

class NavigateToLoanScreenState extends HomeState {}

class NavigateToIndemnityScreenState extends HomeState {}

class NavigateToAirTicketScreenState extends HomeState {}

class NavigateToHalfDayLeaveScreenState extends HomeState {}

class NavigateToResumeDutyScreenState extends HomeState {}

class NavigateToBusinessTripScreenState extends HomeState {}

class NavigateToOtherRequestScreenState extends HomeState {}

class GetLastRequestsForDashboardSuccessState extends HomeState {
  final LastUpdateRequests lastUpdateRequests;

  GetLastRequestsForDashboardSuccessState({required this.lastUpdateRequests});
}

class HomeNavigateToLeaveDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToLeaveDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToHalfDayLeaveDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToHalfDayLeaveDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToLoanDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToLoanDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToOtherRequestDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToOtherRequestDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToLeaveEncashmentDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToLeaveEncashmentDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToResumeDutyDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToResumeDutyDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToAirTicketDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToAirTicketDetailsScreenState({required this.lastRequests});
}

class HomeNavigateToIndemnityEncashmentDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToIndemnityEncashmentDetailsScreenState(
      {required this.lastRequests});
}

class HomeNavigateToShortLeaveDetailsScreenState extends HomeState {
  final LastRequests lastRequests;

  HomeNavigateToShortLeaveDetailsScreenState({required this.lastRequests});
}
