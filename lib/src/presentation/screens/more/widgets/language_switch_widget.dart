import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';

class LanguageSwitchWidget extends StatelessWidget {
  final bool isEnglish;
  final void Function(bool value) onSwitchLanguage;

  const LanguageSwitchWidget({
    super.key,
    required this.onSwitchLanguage,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => onSwitchLanguage(false),
          child: Row(
            children: [
              CustomRadioButtonWidget(isSelected: isEnglish),
              const SizedBox(width: 8),
              Text(
                S.of(context).english,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorSchemes.semiBlack,
                    fontWeight: Constants.fontWeightLight),
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        InkWell(
          onTap: () => onSwitchLanguage(true),
          child: Row(
            children: [
              CustomRadioButtonWidget(isSelected: !isEnglish),
              const SizedBox(width: 8),
              Text(S.of(context).arabic,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorSchemes.semiBlack,
                      fontWeight: Constants.fontWeightLight))
            ],
          ),
        )
      ],
    );
  }
}
