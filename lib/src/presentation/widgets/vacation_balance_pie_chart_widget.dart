import 'package:flutter/material.dart';

import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/remaining/remaining_balance.dart';

class VacationBalancePieChartWidget extends StatelessWidget {
  final RemainingBalance remainingBalance;
  final bool isEnglish;

  const VacationBalancePieChartWidget({
    super.key,
    required this.remainingBalance,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return ArcProgressBar(
      animationDuration: const Duration(seconds: 2),
      percentage: remainingBalance.percentage,
      arcThickness: 10,
      handleColor: ColorSchemes.redError,
      backgroundColor: ColorSchemes.border,
      animateFromLastPercent: true,
      foregroundColor: ColorSchemes.redError,
      innerPadding: 10,
      handleSize: remainingBalance.days != '0' ? 8 : 0,
      strokeCap: StrokeCap.round,
      centerWidget: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text(
              remainingBalance.title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorSchemes.redError,
                  fontWeight: Constants.fontWeightSemiBold),
            ),
            SizedBox(height: isEnglish ? 3 : 15),
            Text(
              "${remainingBalance.days} ${S.of(context).days}",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorSchemes.black,
                  fontWeight: Constants.fontWeightBold),
            ),
          ],
        ),
      ),
    );
  }
}
