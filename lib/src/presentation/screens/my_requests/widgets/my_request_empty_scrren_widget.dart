import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class MyTeamRequestEmptyScreenWidget extends StatefulWidget {
  const MyTeamRequestEmptyScreenWidget({super.key});

  @override
  State<MyTeamRequestEmptyScreenWidget> createState() =>
      _MyTeamRequestEmptyScreenWidgetState();
}

class _MyTeamRequestEmptyScreenWidgetState
    extends State<MyTeamRequestEmptyScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagePaths.myRequestsEmptyScreen,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).noRequests,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorSchemes.black,
              fontWeight: Constants.fontWeightRegular
                ),
          )
        ],
      ),
    );
  }
}
