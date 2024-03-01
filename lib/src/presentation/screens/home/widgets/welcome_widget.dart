import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';

class WelcomeWidget extends StatelessWidget {
  final String userName;

  const WelcomeWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          Row(
            children: [
              Text(S.of(context).welcomeBack,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: ColorSchemes.grayText)),
              Text(" $userName!",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorSchemes.black,
                      )),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
