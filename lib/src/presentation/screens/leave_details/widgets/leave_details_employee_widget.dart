import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';

class LeaveDetailsEmployeeWidget extends StatefulWidget {
  final GetLeaveDetails getLeaveDetails;

  const LeaveDetailsEmployeeWidget({
    super.key,
    required this.getLeaveDetails,
  });

  @override
  State<LeaveDetailsEmployeeWidget> createState() =>
      _LeaveDetailsEmployeeWidgetState();
}

class _LeaveDetailsEmployeeWidgetState
    extends State<LeaveDetailsEmployeeWidget> {
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
              _getBasicRequestItemContent(
                text: S.of(context).name,
                value: widget.getLeaveDetails.employee.name,
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicRequestItemContent(
                text: S.of(context).basicSalary,
                value: widget.getLeaveDetails.employee.basicSalary.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicRequestItemContent(
                text: S.of(context).grossSalary,
                value: widget.getLeaveDetails.employee.gosiSalary.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicRequestItemContent(
                text: S.of(context).position,
                value: widget.getLeaveDetails.employee.positionName.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getBasicRequestItemContent(
                text: S.of(context).joiningDate,
                value: widget.getLeaveDetails.employee.joiningDate
                    .toString()
                    .split("T")[0],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBasicRequestItemContent({
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
