import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/widgets/my_team_attendance_item_widget.dart';
import '../../business_trip/widgets/business_trip_steps_widget.dart';

class MyTeamAttendancesWidget extends StatelessWidget {
  final List<MyTeamAttendance> myTeamAttendance;

  const MyTeamAttendancesWidget({
    super.key,
    required this.myTeamAttendance,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: myTeamAttendance.length,
        separatorBuilder: (context, index) =>  Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomPaint(
                painter: DottedLineMyTeamAttendance(),
                child: Container(),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
        itemBuilder: (context, index) => MyTeamAttendanceItemWidget(
            myTeamAttendance: myTeamAttendance[index]),
      ),
    );
  }
}
