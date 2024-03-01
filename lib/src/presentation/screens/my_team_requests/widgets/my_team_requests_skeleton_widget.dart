import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class MyTeamRequestsSkeletonWidget extends StatelessWidget {
  const MyTeamRequestsSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).myTeamRequests,
        isHaveBackButton: true,
        onBackButtonPressed: () {},
        actionWidget: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              ImagePaths.filter,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.only(top: 20),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorSchemes.cardHeader,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1, 2),
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Color.fromRGBO(23, 43, 77, 0.16),
                      ),
                    ]),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                      height: 40,
                                      width: 40,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40)))),
                              SizedBox(width: 10),
                              SkeletonLine(
                                style: SkeletonLineStyle(width: 80, height: 20),
                              )
                            ],
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(width: 70, height: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: ColorSchemes.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                            width: 50, height: 15),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                            width: 25, height: 25),
                                      ),
                                      SizedBox(width: 4),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                            width: 80, height: 20),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                height: 2,
                                color: ColorSchemes.lightGray),
                            const Padding(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Expanded(child: SizedBox()),
                                  Expanded(child: SizedBox()),
                                  Expanded(
                                      child: SkeletonLine(
                                    style: SkeletonLineStyle(
                                        height: 40,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
