import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class MoreLogoutItem extends StatelessWidget {
  final Function() onTapLogout;

  const MoreLogoutItem({super.key, required this.onTapLogout});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapLogout,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(S.of(context).logout,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorSchemes.primary  , fontWeight: Constants.fontWeightLight)),
            const SizedBox(width: 6),
            SvgPicture.asset(ImagePaths.logout, fit: BoxFit.scaleDown,matchTextDirection: true),
          ],
        ),
      ),
    );
  }
}
