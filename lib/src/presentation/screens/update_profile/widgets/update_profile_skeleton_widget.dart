import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class UpdateProfileSkeletonWidget extends StatelessWidget {
  const UpdateProfileSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> requests = [
      1,
      2,
      3,
      4,
      5,
    ];
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).updateProfile,
          isHaveBackButton: true,
          onBackButtonPressed: () {}),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        padding: const EdgeInsets.all(16),
        children: requests.map((e) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorSchemes.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Color.fromRGBO(23, 43, 77, 0.16),
                      ),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                width: 44,
                                height: 44,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ],
                      )),
                      SizedBox(height: 16),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 15,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
                    ],
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
