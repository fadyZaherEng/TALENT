import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance/my_team_attendance_statistics.dart';

class MyTeamAttendanceFixedWidget extends StatelessWidget {
  final MyTeamAttendanceStatistics myTeamAttendanceStatistics;
  final bool isEnglish;

  const MyTeamAttendanceFixedWidget({
    super.key,
    required this.myTeamAttendanceStatistics,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: const BorderSide(width: 1.0, color: ColorSchemes.gray),
                  bottom:
                      const BorderSide(width: 1.0, color: ColorSchemes.gray),
                  right: isEnglish
                      ? const BorderSide(width: 0.5, color: ColorSchemes.gray)
                      : const BorderSide(color: Colors.transparent),
                  left: isEnglish
                      ? const BorderSide(color: Colors.transparent)
                      : const BorderSide(width: 0.5, color: ColorSchemes.gray),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Row(
                  children: [
                    SvgPicture.asset(ImagePaths.present, fit: BoxFit.scaleDown),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).present,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: Constants.fontWeightLight,
                          color: ColorSchemes.gray),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "${myTeamAttendanceStatistics.noOfEmployeesPresent} / ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorSchemes.black),
                    ),
                    Text(
                      "${myTeamAttendanceStatistics.noOfEmployeesTotal}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorSchemes.black),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: const BorderSide(width: 1.0, color: ColorSchemes.gray),
                    bottom:
                        const BorderSide(width: 1.0, color: ColorSchemes.gray),
                    left: isEnglish
                        ? const BorderSide(width: 0.5, color: ColorSchemes.gray)
                        : const BorderSide(color: Colors.transparent),
                    right: isEnglish
                        ? const BorderSide(color: Colors.transparent)
                        : const BorderSide(
                            width: 0.5, color: ColorSchemes.gray)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    SvgPicture.asset(ImagePaths.myTeamLeave,
                        fit: BoxFit.scaleDown),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).leave,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: Constants.fontWeightLight,
                          color: ColorSchemes.gray),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "${myTeamAttendanceStatistics.noOfEmployeesLeave}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorSchemes.black),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
