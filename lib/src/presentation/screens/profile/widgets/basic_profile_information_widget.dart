import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';

class BasicsProfileInformationWidget extends StatefulWidget {
  final ProfileEmployee profileEmployee;
  const BasicsProfileInformationWidget(
      {super.key, required this.profileEmployee});

  @override
  State<BasicsProfileInformationWidget> createState() =>
      _BasicsProfileInformationWidgetState();
}

class _BasicsProfileInformationWidgetState
    extends State<BasicsProfileInformationWidget> {
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
              _getBasicProfileItemContent(
                text: S.of(context).employerNo,
                value: widget.profileEmployee.employeeNo,
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicProfileItemContent(
                text: S.of(context).employerName,
                value: widget.profileEmployee.employeeName,
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicProfileItemContent(
                text: S.of(context).company,
                value: widget.profileEmployee.companyName,
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicProfileItemContent(
                text: S.of(context).nationality,
                value: widget.profileEmployee.nationality,
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicProfileItemContent(
                text: S.of(context).birthDay,
                value: widget.profileEmployee.birthDate,
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicProfileItemContent(
                text: S.of(context).civilId,
                value: widget.profileEmployee.civilId,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBasicProfileItemContent({
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
