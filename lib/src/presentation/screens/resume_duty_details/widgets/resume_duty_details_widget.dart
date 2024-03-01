import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';

class ResumeDutyDetailsWidget extends StatefulWidget {
  final GetResumeDutyDetails getResumeDutyDetails;
  const ResumeDutyDetailsWidget({super.key, required this.getResumeDutyDetails});

  @override
  State<ResumeDutyDetailsWidget> createState() => _ResumeDutyDetailsWidgetState();
}

class _ResumeDutyDetailsWidgetState extends State<ResumeDutyDetailsWidget> {
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
              _getRequestDetailsItemContent(
                text: S.of(context).expectedResumeDutyDate,
                value: widget.getResumeDutyDetails.expectedResumeDutyDate
                    .toString()
                    .split("T")[0],
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).resumeDutyTypeName,
                value:
                    widget.getResumeDutyDetails.resumeDutyTypeName.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).actualResumeDutyDate,
                value: widget.getResumeDutyDetails.actualResumeDutyDate
                    .toString()
                    .split("T")[0],
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).basicSalary,
                value: widget.getResumeDutyDetails.basicSalaryAmount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).allowancesAmount,
                value: widget.getResumeDutyDetails.allowancesAmount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).totalAmount,
                value: widget.getResumeDutyDetails.totalAmount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).totalResumedDays,
                value: widget.getResumeDutyDetails.totalResumedDays.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).currencyCode,
                value: widget.getResumeDutyDetails.currencyCode.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).transactionStatusName,
                value: widget.getResumeDutyDetails.transactionStatusName
                    .toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRequestDetailsItemContent({
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
