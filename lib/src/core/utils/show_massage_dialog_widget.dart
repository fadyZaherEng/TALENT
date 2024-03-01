import 'package:flutter/material.dart';

import 'package:talent_link/src/presentation/widgets/massage_dialog_widget.dart';

Future showMassageDialogWidget({
  required BuildContext context,
  required String text,
  required String icon,
  required String buttonText,
  required Function() onTap,
}) async {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: MassageDialogWidget(
              text: text,
              icon: icon,
              buttonText: buttonText,
              onTap: onTap,
            ),
          )));
}
