import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/status_color.dart';
import 'package:talent_link/src/domain/entities/home/home.dart';
import 'package:talent_link/src/domain/entities/home/last_attendance.dart';
import 'package:talent_link/src/domain/entities/home/last_requests.dart';
import 'package:talent_link/src/domain/entities/last_update/last_update.dart';
import 'package:talent_link/src/domain/entities/vacation/vacation.dart';
import 'package:talent_link/src/presentation/widgets/vacation_card_widget.dart';
import 'last_update_item.dart';

class LastUpdateWidget extends StatefulWidget {
  final Home home;
  final void Function(LastUpdate lastUpdate) onTapSeeMore;
  final void Function(LastRequests lastRequests) onTapRequestCard;
  final bool isEnglishLanguage;

  const LastUpdateWidget({
    super.key,
    required this.onTapSeeMore,
    required this.home,
    required this.onTapRequestCard,
    required this.isEnglishLanguage,
  });

  @override
  State<LastUpdateWidget> createState() => _LastUpdateWidgetState();
}

class _LastUpdateWidgetState extends State<LastUpdateWidget> {
  Color borderWithTitleColor = ColorSchemes.gray;
  final List<LastUpdate> _lastUpdate = [
    LastUpdate(
      id: 0,
      isSelected: true,
      text: S.current.attendance,
    ),
    LastUpdate(
      id: 1,
      text: S.current.requests,
    ),
    LastUpdate(
      id: 2,
      text: S.current.vacation,
    ),
  ];
  LastUpdate _lastUpdateSelected =
      LastUpdate(id: 0, text: S.current.attendance);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                S.of(context).lastUpdates,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorSchemes.black,
                      fontWeight: Constants.fontWeightSemiBold,
                    ),
              )),
              InkWell(
                onTap: () => widget.onTapSeeMore(_lastUpdateSelected),
                child: Row(
                  children: [
                    Text(S.of(context).seeMore,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorSchemes.redError,
                                  fontWeight: Constants.fontWeightSemiBold,
                                )),
                    SvgPicture.asset(
                      ImagePaths.rightArrow,
                      matchTextDirection: true,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                LastUpdateItem(
                  text: _lastUpdate[0].text,
                  isSelected: _lastUpdate[0].isSelected,
                  onTap: () {
                    _checkButtonIsSelected(_lastUpdate[0].id);
                  },
                  id: _lastUpdate[0].id,
                ),
                LastUpdateItem(
                  text: _lastUpdate[1].text,
                  isSelected: _lastUpdate[1].isSelected,
                  onTap: () {
                    _checkButtonIsSelected(_lastUpdate[1].id);
                  },
                  id: _lastUpdate[1].id,
                ),
                LastUpdateItem(
                  text: _lastUpdate[2].text,
                  isSelected: _lastUpdate[2].isSelected,
                  onTap: () {
                    _checkButtonIsSelected(_lastUpdate[2].id);
                  },
                  id: _lastUpdate[2].id,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(height: 80, child: buildLastUpdate(_lastUpdateSelected.id)),
          const SizedBox(height: 46),
        ],
      ),
    );
  }

  void _checkButtonIsSelected(int id) {
    setState(() {
      for (var element in _lastUpdate) {
        if (id == element.id) {
          element.isSelected = true;
          _lastUpdateSelected = element;
          borderWithTitleColor = ColorSchemes.redError;
        } else {
          element.isSelected = false;
          borderWithTitleColor = ColorSchemes.gray;
        }
      }
    });
  }

  Widget buildLastUpdate(int id) {
    if (id == 0) {
      return widget.home.lastUpdateRequests!.lastAttendance!.statusId != 0
          ? VacationCardWidget(
            vacation: Vacation(
                title:
                    widget.home.lastUpdateRequests!.lastAttendance!.status,
                id: widget
                    .home.lastUpdateRequests!.lastAttendance!.statusId,
                status:
                    widget.home.lastUpdateRequests!.lastAttendance!.status,
                date: widget.home.lastUpdateRequests!.lastAttendance!
                    .attendanceDate,
                statusColor: ColorSchemes.redError,
                iconPath: ImagePaths.alarm),
            isEnglishLanguage: widget.isEnglishLanguage,
          )
          : _emptyCard(S.of(context).noProblemFound);
    } else if (id == 1) {
      return widget.home.lastUpdateRequests!.lastRequests!.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.home.lastUpdateRequests!.lastRequests!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => widget.onTapRequestCard(
                        widget.home.lastUpdateRequests!.lastRequests![index]),
                    child: VacationCardWidget(
                      vacation: Vacation(
                          title: widget.home.lastUpdateRequests!
                              .lastRequests![index].referenceName,
                          id: widget.home.lastUpdateRequests!
                              .lastRequests![index].referenceId,
                          status: widget.home.lastUpdateRequests!
                              .lastRequests![index].transactionStatusName,
                          date: widget.home.lastUpdateRequests!
                              .lastRequests![index].createdAt,
                          statusColor: statusColor(widget
                              .home
                              .lastUpdateRequests!
                              .lastRequests![index]
                              .transactionStatusId),
                          iconPath: ImagePaths.request),
                      isEnglishLanguage: widget.isEnglishLanguage,
                    ),
                  ),
                );
              })
          : _emptyCard(S.of(context).noRequestsFound);
    } else if (id == 2) {
      return widget.home.lastUpdateRequests!.lastVacation!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      widget.home.lastUpdateRequests!.lastVacation!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => widget.onTapRequestCard(
                          widget.home.lastUpdateRequests!.lastVacation![index]),
                      child: VacationCardWidget(
                        vacation: Vacation(
                            title: widget.home.lastUpdateRequests!
                                .lastVacation![index].referenceName,
                            id: widget.home.lastUpdateRequests!
                                .lastVacation![index].referenceId,
                            status: widget.home.lastUpdateRequests!
                                .lastVacation![index].transactionStatusName,
                            date: widget.home.lastUpdateRequests!
                                .lastVacation![index].createdAt,
                            statusColor: statusColor(widget
                                .home
                                .lastUpdateRequests!
                                .lastVacation![index]
                                .transactionStatusId),
                            iconPath: ImagePaths.sparkles),
                        isEnglishLanguage: widget.isEnglishLanguage,
                      ),
                    );
                  }))
          : _emptyCard(S.of(context).noRequestsFound);
    } else {
      return Container();
    }
  }

  Widget _emptyCard(text) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorSchemes.lightGray,
      ),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: ColorSchemes.black),
      )),
    );
  }
}
