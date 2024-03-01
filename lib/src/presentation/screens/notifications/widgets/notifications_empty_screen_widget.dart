import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class NotificationsEmptyScreenWidget extends StatelessWidget {
  const NotificationsEmptyScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagePaths.notificationsEmpty,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).emptyNotification,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorSchemes.black,
                fontWeight: Constants.fontWeightRegular),
          )
        ],
      ),
    );
  }
}
