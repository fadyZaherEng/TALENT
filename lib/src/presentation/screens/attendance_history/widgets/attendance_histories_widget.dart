import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/widgets/attendance_empty_screen_widget.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/widgets/attendance_history_item_widget.dart';

class AttendanceHistoriesWidget extends StatelessWidget {
  final List<AttendanceHistory> attendanceHistories;

  const AttendanceHistoriesWidget({
    super.key,
    required this.attendanceHistories,
  });

  @override
  Widget build(BuildContext context) {
    return attendanceHistories.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: attendanceHistories.length,
              separatorBuilder: (context, index) => const Column(
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(height: 1, color: ColorSchemes.gray),
                  ),
                  SizedBox(height: 12),
                ],
              ),
              itemBuilder: (context, index) => AttendanceHistoryItemWidget(
                  attendanceHistories: attendanceHistories[index]),
            ),
          )
        : const AttendanceEmptyScreenWidget();
  }
}
