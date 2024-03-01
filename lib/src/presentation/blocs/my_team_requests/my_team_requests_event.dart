part of 'my_team_requests_bloc.dart';

@immutable
abstract class MyTeamRequestsEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamRequestsBackEvent extends MyTeamRequestsEvent {}

class OpenMyTeamRequestFilterBottomSheetEvent extends MyTeamRequestsEvent {}

class GetMyTeamRequestsEvent extends MyTeamRequestsEvent {
  final String requestFromDate;
  final String requestToDate;
  final String createdDateAt;
  final String createdDateFrom;
  final int requestDataId;
  final int transactionStatusId;
  final MyTeamRequestFilter myTeamRequestFilter;

  GetMyTeamRequestsEvent({
    required this.transactionStatusId,
    required this.createdDateAt,
    required this.createdDateFrom,
    required this.requestDataId,
    required this.requestFromDate,
    required this.requestToDate,
    required this.myTeamRequestFilter,
  });
}

class ApplyFilterMyTeamRequestsEvent extends MyTeamRequestsEvent {
  final MyTeamRequestFilter myTeamRequestFilter;

  ApplyFilterMyTeamRequestsEvent({
    required this.myTeamRequestFilter,
  });
}

class GetMyTeamRequestsFilterEvent extends MyTeamRequestsEvent {}

class NavigateToTimeLineScreenEvent extends MyTeamRequestsEvent {
  final MyTeamRequest myTeamRequest;

  NavigateToTimeLineScreenEvent({
    required this.myTeamRequest,
  });
}

class GetCompaniesAndEmployeesEvent extends MyTeamRequestsEvent {}

class GetAllRequestsEvent extends MyTeamRequestsEvent {}

