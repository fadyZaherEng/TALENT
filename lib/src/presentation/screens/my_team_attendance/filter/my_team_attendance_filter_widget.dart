import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance_filter/my_team_attendance_filter.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/presentation/blocs/my_team_attendance_filter/my_team_attendance_filter_bloc.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/filter/my_team_attendance_filter_content_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/filter/utils/my_team_attendance_filter_functions.dart';

class MyTeamAttendanceFilterWidget extends StatefulWidget {
  final MyTeamAttendanceFilter myTeamAttendanceFilter;

  const MyTeamAttendanceFilterWidget({
    super.key,
    required this.myTeamAttendanceFilter,
  });

  @override
  State<MyTeamAttendanceFilterWidget> createState() =>
      _MyTeamAttendanceFilterWidgetState();
}

class _MyTeamAttendanceFilterWidgetState
    extends State<MyTeamAttendanceFilterWidget> {
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  String _fromDate = '';
  String _toDate = '';

  MyTeamAttendanceFilterBloc get _bloc =>
      BlocProvider.of<MyTeamAttendanceFilterBloc>(context);
  List<AllowedCompanies> _allowCompanies = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyTeamAttendanceFilterBloc,
        MyTeamAttendanceFilterState>(
      listener: (context, state) {
        if (state is ApplyFilterState) {
          Navigator.pop(context, state.myTeamAttendanceFilter);
        } else if (state is OpenEmployeesScreenState) {
          _openEmployeesScreen(state.searchableModel);
        } else if (state is OpenCompaniesScreenState) {
          _openCompaniesScreen(state.searchableModel);
        } else if (state
            is ValidationMyTeamAttendanceFilterFromDateNotValidState) {
          widget.myTeamAttendanceFilter.fromDateErrorMessage =
              state.validationMessage;
          _fromDate = '';
        } else if (state
            is ValidationMyTeamAttendanceFilterToDateNotValidState) {
          widget.myTeamAttendanceFilter.toDateErrorMessage =
              state.validationMessage;
          _toDate = '';
        } else if (state
            is ValidationMyTeamAttendanceFilterFromDateValidState) {
          widget.myTeamAttendanceFilter.fromDateErrorMessage = null;
        } else if (state is ValidationMyTeamAttendanceFilterToDateValidState) {
          widget.myTeamAttendanceFilter.toDateErrorMessage = null;
        } else if (state is SelectCompanyFromSearchScreenState) {
          _employeeController.text = state.employeeController;
          _companyController.text = state.companyController;
          widget.myTeamAttendanceFilter.companies = state.companies;
          widget.myTeamAttendanceFilter.employees = state.employees;
        } else if (state is SelectEmployeeFromSearchScreenState) {
          _employeeController.text = state.employeeController;
          widget.myTeamAttendanceFilter.employees = state.employees;
        } else if (state is MyTeamAttendanceFilterSelectCompanyState) {
          _allowCompanies = state.allowedCompanies;
          widget.myTeamAttendanceFilter.companyId = state.companyId;
        } else if (state is MyTeamAttendanceFilterUnSelectCompanyState) {
          _resetEmployee();
          _allowCompanies = state.allowedCompanies;
          widget.myTeamAttendanceFilter.companyId = state.companyId;
        } else if (state is SaveEmployeesFilterState) {
          widget.myTeamAttendanceFilter.employees =
              state.myTeamAttendanceFilter.employees;
        } else if (state is ResetMyTeamAttendanceFilterState) {
          _bloc.add(MyTeamAttendanceApplyFilterEvent(
            myTeamAttendanceFilter: state.myTeamAttendanceFilter,
            toDate: state.myTeamAttendanceFilter.toDate.toString(),
            fromDate: state.myTeamAttendanceFilter.fromDate.toString(),
          ));
        }
      },
      builder: (context, state) {
        return MyTeamAttendanceFilterContentWidget(
          myTeamAttendanceFilter: widget.myTeamAttendanceFilter,
          employeeController: _employeeController,
          companyController: _companyController,
          allowedCompanies: _allowCompanies,
          myTeamAttendanceFilterFunctions: MyTeamAttendanceFilterFunctions(
            onTapEmployee: () {
              _bloc.add(OpenEmployeesScreenEvent(
                  myTeamAttendanceFilter: widget.myTeamAttendanceFilter,
                  title: S.of(context).employee));
            },
            onTapCompany: () {
              _bloc.add(OpenCompaniesScreenEvent(
                  companies: widget.myTeamAttendanceFilter.companies!,
                  title: S.of(context).company));
            },
            onPickFromDate: (String date) {
              _fromDate = date;
              _bloc.add(MyTeamAttendanceValidationFromDateEvent(
                  fromDate: date, toDate: _toDate));
            },
            onPickToDate: (String date) {
              _toDate = date;
              _bloc.add(MyTeamAttendanceValidationToDateEvent(
                  toDate: date, fromDate: _fromDate));
            },
            onDeleteFromDate: () {
              _bloc.add(MyTeamAttendanceValidationFromDateEvent(
                  toDate: _toDate, fromDate: ''));
            },
            onDeleteToDate: () {
              _toDate = '';
              _bloc.add(MyTeamAttendanceValidationToDateEvent(
                  toDate: '', fromDate: _fromDate));
            },
            onTapApply: () {
              _bloc.add(MyTeamAttendanceApplyFilterEvent(
                myTeamAttendanceFilter: widget.myTeamAttendanceFilter,
                toDate: _toDate,
                fromDate: _fromDate,
              ));
            },
            onSelectCompany: (AllowedCompanies company) {
              !company.isSelected ? _resetEmployee() : null;
              _bloc.add(MyTeamAttendanceFilterSelectCompanyEvent(
                company: company,
                companies: widget.myTeamAttendanceFilter.companies!,
              ));
            },
            onCloseCompany: (AllowedCompanies company) {
              _bloc.add(MyTeamAttendanceFilterUnSelectCompanyEvent(
                company: company,
                companies: widget.myTeamAttendanceFilter.companies!,
              ));
            },
            onTapResetFilter: () {
              _bloc.add(ResetMyTeamAttendanceFilterEvent(
                  myTeamAttendanceFilter: widget.myTeamAttendanceFilter));
            },
          ),
        );
      },
    );
  }

  void _openEmployeesScreen(SearchableModel searchableModel) {
    if (widget.myTeamAttendanceFilter.companies!
        .any((element) => element.isSelected == true)) {
      Navigator.pushNamed(context, Routes.searchable,
              arguments: searchableModel)
          .then((value) {
        if (value != null) {
          _bloc.add(SelectEmployeeFromSearchScreenEvent(
              searchable: value as List<SearchableItem>,
              myTeamAttendanceFilter: widget.myTeamAttendanceFilter));
        }
      });
    } else {
      _massageDialog(S.of(context).pleaseSelectCompanyFirst, () {
        Navigator.pop(context);
      });
    }
  }

  void _openCompaniesScreen(SearchableModel searchableModel) {
    Navigator.pushNamed(context, Routes.searchable, arguments: searchableModel)
        .then((value) {
      if (value != null) {
        _bloc.add(SelectCompanyFromSearchScreenEvent(
            searchable: value as List<SearchableItem>,
            myTeamAttendanceFilter: widget.myTeamAttendanceFilter));
      }
    });
  }

  void _init() {
    _selectCompany();
    _toDate = widget.myTeamAttendanceFilter.toDate.toString().split(" ")[0];
    _fromDate = widget.myTeamAttendanceFilter.fromDate.toString().split(" ")[0];
    widget.myTeamAttendanceFilter.companies?.forEach((element) {
      if (element.isSelected) {
        _companyController.text = element.companyName;
      }
    });
    widget.myTeamAttendanceFilter.employees?.forEach((element) {
      if (element.isSelected) {
        _employeeController.text = element.employeeName;
      }
    });
    _bloc.add(SaveEmployeesFilterEvent(
        myTeamAttendanceFilter: widget.myTeamAttendanceFilter));
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }

  void _selectCompany() {
    _allowCompanies = widget.myTeamAttendanceFilter.companies!;
    for (var element in _allowCompanies) {
      if (element.isSelected && element.children!.isEmpty) {
        _bloc.add(MyTeamAttendanceFilterSelectCompanyEvent(
            company: element, companies: _allowCompanies));
      } else if (element.isSelected && element.children!.isNotEmpty) {
        _bloc.add(MyTeamAttendanceFilterSelectCompanyEvent(
            company: element, companies: _allowCompanies));
        element.children?.forEach((child) {
          if (child.isSelected == true) {
            _bloc.add(MyTeamAttendanceFilterSelectCompanyEvent(
                company: child, companies: _allowCompanies));
          }
        });
      }
    }
  }

  void _resetEmployee() {
    _employeeController.clear();
    widget.myTeamAttendanceFilter.companyId = 0;
    for (var element in widget.myTeamAttendanceFilter.employees!) {
      element.isSelected = false;
    }
  }
}
