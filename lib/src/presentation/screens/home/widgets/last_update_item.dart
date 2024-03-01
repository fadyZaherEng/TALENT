import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class LastUpdateItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;
  final int id;

  const LastUpdateItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Color borderWithTitleColor = ColorSchemes.gray;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected == true
                      ? borderWithTitleColor = ColorSchemes.primary
                      : borderWithTitleColor = ColorSchemes.gray),
              color: ColorSchemes.white,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: borderWithTitleColor,
                    fontSize: 13,
                    letterSpacing: -0.13),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
