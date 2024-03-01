import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class NotificationsSkeletonWidget extends StatefulWidget {
  const NotificationsSkeletonWidget({
    super.key,
  });

  @override
  State<NotificationsSkeletonWidget> createState() =>
      _NotificationsSkeletonWidgetState();
}

class _NotificationsSkeletonWidgetState
    extends State<NotificationsSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).notifications,
          isHaveBackButton: true,
          onBackButtonPressed: () {}),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(width: 80, height: 20),
                          ),
                          Expanded(child: SizedBox()),
                          SkeletonLine(
                            style: SkeletonLineStyle(width: 70, height: 20),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      const SizedBox(height: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonLine(
                            style: SkeletonLineStyle(width: 100, height: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(width: 250, height: 50),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
