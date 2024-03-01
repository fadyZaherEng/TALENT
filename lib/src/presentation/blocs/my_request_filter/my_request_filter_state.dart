part of 'my_request_filter_bloc.dart';

@immutable
abstract class MyRequestFilterState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MyRequestFilterInitial extends MyRequestFilterState {}

class OpenRequestScreenState extends MyRequestFilterState {
  final SearchableModel searchableModel;

  OpenRequestScreenState({required this.searchableModel});
}

class ApplyFilterState extends MyRequestFilterState {
  final MyRequestFilter myRequestFilter;

  ApplyFilterState({
    required this.myRequestFilter,
  });
}

class ValidationMyRequestFilterFromRequestedDateValidState
    extends MyRequestFilterState {}

class ValidationMyRequestFilterFromRequestedDateNotValidState
    extends MyRequestFilterState {
  final String validationMessage;

  ValidationMyRequestFilterFromRequestedDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyRequestFilterFromCreatedDateValidState
    extends MyRequestFilterState {}

class ValidationMyRequestFilterFromCreatedDateNotValidState
    extends MyRequestFilterState {
  final String validationMessage;

  ValidationMyRequestFilterFromCreatedDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyRequestFilterToRequestedDateValidState
    extends MyRequestFilterState {}

class ValidationMyRequestFilterToRequestedDateNotValidState
    extends MyRequestFilterState {
  final String validationMessage;

  ValidationMyRequestFilterToRequestedDateNotValidState({
    required this.validationMessage,
  });
}

class ValidationMyRequestFilterToCreatedDateValidState
    extends MyRequestFilterState {}

class ValidationMyRequestFilterToCreatedDateNotValidState
    extends MyRequestFilterState {
  final String validationMessage;

  ValidationMyRequestFilterToCreatedDateNotValidState({
    required this.validationMessage,
  });
}

class SelectRequestFromSearchScreenState extends MyRequestFilterState {
  final List<RequestType> requests;
  final String requestController;

  SelectRequestFromSearchScreenState({
    required this.requests,
    required this.requestController,
  });
}
class ResetMyRequestsFilterState extends MyRequestFilterState {
  final MyRequestFilter myRequestFilter;

  ResetMyRequestsFilterState({required this.myRequestFilter});
}
