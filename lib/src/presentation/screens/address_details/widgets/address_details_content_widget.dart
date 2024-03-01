import 'package:flutter/material.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';
import 'package:talent_link/src/presentation/screens/address_details/widgets/address_details_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class AddressDetailsContentWidget extends StatefulWidget {
  final AddressDetails addressDetails;
  final bool isFromMyRequest;
  final int transactionId;
  final int referenceId;
  final void Function() onApprovePressed;
  final void Function() onRejectPressed;

  const AddressDetailsContentWidget({
    super.key,
    required this.addressDetails,
    required this.isFromMyRequest,
    required this.transactionId,
    required this.referenceId,
    required this.onApprovePressed,
    required this.onRejectPressed,
  });

  @override
  State<AddressDetailsContentWidget> createState() =>
      _AddressDetailsContentWidgetState();
}

class _AddressDetailsContentWidgetState
    extends State<AddressDetailsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddressDetailsWidget(addressDetails: widget.addressDetails),
          widget.isFromMyRequest ||
                  (!widget.isFromMyRequest &&
                      (widget.addressDetails.statusId == 5 ||
                          widget.addressDetails.statusId == 8 ||
                          widget.addressDetails.statusId == 2 ||
                          widget.addressDetails.statusId == 3 ||
                          widget.addressDetails.statusId == 4))
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
