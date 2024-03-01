import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/date_formate.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance.dart';

class MyTeamAttendanceItemWidget extends StatelessWidget {
  final MyTeamAttendance myTeamAttendance;

  const MyTeamAttendanceItemWidget({
    super.key,
    required this.myTeamAttendance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(myTeamAttendance.employeeSystemImage),
                      onError: (exception, stackTrace) {},
                      fit: BoxFit.cover, // You can adjust the fit as needed
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    myTeamAttendance.employeeName.isEmpty
                        ? empty
                        : Text(myTeamAttendance.employeeName.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ColorSchemes.black)),
                    myTeamAttendance.employeePosition.isEmpty
                        ? empty
                        : Text(myTeamAttendance.employeeName.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.gray,
                                    fontWeight: Constants.fontWeightLight))
                  ],
                )
              ]),
            ],
          )),
          Row(
            children: [
              Container(
                child: myTeamAttendance.timeIn.isEmpty
                    ? empty
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ImagePaths.checkIn1,matchTextDirection: true),
                          const SizedBox(width: 8),
                          Text(
                            formatTimeToAmPm(myTeamAttendance.timeIn),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.black,
                                    fontWeight: Constants.fontWeightRegular),
                          )
                        ],
                      ),
              ),
              Container(
                child: myTeamAttendance.timeOut.isEmpty
                    ? empty
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ImagePaths.checkOut1,matchTextDirection: true,),
                          const SizedBox(width: 8),
                          Text(
                            formatTimeToAmPm(myTeamAttendance.timeOut),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.black,
                                    fontWeight: Constants.fontWeightRegular),
                          )
                        ],
                      ),
              )
            ],
          ),
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
