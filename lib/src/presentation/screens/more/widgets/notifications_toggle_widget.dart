import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/presentation/widgets/custom_radio_button_widget.dart';

class NotificationsToggleWidget extends StatelessWidget {
  final bool isNotificationsOn;
  final void Function(bool value) onToggleNotifications;

  const NotificationsToggleWidget({
    super.key,
    required this.isNotificationsOn,
    required this.onToggleNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => onToggleNotifications(true),
          child: Row(
            children: [
              CustomRadioButtonWidget(isSelected: isNotificationsOn),
              const SizedBox(width: 8),
              Text(
                S.of(context).on,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorSchemes.semiBlack,
                    fontWeight: Constants.fontWeightLight),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        InkWell(
          onTap: () => onToggleNotifications(false),
          child: Row(
            children: [
              CustomRadioButtonWidget(isSelected: !isNotificationsOn),
              const SizedBox(width: 8),
              Text(S.of(context).off,
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
