import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/date_formate.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance_filter/my_team_attendance_filter.dart';
import 'package:talent_link/src/presentation/blocs/my_team_attendance/my_team_attendance_bloc.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/filter/my_team_attendance_filter_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_date_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_empty_screen_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_fixed_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_skeleton_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendances_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class MyTeamAttendanceScreen extends BaseStatefulWidget {
  const MyTeamAttendanceScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _MyTeamAttendanceScreenState();
}

class _MyTeamAttendanceScreenState extends BaseState<MyTeamAttendanceScreen> {
  MyTeamAttendanceBloc get _bloc =>
      BlocProvider.of<MyTeamAttendanceBloc>(context);
  List<MyTeamAttendance> _myTeamAttendance = [];
  MyTeamAttendanceStatistics _myTeamAttendanceStatistics =
      MyTeamAttendanceStatistics();
  MyTeamAttendanceFilter _myTeamAttendanceFilter = MyTeamAttendanceFilter(
    fromDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
    toDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
  );
  bool _isEnglish = true;

  @override
  void initState() {
    _bloc.add(GetCompaniesAndEmployeesEvent());
    _bloc.add(GetLanguageEvent());
    _updateFilter();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyTeamAttendanceBloc, MyTeamAttendanceState>(
      listener: (context, state) {
        if (state is MyTeamAttendanceBackState) {
          Navigator.pop(context);
        } else if (state is GetMyTeamAttendanceSuccessState) {
          _myTeamAttendance = state.myTeamAttendance;
        } else if (state is GetMyTeamAttendanceErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(MyTeamAttendanceBackEvent());
          });
        } else if (state is GetMyTeamAttendanceStatisticsSuccessState) {
          _myTeamAttendanceStatistics = state.myTeamAttendanceStatistics;
        } else if (state is GetMyTeamAttendanceStatisticsErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(MyTeamAttendanceBackEvent());
          });
        } else if (state is OpenMyTeamAttendanceFilterState) {
          _openFilter();
        } else if (state is GetMyTeamAttendanceFilterSuccessState) {
          _myTeamAttendanceFilter = state.myTeamAttendanceFilter;
        } else if (state is MyTeamAttendanceApplyFilterState) {
          _myTeamAttendanceFilter = state.myTeamAttendanceFilter;
          _updateFilter();
        } else if (state is GetMyTeamAttendanceFilterErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(MyTeamAttendanceBackEvent());
          });
        } else if (state is GetCompaniesAndEmployeesSuccessState) {
          _myTeamAttendanceFilter = state.myTeamAttendanceFilter;
        } else if (state is UpdateDateState) {
          _myTeamAttendanceFilter.toDate = state.myTeamAttendanceFilter.toDate;
          _myTeamAttendanceFilter.fromDate =
              state.myTeamAttendanceFilter.fromDate;
          _updateFilter();
        } else if (state is GetLanguageState) {
          _isEnglish = state.isEnglish;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).myTeamAttendance,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(MyTeamAttendanceBackEvent());
          },
              actionWidget: InkWell(
                onTap: () {
                  _bloc.add(OpenMyTeamAttendanceFilterEvent());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    ImagePaths.filter,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )),
          body: Column(
            children: [
              MyTeamAttendanceDateWidget(
                previousMonth: (DateTime dateTime) {
                  _updateDate(dateTime);
                },
                nextMonth: (DateTime dateTime) {
                  _updateDate(dateTime);
                },
                onTapDate: (DateTime dateTime) {
                  _updateDate(dateTime);
                },
                currentDate: _myTeamAttendanceFilter.fromDate!,
              ),
              MyTeamAttendanceFixedWidget(
                myTeamAttendanceStatistics: _myTeamAttendanceStatistics,
                isEnglish: _isEnglish,
              ),
              state is MyTeamAttendanceSkeletonState
                  ? const MyTeamAttendanceSkeletonWidget()
                  : _myTeamAttendance.isNotEmpty
                      ? MyTeamAttendancesWidget(
                          myTeamAttendance: _myTeamAttendance,
                        )
                      : const MyTeamAttendanceEmptyScreenWidget(),
            ],
          ),
        );
      },
    );
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }

  void _getMyTeamAttendanceEvent() {
    _bloc.add(GetMyTeamAttendanceEvent(
        toDate: dateFormatRequest(_myTeamAttendanceFilter.toDate ??
            DateTime(_myTeamAttendanceFilter.fromDate!.year,
                _myTeamAttendanceFilter.fromDate!.month + 1, 0)),
        fromDate: dateFormatRequest(_myTeamAttendanceFilter.fromDate!),
        myTeamAttendanceFilter: _myTeamAttendanceFilter));
  }

  void _getMyTeamAttendanceStatisticsEvent() {
    _bloc.add(GetMyTeamAttendanceStatisticsEvent(
        attendanceDate: dateFormatRequest(_myTeamAttendanceFilter.fromDate!),
        myTeamAttendanceFilter: _myTeamAttendanceFilter));
  }

  void _openFilter() {
    showBottomSheetWidget(
            height: 380,
            context: context,
            content: MyTeamAttendanceFilterWidget(
              myTeamAttendanceFilter: _myTeamAttendanceFilter.copy(),
            ),
            titleLabel: '')
        .then((value) {
      if (value != null) {
        _bloc.add(
            ApplyFilterMyTeamAttendanceEvent(myTeamAttendanceFilter: value));
      }
    });
  }

  void _updateFilter() {
    _getMyTeamAttendanceEvent();
    _getMyTeamAttendanceStatisticsEvent();
  }

  void _updateDate(DateTime dateTime) {
    _bloc.add(UpdateDateEvent(
        fromDate: dateTime,
        toDate: DateTime(dateTime.year, dateTime.month + 1, 0)));
  }
}
