import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';

class SalaryProfileInformationWidget extends StatefulWidget {
  final ProfileEmployee profileEmployee;

  const SalaryProfileInformationWidget({
    super.key,
    required this.profileEmployee,
  });

  @override
  State<SalaryProfileInformationWidget> createState() =>
      _SalaryProfileInformationWidgetState();
}

class _SalaryProfileInformationWidgetState
    extends State<SalaryProfileInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7),
          color: ColorSchemes.white,
          boxShadow: [
            BoxShadow(
              color: ColorSchemes.gray.withOpacity(0.13),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Column(
            children: [
              _getSalaryProfileItemContent(
                text: S.of(context).basicSalary,
                value:
                    "${widget.profileEmployee.basicSalary} ${widget.profileEmployee.currency}",
              ),
              const SizedBox(
                height: 20,
              ),
              _getSalaryProfileItemContent(
                text: S.of(context).allowances,
                value:
                    "${widget.profileEmployee.totalAllowances} ${widget.profileEmployee.currency}",
              ),
              const SizedBox(
                height: 20,
              ),
              _getSalaryProfileItemContent(
                text: S.of(context).grossSalary,
                value:
                    "${widget.profileEmployee.grossSalary} ${widget.profileEmployee.currency}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSalaryProfileItemContent({
    required String text,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.grayText,
                fontWeight: Constants.fontWeightRegular),
            maxLines: 1,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: Constants.fontWeightMedium,
                  color: ColorSchemes.black,
                ),
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
