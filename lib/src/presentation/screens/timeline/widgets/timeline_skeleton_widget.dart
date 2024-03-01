import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class TimelineSkeletonWidget extends StatelessWidget {
  const TimelineSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).timeline,
          isHaveBackButton: true,
          onBackButtonPressed: () {}),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: ColorSchemes.white,
                        borderRadius: BorderRadius.circular(8),
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
                        Container(
                          decoration: BoxDecoration(
                              color: ColorSchemes.border.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 30,
                                      width: 30,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                const SizedBox(width: 15),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 20,
                                      width: 120,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 30,
                                            width: 80,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 80,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 120,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 15),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 80,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 120,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 15),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 80,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 120,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 15),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 80,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 17,
                                            width: 120,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 16),
              ],
            );
          }),
    );
  }
}
