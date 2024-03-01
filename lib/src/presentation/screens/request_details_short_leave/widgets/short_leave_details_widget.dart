import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';

class ShortLeaveDetailsWidget extends StatefulWidget {
  final GetShortLevelDetails getShortLevelDetails;

  const ShortLeaveDetailsWidget({
    super.key,
    required this.getShortLevelDetails,
  });

  @override
  State<ShortLeaveDetailsWidget> createState() => _ShortLeaveDetailsWidgetState();
}

class _ShortLeaveDetailsWidgetState extends State<ShortLeaveDetailsWidget> {
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
                text: S.of(context).shortLeaveDate,
                value: widget.getShortLevelDetails.shortLeaveDate
                    .toString()
                    .split("T")[0],
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).shortLeaveTypeName,
                value: widget.getShortLevelDetails.shortLeaveTypeName,
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).startTime,
                value: widget.getShortLevelDetails.startTime,
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).endTime,
                value: widget.getShortLevelDetails.endTime,
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).numberOfMinutes,
                value: widget.getShortLevelDetails.noOfMinutes.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).remarks,
                value: widget.getShortLevelDetails.remarks,
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).transactionStatusName,
                value: widget.getShortLevelDetails.transactionStatusName,
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
