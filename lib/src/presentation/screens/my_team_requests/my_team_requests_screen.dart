import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/date_formate.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/domain/entities/my_team_requests_filter/my_team_requests_filter.dart';
import 'package:talent_link/src/domain/entities/timeline/timeline.dart';
import 'package:talent_link/src/presentation/blocs/my_team_requests/my_team_requests_bloc.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/filter/my_team_requests_filter_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/widgets/my_team_requests_content_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/widgets/my_team_requests_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class MyTeamRequestsScreen extends BaseStatefulWidget {
  const MyTeamRequestsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _MyTeamRequestsScreenState();
}

class _MyTeamRequestsScreenState extends BaseState<MyTeamRequestsScreen> {
  MyTeamRequestsBloc get _bloc => BlocProvider.of<MyTeamRequestsBloc>(context);
  List<MyTeamRequest> _myTeamRequests = [];
  MyTeamRequestFilter _myTeamRequestFilter = MyTeamRequestFilter(
      requests: [],
      companies: [],
      employees: [],
      filterCompanyId: 0,
      filterEmployeeId: 0,
      filterRequestId: 0);

  @override
  void initState() {
    _getMyTeamRequestsEvent();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyTeamRequestsBloc, MyTeamRequestsState>(
      listener: (context, state) {
        if (state is MyTeamRequestsBackState) {
          Navigator.pop(context);
        } else if (state is OpenMyTeamRequestFilterBottomSheetState) {
          _openFilter();
        } else if (state is GetMyTeamRequestSuccessState) {
          _myTeamRequests = _sortMyTeamRequestsByDate(state.myTeamRequests);
          if (_myTeamRequestFilter.requests!.isEmpty) {
            _bloc.add(GetAllRequestsEvent());
          }

          if (_myTeamRequestFilter.requests!.isEmpty) {
            _bloc.add(GetAllRequestsEvent());
          }
          if (_myTeamRequestFilter.companies!.isEmpty) {
            _bloc.add(GetCompaniesAndEmployeesEvent());
          }
        } else if (state is GetMyTeamRequestErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(MyTeamRequestsBackEvent());
          });
        } else if (state is GetMyTeamRequestsFilterSuccessState) {
          _myTeamRequestFilter = state.myTeamRequestFilter.copy();
        } else if (state is ApplyFilterMyTeamRequestsState) {
          _myTeamRequestFilter = state.myTeamRequestFilter;
          _getMyTeamRequestsEvent();
        } else if (state is NavigateToTimeLineScreenState) {
          _navigateToTimeLineScreen(state.myTeamRequest);
        } else if (state is GetMyTeamRequestsFilterErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(MyTeamRequestsBackEvent());
          });
        } else if (state is GetCompaniesAndEmployeesSuccessState) {
          _myTeamRequestFilter = state.myTeamRequestFilter;
        }
      },
      builder: (context, state) {
        if (state is GetMyTeamRequestSkeletonState) {
          return const MyTeamRequestsSkeletonWidget();
        }
        return Scaffold(
            appBar: buildAppBarWidget(
              context,
              title: S.of(context).myTeamRequests,
              isHaveBackButton: true,
              onBackButtonPressed: () {
                _bloc.add(MyTeamRequestsBackEvent());
              },
              actionWidget: InkWell(
                onTap: () {
                  _bloc.add(OpenMyTeamRequestFilterBottomSheetEvent());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    ImagePaths.filter,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            body: MyTeamRequestsContentWidget(
              myTeamRequests: _myTeamRequests,
              onTapTimeLine: (MyTeamRequest myTeamRequests) {
                _bloc.add(NavigateToTimeLineScreenEvent(
                    myTeamRequest: myTeamRequests));
              },
            ));
      },
    );
  }

  void _openFilter() {
    showBottomSheetWidget(
      isTitleVisible: false,
      height: 550,
      context: context,
      content: MyTeamRequestsFilterBottomSheetWidget(
          myTeamRequestFilter: _myTeamRequestFilter.copy()),
      titleLabel: '',
    ).then((value) {
      if (value != null) {
        _bloc.add(ApplyFilterMyTeamRequestsEvent(myTeamRequestFilter: value));
      }
    });
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }

  void _navigateToTimeLineScreen(
    MyTeamRequest myTeamRequest,
  ) {
    Navigator.pushNamed(context, Routes.timeline,
        arguments: Timeline(
            transactionId: myTeamRequest.transactionId,
            tableId: myTeamRequest.referenceId,
            baseUrl: ''));
  }

  void _getMyTeamRequestsEvent() {
    _bloc.add(GetMyTeamRequestsEvent(
      requestFromDate: dateFormat(_myTeamRequestFilter.fromRequestedDate ??
          DateTime(DateTime.now().year, DateTime.now().month, 1)),
      requestToDate: dateFormat(_myTeamRequestFilter.toRequestedDate ??
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0)),
      createdDateAt: dateFormat(_myTeamRequestFilter.toCreatedDate ??
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0)),
      createdDateFrom: dateFormat(_myTeamRequestFilter.fromCreatedDate ??
          DateTime(DateTime.now().year, DateTime.now().month, 1)),
      requestDataId: 0,
      transactionStatusId: 0,
      myTeamRequestFilter: _myTeamRequestFilter,
    ));
  }

  List<MyTeamRequest> _sortMyTeamRequestsByDate(
      List<MyTeamRequest> myTeamRequests) {
    myTeamRequests.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return myTeamRequests;
  }
}
