import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request_filter.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';
import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/presentation/blocs/my_request_filter/my_request_filter_bloc.dart';
import 'package:talent_link/src/presentation/screens/my_requests/filter/my_requests_filter_bottom_sheet_content_widget.dart';
import 'package:talent_link/src/presentation/screens/my_requests/filter/utils/my_requests_filter_functions.dart';

class MyRequestsFilterBottomSheetWidget extends StatefulWidget {
  final MyRequestFilter myRequestFilter;

  const MyRequestsFilterBottomSheetWidget({
    required this.myRequestFilter,
    super.key,
  });

  @override
  State<MyRequestsFilterBottomSheetWidget> createState() =>
      _MyRequestsFilterBottomSheetWidgetState();
}

class _MyRequestsFilterBottomSheetWidgetState
    extends State<MyRequestsFilterBottomSheetWidget> {
  final TextEditingController _requestsController = TextEditingController();
  final TextEditingController fromRequestedDateController =
      TextEditingController();
  String _fromRequestDate = '';
  String _toRequestDate = '';
  String _fromCreateDate = '';
  String _toCreateDate = '';

  MyRequestFilterBloc get _bloc =>
      BlocProvider.of<MyRequestFilterBloc>(context);

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRequestFilterBloc, MyRequestFilterState>(
        listener: (context, state) {
      if (state is OpenRequestScreenState) {
        _openRequestsSearchScreen(state.searchableModel);
      } else if (state is ApplyFilterState) {
        Navigator.pop(context, state.myRequestFilter);
      } else if (state
          is ValidationMyRequestFilterFromRequestedDateValidState) {
        widget.myRequestFilter.fromRequestedDateErrorMessage = null;
      } else if (state
          is ValidationMyRequestFilterFromRequestedDateNotValidState) {
        widget.myRequestFilter.fromRequestedDateErrorMessage =
            state.validationMessage;
      } else if (state is ValidationMyRequestFilterFromCreatedDateValidState) {
        widget.myRequestFilter.fromCreatedDateErrorMessage = null;
      } else if (state
          is ValidationMyRequestFilterFromCreatedDateNotValidState) {
        widget.myRequestFilter.fromCreatedDateErrorMessage =
            state.validationMessage;
      } else if (state is ValidationMyRequestFilterToRequestedDateValidState) {
        widget.myRequestFilter.toRequestedDateErrorMessage = null;
      } else if (state
          is ValidationMyRequestFilterToRequestedDateNotValidState) {
        widget.myRequestFilter.toRequestedDateErrorMessage =
            state.validationMessage;
      } else if (state is ValidationMyRequestFilterToCreatedDateValidState) {
        widget.myRequestFilter.toCreatedDateErrorMessage = null;
      } else if (state is ValidationMyRequestFilterToCreatedDateNotValidState) {
        widget.myRequestFilter.toCreatedDateErrorMessage =
            state.validationMessage;
      } else if (state is SelectRequestFromSearchScreenState) {
        widget.myRequestFilter.requests = state.requests;
        _requestsController.text = state.requestController;
      } else if (state is ResetMyRequestsFilterState) {
        _bloc.add(ApplyFilterEvent(
          myRequestFilter: widget.myRequestFilter,
          fromRequestDate: widget.myRequestFilter.fromRequestedDate.toString(),
          toRequestDate: widget.myRequestFilter.toRequestedDate.toString(),
          fromCreateDate: widget.myRequestFilter.fromCreatedDate.toString(),
          toCreateDate: widget.myRequestFilter.toCreatedDate.toString(),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: MyRequestsFilterBottomSheetContentWidget(
          myRequestFilter: widget.myRequestFilter,
          requestsController: _requestsController,
          myRequestsFilterFunctions: MyRequestsFilterFunctions(
            onTapRequests: () {
              _bloc.add(OpenRequestScreenEvent(
                  requests: widget.myRequestFilter.requests!,
                  title: S.of(context).requests));
            },
            onTapApply: () {
              _bloc.add(ApplyFilterEvent(
                myRequestFilter: widget.myRequestFilter,
                fromRequestDate: _fromRequestDate,
                toRequestDate: _toRequestDate,
                fromCreateDate: _fromCreateDate,
                toCreateDate: _toCreateDate,
              ));
            },
            onPickFromRequestedDate: (String dateTime) {
              _fromRequestDate = dateTime;
              _bloc.add(ValidationMyRequestFilterFromRequestedDateEvent(
                  fromRequestDate: dateTime, toRequestDate: _toRequestDate));
            },
            onDeleteFromRequestedDate: () {
              _fromRequestDate = '';
              _bloc.add(ValidationMyRequestFilterFromRequestedDateEvent(
                  fromRequestDate: '', toRequestDate: _toRequestDate));
            },
            onPickToRequestedDate: (String dateTime) {
              _toRequestDate = dateTime;
              _bloc.add(ValidationMyRequestFilterToRequestedDateEvent(
                  toRequestDate: dateTime, fromRequestDate: _fromRequestDate));
            },
            onDeleteToRequestedDate: () {
              _toRequestDate = '';
              _bloc.add(ValidationMyRequestFilterToRequestedDateEvent(
                  toRequestDate: '', fromRequestDate: _fromRequestDate));
            },
            onPickFromCreatedDate: (String dateTime) {
              _fromCreateDate = dateTime;
              _bloc.add(ValidationMyRequestFilterFromCreatedDateEvent(
                  fromCreatedDate: dateTime, toCreatedDate: _toCreateDate));
            },
            onDeletedFromCreatedDate: () {
              _fromCreateDate = '';
              _bloc.add(ValidationMyRequestFilterFromCreatedDateEvent(
                  fromCreatedDate: '', toCreatedDate: _toCreateDate));
            },
            onPickToCreatedDate: (String dateTime) {
              _toCreateDate = dateTime;
              _bloc.add(ValidationMyRequestFilterToCreatedDateEvent(
                  toCreatedDate: dateTime, fromCreatedDate: _fromCreateDate));
            },
            onDeletedToCreatedDate: () {
              _toCreateDate = '';
              _bloc.add(ValidationMyRequestFilterToCreatedDateEvent(
                  toCreatedDate: '', fromCreatedDate: _fromCreateDate));
            },
            onTapResetFilter: () => _bloc.add(ResetMyRequestsFilterEvent(
                myRequestFilter: widget.myRequestFilter)),
          ),
        ),
      );
    });
  }

  void _openRequestsSearchScreen(SearchableModel searchableModel) {
    Navigator.pushNamed(context, Routes.searchable, arguments: searchableModel)
        .then((value) {
      if (value != null) {
        _bloc.add(SelectRequestFromSearchScreenEvent(
            searchable: value as List<SearchableItem>,
            myRequestFilter: widget.myRequestFilter));
      }
    });
  }

  void _init() {
    _fromRequestDate =
        widget.myRequestFilter.fromRequestedDate.toString().split(" ")[0];
    _toRequestDate =
        widget.myRequestFilter.toRequestedDate.toString().split(" ")[0];
    _fromCreateDate =
        widget.myRequestFilter.fromCreatedDate.toString().split(" ")[0];
    _toCreateDate =
        widget.myRequestFilter.toCreatedDate.toString().split(" ")[0];
    _bloc.add(ValidationMyRequestFilterFromRequestedDateEvent(
        fromRequestDate: _fromRequestDate, toRequestDate: _toRequestDate));
    _bloc.add(ValidationMyRequestFilterToRequestedDateEvent(
        toRequestDate: _toRequestDate, fromRequestDate: _fromRequestDate));
    _bloc.add(ValidationMyRequestFilterFromCreatedDateEvent(
        fromCreatedDate: _fromCreateDate, toCreatedDate: _toCreateDate));
    _bloc.add(ValidationMyRequestFilterToCreatedDateEvent(
        toCreatedDate: _toCreateDate, fromCreatedDate: _fromCreateDate));
    widget.myRequestFilter.requests?.forEach((element) {
      if (element.isSelected) {
        _requestsController.text = element.name;
      }
    });
  }
}
