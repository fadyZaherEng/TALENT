import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/my_requests/contact_details/contact_details.dart';
import 'package:talent_link/src/presentation/screens/contact_details/widgets/contact_details_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class ContactDetailsContentWidget extends StatefulWidget {
  final ContactDetails contactDetails;
  final bool isFromMyRequest;
  final int transactionId;
  final int referenceId;
  final void Function() onApprovePressed;
  final void Function() onRejectPressed;

  const ContactDetailsContentWidget({
    super.key,
    required this.contactDetails,
    required this.isFromMyRequest,
    required this.transactionId,
    required this.referenceId,
    required this.onApprovePressed,
    required this.onRejectPressed,
  });

  @override
  State<ContactDetailsContentWidget> createState() =>
      _ContactDetailsContentWidgetState();
}

class _ContactDetailsContentWidgetState
    extends State<ContactDetailsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactDetailsWidget(contactDetails: widget.contactDetails),
          widget.isFromMyRequest ||
                  (!widget.isFromMyRequest &&
                      (widget.contactDetails.statusId == 5 ||
                          widget.contactDetails.statusId == 8 ||
                          widget.contactDetails.statusId == 2 ||
                          widget.contactDetails.statusId == 3 ||
                          widget.contactDetails.statusId == 4))
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
