import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';

class MyTeamRequestsFilterFunctions {
  final Function() onTapCompany;
  final Function() onTapRequest;
  final Function() onTapEmployee;
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
  final void Function(AllowedCompanies company) onSelectCompany;
  final void Function(AllowedCompanies company) onCloseCompany;

  MyTeamRequestsFilterFunctions({
    required this.onPickFromCreatedDate,
    required this.onTapApply,
    required this.onTapCompany,
    required this.onTapRequest,
    required this.onTapEmployee,
    required this.onDeletedFromCreatedDate,
    required this.onDeletedToCreatedDate,
    required this.onDeleteFromRequestedDate,
    required this.onDeleteToRequestedDate,
    required this.onPickFromRequestedDate,
    required this.onPickToCreatedDate,
    required this.onPickToRequestedDate,
    required this.onSelectCompany,
    required this.onCloseCompany,
    required this.onTapResetFilter,
  });
}
