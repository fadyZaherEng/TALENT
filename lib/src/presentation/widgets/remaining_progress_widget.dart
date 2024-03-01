import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/remaining/renmaining_progress.dart';

class RemainingProgressWidget extends StatelessWidget {
  final RemainingProgress remainingProgress;
  final bool isRTL;

  const RemainingProgressWidget({
    super.key,
    required this.remainingProgress,
    required this.isRTL,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              decoration: BoxDecoration(
                  color: remainingProgress.backgroundColor,
                  border: Border.all(
                    color: ColorSchemes.statusSuccess,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: LinearPercentIndicator(
                padding: const EdgeInsets.all(3),
                animation: true,
                lineHeight: remainingProgress.lineHeight,
                barRadius: const Radius.circular(10),
                animationDuration: 2000,
                backgroundColor: remainingProgress.backgroundColor,
                percent: remainingProgress.percent,
                isRTL: !isRTL,
                clipLinearGradient: true,
                center: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(children: [
                    Text(
                      !remainingProgress.isPlusTime
                          ? S.of(context).remaining
                          : "+",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorSchemes.black,
                          fontWeight: Constants.fontWeightRegular),
                    ),
                    Text(
                      " ${remainingProgress.remainingHours} ${S.of(context).hours}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorSchemes.black,
                          fontWeight: Constants.fontWeightBold),
                    )
                  ]),
                ),
                progressColor: remainingProgress.progressColor,
              )),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
