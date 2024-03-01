import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/core/resources/image_paths.dart';

class MyTeamRequestsImageWidget extends StatelessWidget {
  final String imageUrl;

  const MyTeamRequestsImageWidget({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? SizedBox(
            width: 32,
            height: 32,
            child: ClipOval(
              child: Image.network(
                width: 32,
                height: 32,
                imageUrl,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) =>
                    SvgPicture.asset(ImagePaths.profile, fit: BoxFit.scaleDown),
              ),
            ),
          )
        : SvgPicture.asset(ImagePaths.profile, fit: BoxFit.scaleDown);
  }
}
