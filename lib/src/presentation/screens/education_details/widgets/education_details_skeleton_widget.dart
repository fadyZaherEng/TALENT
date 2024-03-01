import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class EducationDetailsSkeletonWidget extends StatefulWidget {
  final bool isFromMyRequest;

  const EducationDetailsSkeletonWidget({
    super.key,
    this.isFromMyRequest = false,
  });

  @override
  State<EducationDetailsSkeletonWidget> createState() =>
      _EducationDetailsSkeletonWidgetState();
}

class _EducationDetailsSkeletonWidgetState
    extends State<EducationDetailsSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(
                  vertical: 10, horizontal: 15),
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
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 5, left: 5),
                child: Column(
                  children: [
                    _getEducationDetailsItem(),
                    const SizedBox(height: 20),
                    _getEducationDetailsItem(),
                    const SizedBox(height: 20),
                    _getEducationDetailsItem(),
                    const SizedBox(height: 20),
                    _getEducationDetailsItem(),
                    const SizedBox(height: 20),
                    _getEducationDetailsItem(),
                    const SizedBox(height: 20),
                    _getEducationDetailsItem(),
                    const SizedBox(height: 20),
                    _getEducationDetailsItem(),
                  ],
                ),
              ),
            ),
          ),
          widget.isFromMyRequest
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 48,
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 48,
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }

  Widget _getEducationDetailsItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SkeletonLine(
            style: SkeletonLineStyle(
                width: MediaQuery.sizeOf(context).width * 0.20,
                height: 18,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 18,
                width: MediaQuery.sizeOf(context).width * 0.50,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
          ),
        ),
      ],
    );
  }
}
