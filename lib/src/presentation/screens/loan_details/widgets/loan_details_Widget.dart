import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';

class LoanDetailsWidget extends StatefulWidget {
  final GetLoanDetails getLoanDetails;

  const LoanDetailsWidget({super.key, required this.getLoanDetails});

  @override
  State<LoanDetailsWidget> createState() => _LoanDetailsWidgetState();
}

class _LoanDetailsWidgetState extends State<LoanDetailsWidget> {
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
                text: S.of(context).loanRequestedDate,
                value: widget.getLoanDetails.loanRequestedDate
                    .toString()
                    .split("T")[0],
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).loanTypeName,
                value: widget.getLoanDetails.loanTypeName.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).paymentStartMonth,
                value: widget.getLoanDetails.paymentStartMonth.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).paymentStartYear,
                value: widget.getLoanDetails.paymentStartYear.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).loanTotalAmount,
                value: widget.getLoanDetails.loanTotalAmount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).remarks,
                value: widget.getLoanDetails.remarks.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).basicSalary,
                value: widget.getLoanDetails.basicSalaryAmount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).allowancesAmount,
                value: widget.getLoanDetails.allowancesAmount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).transactionStatusName,
                value: widget.getLoanDetails.transactionStatusName.toString(),
              ),
              const SizedBox(
                height: 20,
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
