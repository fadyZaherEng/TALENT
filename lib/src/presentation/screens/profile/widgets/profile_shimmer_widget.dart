import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class ProfileShimmerWidget extends StatefulWidget {
  const ProfileShimmerWidget({super.key});

  @override
  State<ProfileShimmerWidget> createState() => _ProfileShimmerWidgetState();
}

class _ProfileShimmerWidgetState extends State<ProfileShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          _imageProfileShimmer(),
          const SizedBox(
            height: 20,
          ),
          _basicProfileShimmer(),
          _positionProfileShimmer(),
          _salaryProfileShimmer(),
        ],
      ),
    );
  }

  Widget _getProfileItemContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SkeletonLine(
          style: SkeletonLineStyle(
              width: MediaQuery.sizeOf(context).width * 0.20,
              height: 15,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
        ),
        SkeletonLine(
          style: SkeletonLineStyle(
              height: 15,
              width: MediaQuery.sizeOf(context).width * 0.50,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
        ),
      ],
    );
  }

  Widget _imageProfileShimmer() {
    return const Center(
      child: SizedBox(
        width: 100,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: SkeletonLine(
                style: SkeletonLineStyle(
                    width: 72,
                    height: 72,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SkeletonLine(
                style: SkeletonLineStyle(
                    width: 40,
                    height: 28,
                    alignment: AlignmentDirectional.centerEnd,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _basicProfileShimmer() {
    return Center(
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7),
          color: ColorSchemes.white,
          boxShadow: [
            BoxShadow(
              color: ColorSchemes.gray.withOpacity(0.13),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Column(
            children: [
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _positionProfileShimmer() {
    return Center(
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7),
          color: ColorSchemes.white,
          boxShadow: [
            BoxShadow(
              color: ColorSchemes.gray.withOpacity(0.13),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Column(
            children: [
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _salaryProfileShimmer() {
    return Center(
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7),
          color: ColorSchemes.white,
          boxShadow: [
            BoxShadow(
              color: ColorSchemes.gray.withOpacity(0.13),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Column(
            children: [
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
              const SizedBox(
                height: 20,
              ),
              _getProfileItemContent(),
            ],
          ),
        ),
      ),
    );
  }
}
