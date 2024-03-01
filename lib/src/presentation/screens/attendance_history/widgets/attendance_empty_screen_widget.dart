import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class AttendanceEmptyScreenWidget extends StatefulWidget {
  const AttendanceEmptyScreenWidget({super.key});

  @override
  State<AttendanceEmptyScreenWidget> createState() =>
      _AttendanceEmptyScreenWidgetState();
}

class _AttendanceEmptyScreenWidgetState
    extends State<AttendanceEmptyScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImagePaths.attendanceHistoryEmpty,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).noHistory,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorSchemes.black,
                  fontWeight: Constants.fontWeightRegular),
            )
          ],
        ),
      ),
    );
  }
}
