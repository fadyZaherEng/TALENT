import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/date_formate.dart';
import 'package:talent_link/src/domain/entities/attendance_history/attendance_history.dart';

class AttendanceHistoryItemWidget extends StatelessWidget {
  final AttendanceHistory attendanceHistories;

  const AttendanceHistoryItemWidget(
      {super.key, required this.attendanceHistories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: ColorSchemes.gray, width: 1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    formatDay(attendanceHistories.attendanceDate!),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorSchemes.black,
                        fontWeight: Constants.fontWeightBold),
                  ),
                  Text(
                    formatDateToCustomFormat(
                        attendanceHistories.attendanceDate!),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorSchemes.black,
                        fontWeight: Constants.fontWeightRegular),
                  ),
                ],
              )),
          const SizedBox(width: 20),
          Expanded(
              flex: 1,
              child: Container(
                child: attendanceHistories.actualNoOfWorkingMins == 0 &&
                        attendanceHistories.timeIn == null
                    ? empty
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            ImagePaths.checkIn1,
                            matchTextDirection: true,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              formatTimeToAmPm(attendanceHistories.timeIn!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorSchemes.black,
                                      fontWeight: Constants.fontWeightRegular),
                            ),
                          )
                        ],
                      ),
              )),
          const SizedBox(width: 18),
          Expanded(
              flex: 1,
              child: Container(
                child: attendanceHistories.actualNoOfWorkingMins == 0 &&
                        attendanceHistories.timeOut == null
                    ? empty
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ImagePaths.checkOut1,
                              matchTextDirection: true),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              formatTimeToAmPm(attendanceHistories.timeOut!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorSchemes.black,
                                      fontWeight: Constants.fontWeightRegular),
                            ),
                          )
                        ],
                      ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  attendanceHistories.actualNoOfWorkingMins == 0 &&
                          attendanceHistories.timeIn == "0"
                      ? empty
                      : Text(
                          attendanceHistories.actualNoOfWorkingMins.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorSchemes.black))
                ],
              )),
        ],
      ),
    );
  }

  Widget get empty => Wrap(
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              Container(
                alignment: Alignment.centerLeft,
                height: 2,
                width: 30,
                child: const Divider(
                  color: ColorSchemes.yellow,
                  height: 2,
                  thickness: 2,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40.0)
        ],
      );
}
