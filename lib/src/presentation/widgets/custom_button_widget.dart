import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double? width;
  final double borderWidth;
  final double buttonBorderRadius;
  final FontWeight fontWeight;

  const CustomButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.backgroundColor = ColorSchemes.primary,
    this.textColor = ColorSchemes.white,
    this.height = 48,
    this.width,
    this.borderWidth = 1,
    this.borderColor = Colors.transparent,
    this.buttonBorderRadius = 12,
    this.fontWeight = Constants.fontWeightSemiBold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  letterSpacing: 0.24,
                  fontWeight: fontWeight,
                ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor,
                letterSpacing: 0.24,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
