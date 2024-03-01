import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_controller.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_error_massage.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_functions.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_global_key.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/widgets/air_ticket_table_wisget.dart';
import 'package:talent_link/src/presentation/widgets/custom_card_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_date_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_dropdown_text_field_with_label_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_buttons_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_label_widget.dart';

class AirTicketContentWidget extends StatefulWidget {
  final AirTicketErrorMassage airTicketErrorMassage;
  final AirTicketController airTicketController;
  final AirTicketGlobalKey airTicketGlobalKey;
  final AirTicketFunctions airTicketFunctions;
  final List<AirTicket> airTickets;
  final bool visiblePaymentMethod;

  const AirTicketContentWidget({
    super.key,
    required this.airTicketErrorMassage,
    required this.airTicketController,
    required this.airTicketGlobalKey,
    required this.airTicketFunctions,
    required this.airTickets,
    required this.visiblePaymentMethod,
  });

  @override
  State<AirTicketContentWidget> createState() => _AirTicketContentWidgetState();
}

class _AirTicketContentWidgetState extends State<AirTicketContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomCardWidget(widget: [
            CustomDateTextFieldWithLabelWidget(
              firstDate: DateTime.now(),
              value: widget.airTicketController.requestedDate.text,
              title: S.of(context).requestedDate,
              globalKey: widget.airTicketGlobalKey.requestedDate,
              errorMassage: widget.airTicketErrorMassage.requestedDate,
              readOnly: true,
              pickDate: (value) {
                widget.airTicketFunctions.onPickRequestedDate(value);
              },
              deleteDate: widget.airTicketFunctions.onDeleteRequestedDate,
            ),
            const SizedBox(height: 20),
            CustomTextFieldWithLabelWidget(
              readOnly: true,
              controller: widget.airTicketController.airTicketDueMonth,
              errorMassage: null,
              globalKey: widget.airTicketGlobalKey.airTicketDueMonth,
              title: S.of(context).airTicketDueMonth,
              onChange: (valueString) {},
            ),
            const SizedBox(height: 20),
            CustomTextFieldWithLabelWidget(
              readOnly: true,
              controller: widget.airTicketController.airTicketDueYear,
              errorMassage: null,
              globalKey: widget.airTicketGlobalKey.airTicketDueYear,
              title: S.of(context).airTicketDueYear,
              onChange: (valueString) {},
            ),
            const SizedBox(height: 20),
            CustomRadioButtonsWidget(
              onSelectAction: (value) =>
                  widget.airTicketFunctions.onSelectRadioButton(value),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: widget.visiblePaymentMethod,
              child: CustomDropdownTextFieldWithLabelWidget(
                  controller: widget.airTicketController.paymentMethod,
                  errorMessage: widget.airTicketErrorMassage.paymentMethod,
                  globalKey: widget.airTicketGlobalKey.paymentMethod,
                  title: S.of(context).paymentMethod,
                  onTap: widget.airTicketFunctions.onTapPaymentMethod),
            ),
          ]),
          AirTicketTableWidget(airTickets: widget.airTickets),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGradientButtonWidget(
              text: S.of(context).submit,
              onTap: widget.airTicketFunctions.onTapSubmit,
            ),
          )
        ],
      ),
    );
  }
}
