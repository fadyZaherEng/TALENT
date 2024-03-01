import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:talent_link/src/presentation/screens/attachment_details/widgets/attachment_details_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class AttachmentDetailsContentWidget extends StatefulWidget {
  final AttachmentDetails attachmentDetails;
  final bool isFromMyRequest;
  final int transactionId;
  final int referenceId;
  final void Function() onApprovePressed;
  final void Function() onRejectPressed;

  const AttachmentDetailsContentWidget({
    super.key,
    required this.attachmentDetails,
    required this.isFromMyRequest,
    required this.transactionId,
    required this.referenceId,
    required this.onApprovePressed,
    required this.onRejectPressed,
  });

  @override
  State<AttachmentDetailsContentWidget> createState() =>
      _AttachmentDetailsContentWidgetState();
}

class _AttachmentDetailsContentWidgetState
    extends State<AttachmentDetailsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AttachmentDetailsWidget(attachmentDetails: widget.attachmentDetails),
          widget.isFromMyRequest ||
                  (!widget.isFromMyRequest &&
                      (widget.attachmentDetails.transactionStatusId == 5 ||
                          widget.attachmentDetails.transactionStatusId == 8 ||
                          widget.attachmentDetails.transactionStatusId == 2 ||
                          widget.attachmentDetails.transactionStatusId == 3 ||
                          widget.attachmentDetails.transactionStatusId == 4))
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
        ]);
  }
}
