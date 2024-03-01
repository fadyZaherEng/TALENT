import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class HomeSkeletonWidget extends StatelessWidget {
  const HomeSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).home,
          isHaveBackButton: false,
          onBackButtonPressed: () {},
          actionWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: InkWell(
              onTap: () {},
              child: badge.Badge(
                  badgeContent: SizedBox(
                    child: Center(
                      child: Text(
                        "0",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ColorSchemes.white,
                            fontWeight: Constants.fontWeightSemiBold),
                      ),
                    ),
                  ),
                  badgeAnimation: const badge.BadgeAnimation.scale(
                      animationDuration: Duration(milliseconds: 0)),
                  badgeStyle: const badge.BadgeStyle(
                    badgeColor: ColorSchemes.yellow,
                    padding: EdgeInsets.all(2),
                  ),
                  position: badge.BadgePosition.topEnd(top: -6, end: 12),
                  child: SvgPicture.asset(
                    ImagePaths.notification,
                    fit: BoxFit.scaleDown,
                  )),
            ),
          )),
      body: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(22),
            child: SkeletonLine(
                style: SkeletonLineStyle(
                    width: 200,
                    height: 25,
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 140,
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 140,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: SkeletonLine(
          //       style: SkeletonLineStyle(
          //           height: 30,
          //           width: double.infinity,
          //           borderRadius: BorderRadius.circular(10))),
          // ),
          const SizedBox(height: 35),
          Container(
            color: ColorSchemes.lightGray,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 20,
                                  width: 150,
                                  borderRadius: BorderRadius.circular(10)))),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Expanded(
                        child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 100,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(90)))),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 100,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(90)))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 20,
                                width: 150,
                                borderRadius: BorderRadius.circular(10)))),
                    SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 20,
                            width: 150,
                            borderRadius: BorderRadius.circular(10)))
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 40,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 40,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 40,
                              borderRadius: BorderRadius.circular(5))),
                    )
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 70,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: ColorSchemes.lightGray,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 20,
                                  width: 150,
                                  borderRadius: BorderRadius.circular(10)))),
                      SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 20,
                              width: 150,
                              borderRadius: BorderRadius.circular(10)))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 162,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          itemExtent: 110,
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: SkeletonLine(
                                    style: SkeletonLineStyle(
                                        height: 140,
                                        width: 140,
                                        borderRadius:
                                            BorderRadius.circular(10))));
                          })),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ]))
      ]),
    );
  }
}
