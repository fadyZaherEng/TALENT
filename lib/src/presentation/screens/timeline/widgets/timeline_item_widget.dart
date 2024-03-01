import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/status_color.dart';
import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';

class TimelineItemWidget extends StatelessWidget {
  final GetTimeLine timeLine;

  const TimelineItemWidget({
    super.key,
    required this.timeLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    SvgPicture.asset(ImagePaths.timelineTime),
                    const SizedBox(width: 15),
                    Text(timeLine.date,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorSchemes.black,
                                )),
                    const SizedBox(width: 5),
                    Text(timeLine.time,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorSchemes.black,
                                )),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: statusColor(timeLine.workflowStatusId)
                                    .withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                timeLine.workflowStatusName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: statusColor(
                                                timeLine.workflowStatusId)
                                            .withOpacity(0.9),
                                        fontWeight:
                                            Constants.fontWeightRegular),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
                          child: Text(
                            S.of(context).currentStep,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.gray,
                                    fontWeight: Constants.fontWeightLight),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            timeLine.levelName,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.black,
                                    fontWeight: Constants.fontWeightRegular),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).actionBy,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.gray,
                                    fontWeight: Constants.fontWeightLight),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              timeLine.actionUserName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorSchemes.black,
                                      fontWeight: Constants.fontWeightRegular),
                            )),
                      ]),
                  const SizedBox(height: 10),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).users,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: ColorSchemes.gray,
                                    fontWeight: Constants.fontWeightLight),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              _formatUsers(timeLine.usersName),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorSchemes.black,
                                      fontWeight: Constants.fontWeightRegular),
                            )),
                      ]),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Expanded(
                      child: Text(
                        S.of(context).remarks,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.gray,
                            fontWeight: Constants.fontWeightLight),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        timeLine.remarks,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.black,
                            fontWeight: Constants.fontWeightRegular),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }

  String _formatUsers(List<String> users) {
    List<String> result = users.asMap().entries.map((entry) {
      String name = entry.value;
      bool isLast = entry.key == users.length - 1;
      List<String> parts = name.split(" ");
      return isLast ? parts.first : "${parts.first},";
    }).toList();

    return result.join(" ");
  }
}
