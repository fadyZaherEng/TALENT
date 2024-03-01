import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/request/attendance_history_request.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';
import 'package:talent_link/src/presentation/blocs/attendance_history/attendance_history_bloc.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/widgets/attendance_histories_widget.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/widgets/attendance_history_date_widget.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/widgets/attendance_history_fixed_widget.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/widgets/attendance_history_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class AttendanceHistoryScreen extends BaseStatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends BaseState<AttendanceHistoryScreen> {
  List<AttendanceHistory> _attendanceHistories = [];

  AttendanceHistoryBloc get _bloc =>
      BlocProvider.of<AttendanceHistoryBloc>(context);

  @override
  void initState() {
    _getAttendanceHistoryEvent(DateTime.now());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AttendanceHistoryBloc, AttendanceHistoryState>(
        listener: (context, state) {
      if (state is GetAttendanceHistorySuccessState) {
        _attendanceHistories = state.attendanceHistories;
      } else if (state is GetAttendanceHistoryErrorState) {
        _massageDialog(state.errorMessage, () {});
      } else if (state is AttendanceHistoryBackState) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).attendanceHistory,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(AttendanceHistoryBackEvent());
          }),
          body: Column(
            children: [
              AttendanceHistoryDateWidget(
                nextMonth: (DateTime dateTime) {
                  _getAttendanceHistoryEvent(dateTime);
                },
                previousMonth: (DateTime dateTime) {
                  _getAttendanceHistoryEvent(dateTime);
                },
                onTapDate: (DateTime dateTime) {
                  _getAttendanceHistoryEvent(dateTime);
                },
              ),
              const AttendanceHistoryFixedWidget(),
              state is GetAttendanceHistorySuccessState
                  ? AttendanceHistoriesWidget(
                      attendanceHistories: _attendanceHistories,
                    )
                  : const AttendanceHistorySkeletonWidget()
            ],
          ));
    });
  }

  void _getAttendanceHistoryEvent(DateTime dateTime) {
    _bloc.add(GetAttendanceHistoryEvent(
        attendanceHistoryRequest: AttendanceHistoryRequest(
      employeeId: 0,
      year: dateTime.year,
      month: dateTime.month,
    )));
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }
}
