// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class PayslipSalaryWidget extends StatefulWidget {
  int salary;
  String currency;

  PayslipSalaryWidget({
    super.key,
    required this.salary,
    required this.currency,
  });

  @override
  State<PayslipSalaryWidget> createState() => _PayslipSalaryWidgetState();
}

class _PayslipSalaryWidgetState extends State<PayslipSalaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorSchemes.bottomPayslipColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Container(
                height: 105,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: ColorSchemes.primary,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 26, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).yourSalary,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: ColorSchemes.titlePayslipColor,
                                  fontWeight: Constants.fontWeightRegular)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${widget.salary.toString()} ${widget.currency}",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: ColorSchemes.white,
                            fontSize: 28,
                            fontWeight: Constants.fontWeightBold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
