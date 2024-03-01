import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_team_requests_filter/my_team_requests_filter.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/presentation/blocs/my_team_requests_filter/my_team_requests_filter_bloc.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/filter/my_team_requests_filter_bottom_sheet_content_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/filter/utils/my_team_requests_filter_functions.dart';
import '../../../../domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';

class MyTeamRequestsFilterBottomSheetWidget extends StatefulWidget {
  final MyTeamRequestFilter myTeamRequestFilter;

  const MyTeamRequestsFilterBottomSheetWidget(
      {super.key, required this.myTeamRequestFilter});

  @override
  State<MyTeamRequestsFilterBottomSheetWidget> createState() =>
      _MyTeamRequestsFilterBottomSheetWidgetState();
}

class _MyTeamRequestsFilterBottomSheetWidgetState
    extends State<MyTeamRequestsFilterBottomSheetWidget> {
  MyTeamRequestsFilterBloc get _bloc =>
      BlocProvider.of<MyTeamRequestsFilterBloc>(context);
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _requestsController = TextEditingController();
  String _fromRequestDate = '';
  String _toRequestDate = '';
  String _fromCreateDate = '';
  String _toCreateDate = '';
  List<AllowedCompanies> _allowCompanies = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyTeamRequestsFilterBloc, MyTeamRequestsFilterState>(
        listener: (context, state) {
      if (state is NavigateToCompaniesScreenState) {
        _navigateToCompaniesScreen(state.searchableModel);
      } else if (state is NavigateToRequestsScreenState) {
        _navigateToRequestsScreen(state.searchableModel);
      } else if (state is NavigateToEmployeesScreenState) {
        _navigateToEmployeesScreen(state.searchableModel);
      } else if (state
          is ValidationMyTeamRequestFilterFromRequestedDateValidState) {
        widget.myTeamRequestFilter.fromRequestedDateErrorMessage = null;
      } else if (state
          is ValidationMyTeamRequestFilterFromRequestedDateNotValidState) {
        widget.myTeamRequestFilter.fromRequestedDateErrorMessage =
            state.validationMessage;
      } else if (state
          is ValidationMyTeamRequestFilterToRequestedDateValidState) {
        widget.myTeamRequestFilter.toRequestedDateErrorMessage = null;
      } else if (state
          is ValidationMyTeamRequestFilterToRequestedDateNotValidState) {
        widget.myTeamRequestFilter.toRequestedDateErrorMessage =
            state.validationMessage;
      } else if (state
          is ValidationMyTeamRequestFilterFromCreatedDateValidState) {
        widget.myTeamRequestFilter.fromCreatedDateErrorMessage = null;
      } else if (state
          is ValidationMyTeamRequestFilterFromCreatedDateNotValidState) {
        widget.myTeamRequestFilter.fromCreatedDateErrorMessage =
            state.validationMessage;
      } else if (state
          is ValidationMyTeamRequestFilterToCreatedDateValidState) {
        widget.myTeamRequestFilter.toCreatedDateErrorMessage = null;
      } else if (state
          is ValidationMyTeamRequestFilterToCreatedDateNotValidState) {
        widget.myTeamRequestFilter.toCreatedDateErrorMessage =
            state.validationMessage;
      } else if (state is ApplyFilterState) {
        Navigator.pop(context, state.myTeamRequestFilter);
      } else if (state is SelectCompanyFromSearchScreenState) {
        _companyController.text = state.companyController;
        _employeeController.text = state.employeeController;
        widget.myTeamRequestFilter.companies = state.companies;
        widget.myTeamRequestFilter.employees = state.employees;
      } else if (state is SelectEmployeeFromSearchScreenState) {
        widget.myTeamRequestFilter.employees = state.employees;
        _employeeController.text = state.employeeController;
      } else if (state is SelectRequestsFromSearchScreenState) {
        _requestsController.text = state.requestController;
        widget.myTeamRequestFilter.requests = state.requests;
      } else if (state is MyTeamRequestsFilterSelectCompanyState) {
        _allowCompanies = state.allowedCompanies;
        widget.myTeamRequestFilter.filterCompanyId = state.companyId;
      } else if (state is MyTeamRequestsFilterUnSelectCompanyState) {
        _allowCompanies = state.allowedCompanies;
        widget.myTeamRequestFilter.filterCompanyId = state.companyId;
        _resetEmployee();
      } else if (state is SaveEmployeesFilterState) {
        widget.myTeamRequestFilter.employees =
            state.myTeamRequestFilter.employees;
      } else if (state is ResetMyTeamRequestsFilterState) {
        _bloc.add(ApplyFilterEvent(
          myTeamRequestFilter: state.myTeamRequestFilter,
          fromRequestDate:  state.myTeamRequestFilter.fromRequestedDate.toString(),
          toRequestDate:  state.myTeamRequestFilter.toRequestedDate.toString(),
          fromCreateDate:  state.myTeamRequestFilter.fromCreatedDate.toString(),
          toCreateDate:  state.myTeamRequestFilter.toCreatedDate.toString(),
        ));
      }
    }, builder: (context, state) {
      return MyTeamRequestsFilterBottomSheetContentWidget(
        allowedCompanies: _allowCompanies,
        myTeamRequestFilter: widget.myTeamRequestFilter,
        companyController: _companyController,
        employeeController: _employeeController,
        requestsController: _requestsController,
        myTeamRequestsFilterFunctions: MyTeamRequestsFilterFunctions(
          onTapCompany: () {
            _bloc.add(NavigateToCompaniesScreenEvent(
              companies: widget.myTeamRequestFilter.companies!,
              title: S.of(context).company,
            ));
          },
          onTapRequest: () {
            _bloc.add(NavigateToRequestsScreenEvent(
              requests: widget.myTeamRequestFilter.requests!,
              title: S.of(context).request,
            ));
          },
          onTapEmployee: () {
            _bloc.add(NavigateToEmployeesScreenEvent(
              title: S.of(context).employee,
              myTeamRequestFilter: widget.myTeamRequestFilter,
            ));
          },
          onPickFromRequestedDate: (String date) {
            _fromRequestDate = date;
            _bloc.add(ValidationMyTeamRequestFilterFromRequestedDateEvent(
              fromRequestDate: date,
              toRequestDate: _toRequestDate,
            ));
          },
          onDeleteFromRequestedDate: () {
            _fromRequestDate = '';
            _bloc.add(ValidationMyTeamRequestFilterFromRequestedDateEvent(
              fromRequestDate: '',
              toRequestDate: _toRequestDate,
            ));
          },
          onPickToRequestedDate: (String date) {
            _toRequestDate = date;
            _bloc.add(ValidationMyTeamRequestFilterToRequestedDateEvent(
              fromRequestDate: _fromRequestDate,
              toRequestDate: date,
            ));
          },
          onDeleteToRequestedDate: () {
            _toRequestDate = '';
            _bloc.add(ValidationMyTeamRequestFilterToRequestedDateEvent(
              fromRequestDate: _fromRequestDate,
              toRequestDate: '',
            ));
          },
          onPickFromCreatedDate: (String date) {
            _fromCreateDate = date;
            _bloc.add(ValidationMyTeamRequestFilterFromCreatedDateEvent(
              fromCreatedDate: date,
              toCreatedDate: _toCreateDate,
            ));
          },
          onDeletedFromCreatedDate: () {
            _fromCreateDate = '';
            _bloc.add(ValidationMyTeamRequestFilterFromCreatedDateEvent(
              fromCreatedDate: '',
              toCreatedDate: _toCreateDate,
            ));
          },
          onPickToCreatedDate: (String date) {
            _toCreateDate = date;
            _bloc.add(ValidationMyTeamRequestFilterToCreatedDateEvent(
              fromCreatedDate: _fromCreateDate,
              toCreatedDate: date,
            ));
          },
          onDeletedToCreatedDate: () {
            _toCreateDate = '';
            _bloc.add(ValidationMyTeamRequestFilterToCreatedDateEvent(
              fromCreatedDate: _fromCreateDate,
              toCreatedDate: '',
            ));
          },
          onTapApply: () {
            _bloc.add(ApplyFilterEvent(
              myTeamRequestFilter: widget.myTeamRequestFilter,
              fromRequestDate: _fromRequestDate,
              toRequestDate: _toRequestDate,
              fromCreateDate: _fromCreateDate,
              toCreateDate: _toCreateDate,
            ));
          },
          onSelectCompany: (AllowedCompanies company) {
            !company.isSelected ? _resetEmployee() : null;
            _bloc.add(MyTeamRequestsFilterSelectCompanyEvent(
              company: company,
              companies: widget.myTeamRequestFilter.companies!,
            ));
          },
          onCloseCompany: (AllowedCompanies company) {
            _bloc.add(MyTeamRequestsFilterUnSelectCompanyEvent(
              company: company,
              companies: widget.myTeamRequestFilter.companies!,
            ));
          },
          onTapResetFilter: () {
            _bloc.add(ResetMyTeamRequestsFilterEvent(
                myTeamRequestFilter: widget.myTeamRequestFilter));
          },
        ),
      );
    });
  }

  void _navigateToCompaniesScreen(
    SearchableModel searchableModel,
  ) {
    Navigator.pushNamed(context, Routes.searchable, arguments: searchableModel)
        .then((value) {
      if (value != null) {
        _bloc.add(SelectCompanyFromSearchScreenEvent(
          searchable: value as List<SearchableItem>,
          myTeamRequestFilter: widget.myTeamRequestFilter,
        ));
      }
    });
  }

  void _navigateToRequestsScreen(
    SearchableModel searchableModel,
  ) {
    Navigator.pushNamed(context, Routes.searchable, arguments: searchableModel)
        .then((value) {
      if (value != null) {
        _bloc.add(SelectRequestFromSearchScreenEvent(
          searchable: value as List<SearchableItem>,
          myTeamRequestFilter: widget.myTeamRequestFilter,
        ));
      }
    });
  }

  void _navigateToEmployeesScreen(
    SearchableModel searchableModel,
  ) {
    if (widget.myTeamRequestFilter.companies!
        .any((element) => element.isSelected == true)) {
      Navigator.pushNamed(context, Routes.searchable,
              arguments: searchableModel)
          .then((value) {
        if (value != null) {
          _bloc.add(SelectEmployeeFromSearchScreenEvent(
            searchable: value as List<SearchableItem>,
            myTeamRequestFilter: widget.myTeamRequestFilter,
          ));
        }
      });
    } else {
      _massageDialog(S.of(context).pleaseSelectCompanyFirst, () {
        Navigator.pop(context);
      });
    }
  }

  void _init() {
    _selectCompany();
    _fromRequestDate =
        widget.myTeamRequestFilter.fromRequestedDate.toString().split(" ")[0];
    _toRequestDate =
        widget.myTeamRequestFilter.toRequestedDate.toString().split(" ")[0];
    _fromCreateDate =
        widget.myTeamRequestFilter.fromCreatedDate.toString().split(" ")[0];
    _toCreateDate =
        widget.myTeamRequestFilter.toCreatedDate.toString().split(" ")[0];
    _bloc.add(ValidationMyTeamRequestFilterFromRequestedDateEvent(
        fromRequestDate: _fromRequestDate, toRequestDate: _toRequestDate));
    _bloc.add(ValidationMyTeamRequestFilterToRequestedDateEvent(
        toRequestDate: _toRequestDate, fromRequestDate: _fromRequestDate));
    _bloc.add(ValidationMyTeamRequestFilterFromCreatedDateEvent(
        fromCreatedDate: _fromCreateDate, toCreatedDate: _toCreateDate));
    _bloc.add(ValidationMyTeamRequestFilterToCreatedDateEvent(
        toCreatedDate: _toCreateDate, fromCreatedDate: _fromCreateDate));
    widget.myTeamRequestFilter.companies?.forEach((element) {
      if (element.isSelected) {
        _companyController.text = element.companyName;
      }
    });
    widget.myTeamRequestFilter.employees?.forEach((element) {
      if (element.isSelected) {
        _employeeController.text = element.employeeName;
      }
    });
    widget.myTeamRequestFilter.requests?.forEach((element) {
      if (element.isSelected) {
        _requestsController.text = element.name;
      }
    });
    _bloc.add(SaveEmployeesFilterEvent(
        myTeamRequestFilter: widget.myTeamRequestFilter));
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
    _allowCompanies = widget.myTeamRequestFilter.companies!;
    for (var element in _allowCompanies) {
      if (element.isSelected && element.children!.isEmpty) {
        _bloc.add(MyTeamRequestsFilterSelectCompanyEvent(
            company: element, companies: _allowCompanies));
      } else if (element.isSelected && element.children!.isNotEmpty) {
        _bloc.add(MyTeamRequestsFilterSelectCompanyEvent(
            company: element, companies: _allowCompanies));
        element.children?.forEach((child) {
          if (child.isSelected == true) {
            _bloc.add(MyTeamRequestsFilterSelectCompanyEvent(
                company: child, companies: _allowCompanies));
          }
        });
      }
    }
  }

  void _resetEmployee() {
    _employeeController.clear();
    widget.myTeamRequestFilter.filterEmployeeId = 0;
    for (var element in widget.myTeamRequestFilter.employees!) {
      element.isSelected = false;
    }
  }

}
