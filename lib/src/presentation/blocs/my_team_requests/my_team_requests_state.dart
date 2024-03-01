part of 'my_team_requests_bloc.dart';

@immutable
abstract class MyTeamRequestsState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyTeamRequestsInitialState extends MyTeamRequestsState {}

class GetMyTeamRequestSkeletonState extends MyTeamRequestsState {}

class MyTeamRequestsBackState extends MyTeamRequestsState {}

class OpenMyTeamRequestFilterBottomSheetState extends MyTeamRequestsState {}

class GetMyTeamRequestSuccessState extends MyTeamRequestsState {
  final List<MyTeamRequest> myTeamRequests;

  GetMyTeamRequestSuccessState({
    required this.myTeamRequests,
  });
}

class GetMyTeamRequestErrorState extends MyTeamRequestsState {
  final String errorMessage;

  GetMyTeamRequestErrorState({
    required this.errorMessage,
  });
}

class GetMyTeamRequestsFilterSuccessState extends MyTeamRequestsState {
  final MyTeamRequestFilter myTeamRequestFilter;
  final int filterEmployeeId;
  final int filterCompanyId;
  final int filterRequestId;

  GetMyTeamRequestsFilterSuccessState({
    required this.myTeamRequestFilter,
    required this.filterEmployeeId,
    required this.filterCompanyId,
    required this.filterRequestId,
  });
}

class ApplyFilterMyTeamRequestsState extends MyTeamRequestsState {
  final MyTeamRequestFilter myTeamRequestFilter;

  ApplyFilterMyTeamRequestsState({
    required this.myTeamRequestFilter,
  });
}

class NavigateToTimeLineScreenState extends MyTeamRequestsState {
  final MyTeamRequest myTeamRequest;

  NavigateToTimeLineScreenState({
    required this.myTeamRequest,
  });
}

class GetMyTeamRequestsFilterErrorState extends MyTeamRequestsState {
  final String errorMessage;

  GetMyTeamRequestsFilterErrorState({required this.errorMessage});
}

class GetAllRequestsErrorState extends MyTeamRequestsState {
  final String errorMessage;

  GetAllRequestsErrorState({required this.errorMessage});
}

class GetCompaniesAndEmployeesSuccessState extends MyTeamRequestsState {
  final MyTeamRequestFilter myTeamRequestFilter;

  GetCompaniesAndEmployeesSuccessState({required this.myTeamRequestFilter});
}


