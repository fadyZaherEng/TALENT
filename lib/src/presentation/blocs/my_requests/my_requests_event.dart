part of 'my_requests_bloc.dart';

@immutable
abstract class MyRequestsEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetMyRequestsEvent extends MyRequestsEvent {
  final MyRequestFilter myRequestFilter;

  GetMyRequestsEvent({required this.myRequestFilter});
}

class MyRequestsBackEvent extends MyRequestsEvent {}

class OpenMyRequestFilterBottomSheetEvent extends MyRequestsEvent {}

class ApplyFilterMyRequestsEvent extends MyRequestsEvent {
  final MyRequestFilter myRequestFilter;

  ApplyFilterMyRequestsEvent({
    required this.myRequestFilter,
  });
}

class GetMyRequestsFilterEvent extends MyRequestsEvent {}

class CancelRequestEvent extends MyRequestsEvent {
  final MyRequest myRequest;

  CancelRequestEvent({
    required this.myRequest,
  });
}

class GetAllRequestsListEvent extends MyRequestsEvent {}

class GetTransactionStatusEvent extends MyRequestsEvent {}
class MyRequestsNavigationToTimelineScreenEvent extends MyRequestsEvent {
  final Timeline timeline;
  MyRequestsNavigationToTimelineScreenEvent({required this.timeline});
}

