import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class MyRequestsSkeletonWidget extends StatelessWidget {
  const MyRequestsSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).myRequests,
          isHaveBackButton: true,
          onBackButtonPressed: () {},
          actionWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              ImagePaths.filter,
              fit: BoxFit.scaleDown,
            ),
          )),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Container(
                  decoration: BoxDecoration(
                      color: ColorSchemes.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 2),
                          blurRadius: 24,
                          spreadRadius: 0,
                          color: Color.fromRGBO(23, 43, 77, 0.16),
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SkeletonLine(
                              style: SkeletonLineStyle(width: 80, height: 15),
                            ),
                            SkeletonLine(
                              style: SkeletonLineStyle(width: 80, height: 15),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SkeletonLine(
                                  style:
                                      SkeletonLineStyle(width: 20, height: 20),
                                ),
                                SizedBox(width: 4),
                                SkeletonLine(
                                  style:
                                      SkeletonLineStyle(width: 80, height: 15),
                                )
                              ],
                            ),
                            SkeletonLine(
                              style: SkeletonLineStyle(width: 100, height: 25),
                            ),
                          ],
                        ),
                        SizedBox(height: 17),
                        Row(
                          children: [
                            Expanded(
                                child: SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 40,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                            )),
                            SizedBox(width: 20),
                            Expanded(
                                child: SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 40,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                            ))
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
