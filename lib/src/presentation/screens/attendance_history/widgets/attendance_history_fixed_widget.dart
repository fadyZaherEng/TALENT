import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';

class AttendanceHistoryFixedWidget extends StatelessWidget {
  const AttendanceHistoryFixedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorSchemes.lightGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.of(context).date,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorSchemes.black)),
            Text(S.of(context).checkIn,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorSchemes.black)),
            Text(S.of(context).checkOut,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorSchemes.black,
                    )),
            Text(S.of(context).workHours,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorSchemes.black)),
          ],
        ),
      ),
    );
  }
}
