import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';

class MyTeamAttendanceFilterFunctions {
  final Function() onTapCompany;
  final Function() onTapEmployee;
  final Function() onDeleteFromDate;
  final Function() onDeleteToDate;
  final Function() onTapApply;
  final Function() onTapResetFilter;
  final void Function(String date) onPickFromDate;
  final void Function(String date) onPickToDate;
  final void Function(AllowedCompanies company) onSelectCompany;
  final void Function(AllowedCompanies company) onCloseCompany;

  MyTeamAttendanceFilterFunctions({
    required this.onTapEmployee,
    required this.onTapCompany,
    required this.onPickFromDate,
    required this.onPickToDate,
    required this.onDeleteFromDate,
    required this.onDeleteToDate,
    required this.onTapApply,
    required this.onSelectCompany,
    required this.onCloseCompany,
    required this.onTapResetFilter,
  });
}
