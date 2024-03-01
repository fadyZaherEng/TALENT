part of 'my_request_filter_bloc.dart';

@immutable
abstract class MyRequestFilterEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class OpenRequestScreenEvent extends MyRequestFilterEvent {
  final List<RequestType> requests;
  final String title ;

  OpenRequestScreenEvent({required this.requests,required this.title});
}

class ApplyFilterEvent extends MyRequestFilterEvent {
  final MyRequestFilter myRequestFilter;
  final String fromRequestDate;
  final String toRequestDate;

  final String fromCreateDate;

  final String toCreateDate;

  ApplyFilterEvent({
    required this.fromRequestDate,
    required this.toRequestDate,
    required this.fromCreateDate,
    required this.toCreateDate,
    required this.myRequestFilter,
  });
}

class ValidationMyRequestFilterFromRequestedDateEvent
    extends MyRequestFilterEvent {
  final String fromRequestDate;
  final String toRequestDate;

  ValidationMyRequestFilterFromRequestedDateEvent({
    required this.fromRequestDate,
    required this.toRequestDate,
  });
}

class ValidationMyRequestFilterFromCreatedDateEvent
    extends MyRequestFilterEvent {
  final String fromCreatedDate;
  final String toCreatedDate;

  ValidationMyRequestFilterFromCreatedDateEvent({
    required this.fromCreatedDate,
    required this.toCreatedDate,
  });
}

class ValidationMyRequestFilterToRequestedDateEvent
    extends MyRequestFilterEvent {
  final String toRequestDate;
  final String fromRequestDate;

  ValidationMyRequestFilterToRequestedDateEvent({
    required this.toRequestDate,
    required this.fromRequestDate,
  });
}

class ValidationMyRequestFilterToCreatedDateEvent extends MyRequestFilterEvent {
  final String toCreatedDate;

  final String fromCreatedDate;

  ValidationMyRequestFilterToCreatedDateEvent({
    required this.toCreatedDate,
    required this.fromCreatedDate,
  });
}

class SelectRequestFromSearchScreenEvent extends MyRequestFilterEvent {
  final List<SearchableItem> searchable;
  final MyRequestFilter myRequestFilter;

  SelectRequestFromSearchScreenEvent({
    required this.myRequestFilter,
    required this.searchable,
  });
}
class ResetMyRequestsFilterEvent extends MyRequestFilterEvent {
  final MyRequestFilter myRequestFilter;
  ResetMyRequestsFilterEvent({required this.myRequestFilter});
}
