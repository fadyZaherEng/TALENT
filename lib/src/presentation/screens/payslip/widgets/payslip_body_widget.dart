import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_content_widget.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_date_widget.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_salary_widget.dart';

class PayslipBodyWidget extends StatefulWidget {
  void Function(DateTime value) onPreviousMonth;
  void Function(DateTime value) onNextMonth;
  final Payslip payslip;
  void Function(DateTime value) getPayslip;

  PayslipBodyWidget({
    super.key,
    required this.payslip,
    required this.getPayslip,
    required this.onNextMonth,
    required this.onPreviousMonth,
  });

  @override
  State<PayslipBodyWidget> createState() => _PayslipBodyWidgetState();
}

class _PayslipBodyWidgetState extends State<PayslipBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PayslipDateWidget(
            previousMonth: widget.onPreviousMonth,
            nextMonth: widget.onNextMonth,
            onTapDate: widget.getPayslip,
          ),
          PayslipSalaryWidget(
            salary: widget.payslip.netTotalAmount ?? 0,
            currency: widget.payslip.currency,
          ),
          ResponsePaySlipContentWidget(
            payslip: widget.payslip,
          ),
        ],
      ),
    );
  }
}
