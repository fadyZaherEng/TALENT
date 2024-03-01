import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class MoreItemWidget extends StatelessWidget {
  final String image;
  final String text;
  final Widget? widget;
  final bool hasSuffixIcons;
  final Function()? onTap;

  const MoreItemWidget({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
    this.hasSuffixIcons = false,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasSuffixIcons ? () {} : onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Opacity(
              opacity: 0.6,
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                      color: ColorSchemes.border,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: SvgPicture.asset(image, fit: BoxFit.scaleDown)),
            ),
            const SizedBox(width: 9),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorSchemes.semiBlack,
                  fontWeight: Constants.fontWeightLight),
            ),
            hasSuffixIcons ? Expanded(child: widget!) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
