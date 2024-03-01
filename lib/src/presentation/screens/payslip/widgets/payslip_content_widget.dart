// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_item_widget.dart';

class ResponsePaySlipContentWidget extends StatefulWidget {
  Payslip payslip;

  ResponsePaySlipContentWidget({super.key, required this.payslip});

  @override
  State<ResponsePaySlipContentWidget> createState() =>
      _ResponsePaySlipContentWidgetState();
}

class _ResponsePaySlipContentWidgetState
    extends State<ResponsePaySlipContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: ColorSchemes.bottomPayslipColor,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
        ),
        child: Card(
          elevation: 0.0,
          shadowColor: Colors.white,
          child: Column(
            children: [
              PayslipItemWidget(
                currency: widget.payslip.currency,
                asset: ImagePaths.dollers,
                text: S.of(context).basicSalary,
                value: widget.payslip.paymentBasicSalaryAmount,
                backGroundColor: const Color.fromRGBO(56, 203, 137, 0.1),
              ),
              PayslipItemWidget(
                currency: widget.payslip.currency,
                asset: ImagePaths.arrow,
                text: S.of(context).housingAllowance,
                value: widget.payslip.allowancesAmount,
                backGroundColor: const Color.fromRGBO(255, 171, 0, 0.1),
              ),
              PayslipItemWidget(
                currency: widget.payslip.currency,
                asset: ImagePaths.blus,
                text: S.of(context).additions,
                value: widget.payslip.additionsAmount,
                backGroundColor: const Color.fromRGBO(239, 75, 75, 0.1),
              ),
              PayslipItemWidget(
                currency: widget.payslip.currency,
                asset: ImagePaths.diffMinus,
                text: S.of(context).deducted,
                value: widget.payslip.deductionsAmount,
                backGroundColor: const Color.fromRGBO(29, 153, 109, 0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
