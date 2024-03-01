import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';

class ImageBottomSheetWidget extends StatefulWidget {
  final Function() onTapCamera;
  final Function() onTapGallery;

  const ImageBottomSheetWidget({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
  });

  @override
  State<ImageBottomSheetWidget> createState() => _ImageBottomSheetWidgetState();
}

class _ImageBottomSheetWidgetState extends State<ImageBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: widget.onTapCamera,
          child: Row(
            children: [
              SvgPicture.asset(
                ImagePaths.camera,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 10),
              Text(
                S.of(context).camera,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorSchemes.semiBlack,
                    ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(height: 1, color: ColorSchemes.semiBlack),
        const SizedBox(height: 15),
        InkWell(
          onTap: widget.onTapGallery,
          child: Row(
            children: [
              SvgPicture.asset(
                ImagePaths.gallery,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 10),
              Text(
                S.of(context).gallery,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorSchemes.semiBlack,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
