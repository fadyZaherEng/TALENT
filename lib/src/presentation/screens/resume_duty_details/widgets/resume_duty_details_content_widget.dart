import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';
import 'package:talent_link/src/presentation/screens/resume_duty_details/widgets/resume_duty_details_employee_widget.dart';
import 'package:talent_link/src/presentation/screens/resume_duty_details/widgets/resume_duty_details_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class ResumDutyDetailsContentWidget extends StatefulWidget {
  final GetResumeDutyDetails getResumeDutyDetails;
  final bool isFromMyRequest;
  final int transactionId;
  final int transactionStatusId;
  final String transactionStatusName;
  final int referenceId;
  final void Function() onApprovePressed;
  final void Function() onRejectPressed;

  const ResumDutyDetailsContentWidget({
    super.key,
    this.isFromMyRequest = false,
    required this.getResumeDutyDetails,
    required this.referenceId,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.transactionId,
    required this.onApprovePressed,
    required this.onRejectPressed,
  });

  @override
  State<ResumDutyDetailsContentWidget> createState() =>
      _ResumDutyDetailsContentWidgetState();
}

class _ResumDutyDetailsContentWidgetState
    extends State<ResumDutyDetailsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResumeDutyDetailsWidget(
            getResumeDutyDetails: widget.getResumeDutyDetails),
        ResumeDutyDetailsEmployeeWidget(
            getResumeDutyDetails: widget.getResumeDutyDetails),
        widget.isFromMyRequest ||
                (!widget.isFromMyRequest &&
                    (widget.transactionStatusId == 5 ||
                        widget.transactionStatusId == 8 ||
                        widget.transactionStatusId == 2 ||
                        widget.transactionStatusId == 3 ||
                        widget.transactionStatusId == 4))
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButtonWidget(
                      onTap: widget.onRejectPressed,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      text: S.current.reject,
                      backgroundColor: ColorSchemes.black,
                      buttonBorderRadius: 8,
                    ),
                    CustomButtonWidget(
                      onTap: widget.onApprovePressed,
                      text: S.current.approve,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      backgroundColor: ColorSchemes.primary,
                      buttonBorderRadius: 8,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
