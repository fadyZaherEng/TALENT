import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';
import 'package:talent_link/src/presentation/screens/timeline/widgets/timeline_empty_screen_widget.dart';
import 'package:talent_link/src/presentation/screens/timeline/widgets/timeline_item_widget.dart';

class TimelineContentWidget extends StatelessWidget {
  final List<GetTimeLine> timelines;

  const TimelineContentWidget({
    super.key,
    required this.timelines,
  });

  @override
  Widget build(BuildContext context) {
    return timelines.isNotEmpty
        ? ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: timelines.length,
            itemBuilder: (BuildContext context, int index) {
              return TimelineItemWidget(
                timeLine: timelines[index],
              );
            })
        : const TimelineEmptyScreenWidget();
  }
}
