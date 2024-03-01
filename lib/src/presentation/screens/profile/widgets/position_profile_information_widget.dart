import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';

class PositionProfileInformationWidget extends StatefulWidget {
  final ProfileEmployee profileEmployee;

  const PositionProfileInformationWidget(
      {super.key, required this.profileEmployee});

  @override
  State<PositionProfileInformationWidget> createState() =>
      _PositionProfileInformationWidgetState();
}

class _PositionProfileInformationWidgetState
    extends State<PositionProfileInformationWidget> {
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
              _getPositionProfileItemContent(
                text: S.of(context).email,
                value: widget.profileEmployee.email,
              ),
              const SizedBox(
                height: 20,
              ),
              _getPositionProfileItemContent(
                text: S.of(context).position,
                value: widget.profileEmployee.positionName,
              ),
              const SizedBox(
                height: 20,
              ),
              _getPositionProfileItemContent(
                text: S.of(context).gradeLevel,
                value: widget.profileEmployee.level,
              ),
              const SizedBox(
                height: 20,
              ),
              _getPositionProfileItemContent(
                text: S.of(context).directManager,
                value: widget.profileEmployee.directManager,
              ),
              const SizedBox(
                height: 20,
              ),
              _getPositionProfileItemContent(
                text: S.of(context).joiningDate,
                value: widget.profileEmployee.joiningDate,
              ),
              const SizedBox(
                height: 20,
              ),
              _getPositionProfileItemContent(
                text: S.of(context).residencyIssueDate,
                value: widget.profileEmployee.residencyIssueDate,
              ),
              const SizedBox(
                height: 20,
              ),
              _getPositionProfileItemContent(
                text: S.of(context).residencyExpireDate,
                value: widget.profileEmployee.residencyExpiryDate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPositionProfileItemContent({
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
