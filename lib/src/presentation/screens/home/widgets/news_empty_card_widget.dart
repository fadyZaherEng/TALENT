import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class NewsEmptyCardWidget extends StatelessWidget {
  const NewsEmptyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color.fromRGBO(23, 43, 77, 0.16),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 11),
        child: Column(
          children: [
            SvgPicture.asset(ImagePaths.newsEmpty),
           const  SizedBox(height: 12),
            Text(
              S.of(context).noNewsYet,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorSchemes.grayText, fontWeight: Constants.fontWeightRegular),
            ),
          ],
        ),
      ),
    );
  }
}
