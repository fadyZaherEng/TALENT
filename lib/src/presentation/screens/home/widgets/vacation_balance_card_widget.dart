import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/remaining/remaining_balance.dart';
import 'package:talent_link/src/presentation/widgets/vacation_balance_pie_chart_widget.dart';

class VacationBalanceCardWidget extends StatelessWidget {
  final String endOfTheYearDays;
  final String todayDays;
  final Function() onTapSeeMore;
  final bool isEnglish;
  final double percentageOfToday;
  final double percentageOfYear;


  const VacationBalanceCardWidget({
    super.key,
    required this.endOfTheYearDays,
    required this.todayDays,
    required this.onTapSeeMore,
    required this.isEnglish,
    required this.percentageOfToday,
    required this.percentageOfYear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorSchemes.lightGray,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  S.of(context).theVacationBalance,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorSchemes.black,
                        fontWeight: Constants.fontWeightSemiBold,
                      ),
                )),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: VacationBalancePieChartWidget(
                    remainingBalance: RemainingBalance(
                        percentage: percentageOfToday,
                        title: S.of(context).today,
                        days: double.parse(todayDays).toStringAsFixed(1)),
                    isEnglish: isEnglish,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: VacationBalancePieChartWidget(
                    remainingBalance: RemainingBalance(
                        percentage: percentageOfYear,
                        title: S.of(context).endOfTheYear,
                        days: double.parse(endOfTheYearDays).toStringAsFixed(1)),
                    isEnglish: isEnglish,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
