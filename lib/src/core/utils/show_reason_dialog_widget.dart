import 'package:flutter/material.dart';

import 'package:talent_link/src/presentation/widgets/reason_dialog_widget.dart';

Future showReasonDialogWidget({
  required BuildContext context,
  required void Function(String value) primaryAction,
  required Function() secondaryAction,
  required bool isRequired,
}) async {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: ReasonDialogWidget(
            primaryAction: (String value) => primaryAction(value),
            secondaryAction: () => secondaryAction(),
            isRequired: isRequired,
          )));
}
