import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/src/presentation/screens/business_trip/widgets/business_trip_steps_widget.dart';

class MyTeamAttendanceSkeletonWidget extends StatelessWidget {
  const MyTeamAttendanceSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 10,
        separatorBuilder: (context, index) => Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomPaint(
                painter: DottedLineMyTeamAttendance(),
                child: Container(),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          borderRadius: BorderRadius.circular(10),
                          width: 40,
                          height: 40),
                    ),
                    const SizedBox(width: 10),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          borderRadius: BorderRadius.circular(15),
                          width: 25,
                          height: 25),
                    ),
                    const SizedBox(width: 5),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          borderRadius: BorderRadius.circular(2),
                          width: 60,
                          height: 15),
                    ),
                  ]),
                ],
              )),
              Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        borderRadius: BorderRadius.circular(15),
                        width: 25,
                        height: 25),
                  ),
                  const SizedBox(width: 5),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        borderRadius: BorderRadius.circular(2),
                        width: 60,
                        height: 15),
                  ),
                  const Expanded(child: SizedBox()),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        borderRadius: BorderRadius.circular(2),
                        width: 60,
                        height: 15),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
