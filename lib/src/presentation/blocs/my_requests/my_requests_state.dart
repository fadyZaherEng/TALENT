part of 'my_requests_bloc.dart';

@immutable
abstract class MyRequestsState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyRequestsInitialState extends MyRequestsState {}

class GetMyRequestsSuccessState extends MyRequestsState {
  final List<MyRequest> myRequests;

  GetMyRequestsSuccessState({required this.myRequests});
}

class GetMyRequestsErrorState extends MyRequestsState {
  final String errorMessage;

  GetMyRequestsErrorState({
    required this.errorMessage,
  });
}

class GetMyRequestsSkeletonState extends MyRequestsState {}

class CancelRequestLoadingState extends MyRequestsState {}

class MyRequestsBackState extends MyRequestsState {}

class OpenMyRequestFilterBottomSheetState extends MyRequestsState {}

class ApplyFilterMyRequestsState extends MyRequestsState {
  final MyRequestFilter myRequestFilter;

  ApplyFilterMyRequestsState({
    required this.myRequestFilter,
  });
}

class GetMyRequestsFilterSuccessState extends MyRequestsState {
  final MyRequestFilter myRequestFilter;

  GetMyRequestsFilterSuccessState({
    required this.myRequestFilter,
  });
}

class GetMyRequestsFilterErrorStateState extends MyRequestsState {
  final MyRequestFilter myRequestFilter;

  GetMyRequestsFilterErrorStateState({
    required this.myRequestFilter,
  });
}

class CancelRequestSuccessState extends MyRequestsState {
  final String successMessage;

  CancelRequestSuccessState({
    required this.successMessage,
  });
}

class CancelRequestErrorState extends MyRequestsState {
  final String errorMessage;

  CancelRequestErrorState({
    required this.errorMessage,
  });
}

class GetAllRequestsListErrorState extends MyRequestsState {
  final String errorMessage;

  GetAllRequestsListErrorState({required this.errorMessage});
}

class GetTransactionStatueErrorState extends MyRequestsState {
  final String errorMessage;

  GetTransactionStatueErrorState({required this.errorMessage});
}

class MyRequestsNavigationToTimelineScreenState extends MyRequestsState {
  final Timeline timeline;

  MyRequestsNavigationToTimelineScreenState({
    required this.timeline,
  });
}


