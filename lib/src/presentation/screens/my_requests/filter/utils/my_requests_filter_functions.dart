import 'package:talent_link/src/domain/entities/my_requests/my_request_filter.dart';

class MyRequestsFilterFunctions {
  final Function() onTapRequests;
  final Function() onDeleteFromRequestedDate;
  final Function() onDeleteToRequestedDate;
  final Function() onDeletedFromCreatedDate;
  final Function() onDeletedToCreatedDate;
  final Function() onTapApply;
  final Function() onTapResetFilter;
  final void Function(String dateTime) onPickFromRequestedDate;
  final void Function(String dateTime) onPickToRequestedDate;
  final void Function(String dateTime) onPickFromCreatedDate;
  final void Function(String dateTime) onPickToCreatedDate;

  MyRequestsFilterFunctions({
    required this.onPickFromCreatedDate,
    required this.onTapApply,
    required this.onTapRequests,
    required this.onDeletedFromCreatedDate,
    required this.onDeletedToCreatedDate,
    required this.onDeleteFromRequestedDate,
    required this.onDeleteToRequestedDate,
    required this.onPickFromRequestedDate,
    required this.onPickToCreatedDate,
    required this.onPickToRequestedDate,
    required this.onTapResetFilter,
  });
}
