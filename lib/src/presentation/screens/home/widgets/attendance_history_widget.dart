import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';

class AttendanceHistoryHomeWidget extends StatelessWidget {
  final Function() onTap;

  const AttendanceHistoryHomeWidget({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: ColorSchemes.lightGrayBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).attendanceHistory,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.normal, color: ColorSchemes.black),
                ),
                SvgPicture.asset(
                  ImagePaths.rightArrow,
                  matchTextDirection: true,
                )
              ],
            ),
          ),
        ),
      );
}
