import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';
import 'package:talent_link/src/presentation/screens/leave_details/widgets/leave_details_employee_widget.dart';
import 'package:talent_link/src/presentation/screens/leave_details/widgets/leave_details_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class LeaveDetailsContentWidget extends StatefulWidget {
  final GetLeaveDetails getLeaveDetails;

  final bool isFromMyRequest;
  final int transactionId;
  final int transactionStatusId;
  final String transactionStatusName;
  final int referenceId;
  final  Function() onApprovePressed;
  final  Function() onRejectPressed;
  const LeaveDetailsContentWidget({
    super.key,
    this.isFromMyRequest = false,
    required this.getLeaveDetails,
    required this.referenceId,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.transactionId,
    required this.onApprovePressed,
    required this.onRejectPressed,
  });

  @override
  State<LeaveDetailsContentWidget> createState() =>
      _LeaveDetailsContentWidgetState();
}

class _LeaveDetailsContentWidgetState extends State<LeaveDetailsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LeaveDetailsWidget(
          getLeaveDetails: widget.getLeaveDetails,
        ),
        LeaveDetailsEmployeeWidget(getLeaveDetails: widget.getLeaveDetails),
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
