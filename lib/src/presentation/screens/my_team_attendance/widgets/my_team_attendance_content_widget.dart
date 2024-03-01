import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_date_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_fixed_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendances_widget.dart';

class MyTeamAttendanceContentWidget extends StatelessWidget {
  final void Function(DateTime dateTime) previousMonth;
  final void Function(DateTime dateTime) nextMonth;
  final void Function(DateTime dateTime) onTapDate;
  final List<MyTeamAttendance> myTeamAttendance;
  final MyTeamAttendanceStatistics myTeamAttendanceStatistics;
  final DateTime currentDate;
  final bool isEnglish;

  const MyTeamAttendanceContentWidget({
    super.key,
    required this.previousMonth,
    required this.nextMonth,
    required this.onTapDate,
    required this.myTeamAttendance,
    required this.myTeamAttendanceStatistics,
    required this.currentDate,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTeamAttendanceDateWidget(
          previousMonth: previousMonth,
          nextMonth: nextMonth,
          onTapDate: onTapDate,
          currentDate: currentDate,
        ),
        MyTeamAttendanceFixedWidget(
          myTeamAttendanceStatistics: myTeamAttendanceStatistics,
          isEnglish: isEnglish,
        ),
        MyTeamAttendancesWidget(
          myTeamAttendance: myTeamAttendance,
        )
      ],
    );
  }
}
