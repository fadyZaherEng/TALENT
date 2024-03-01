part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class HomeGetNewsListEvent extends HomeEvent {}

class HomeGetCurrentLocationEvent extends HomeEvent {}

class HomeGetPoliciesEvent extends HomeEvent {}

class GetHomeDataEvent extends HomeEvent {}

class HomeInsertPunchEvent extends HomeEvent {
  final String punchType;
  final String punchTime;

  HomeInsertPunchEvent({
    required this.punchType,
    required this.punchTime,
  });
}

class HomeNavigateToNotificationScreenEvent extends HomeEvent {}


class HomeDialogPopEvent extends HomeEvent {}

class HomeNavigateToAttendanceHistoryScreenEvent extends HomeEvent {}

class HomeGetEssPermissionEvent extends HomeEvent {}

class HomeGetLanguageEvent extends HomeEvent {}

class HomeGetRequestsEvent extends HomeEvent {}

class NavigateToQuickAccessRequestsDetailsScreen extends HomeEvent {
  final Request request;

  NavigateToQuickAccessRequestsDetailsScreen({
    required this.request,
  });
}

class GetLastRequestsForDashboardEvent extends HomeEvent {}

class HomeNavigateToLastRequestDetailsEvent extends HomeEvent {
  final LastRequests lastRequests;

  HomeNavigateToLastRequestDetailsEvent({required this.lastRequests});
}
class GetGrossSalaryAndCurrencyEvent extends HomeEvent {}

