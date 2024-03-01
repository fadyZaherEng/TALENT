// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';

class ProfileImageWidget extends StatelessWidget {
  void Function() onCameraPressed;
  String? profileImage;
  String imageUrl;

  ProfileImageWidget({
    super.key,
    required this.onCameraPressed,
    required this.profileImage,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  width: 72,
                  height: 72,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: ColorSchemes.white,
                  ),
                  child: profileImage != null && profileImage != ""
                      ? Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            profileImage!,
                          ),
                          errorBuilder: (context, child, loadingProgress) =>
                              SvgPicture.asset(
                            ImagePaths.profilePlaceHolderImage,
                            fit: BoxFit.fill,
                          ),
                          loadingBuilder: (context, child, loadingProgress) =>
                              child,
                        )
                      : Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            imageUrl,
                          ),
                          errorBuilder: (context, child, loadingProgress) =>
                              SvgPicture.asset(
                            ImagePaths.profilePlaceHolderImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                )),
            InkWell(
              onTap: onCameraPressed,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  width: 40,
                  height: 28,
                  decoration: BoxDecoration(
                    color: ColorSchemes.redCamera,
                    borderRadius: BorderRadiusDirectional.circular(8),
                  ),
                  child: SvgPicture.asset(
                    ImagePaths.cameraProfile,
                    width: 18,
                    height: 18,
                    color: ColorSchemes.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
