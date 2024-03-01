import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class PayslipItemWidget extends StatefulWidget {
  String asset;
  int value;
  String text;
  String currency;
  final Color backGroundColor;

  PayslipItemWidget(
      {super.key,
      required this.asset,
      required this.value,
      required this.text,
      required this.backGroundColor,
        required this.currency});

  @override
  State<PayslipItemWidget> createState() => _PayslipItemWidgetState();
}

class _PayslipItemWidgetState extends State<PayslipItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.backGroundColor,
              child: SvgPicture.asset(widget.asset),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorSchemes.textPayslipColor,
                    fontWeight: Constants.fontWeightRegular)),
            const Spacer(),
            Text("${widget.value} ${widget.currency}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorSchemes.textPayslipColor,
                    fontWeight: Constants.fontWeightBold))
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
    ]);
  }
}
