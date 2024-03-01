import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/home/home.dart';
import 'package:talent_link/src/domain/entities/home/last_requests.dart';
import 'package:talent_link/src/domain/entities/last_update/last_update.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/check_in_out_widget.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/last_update_widget.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/quick_requests_widget.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/vacation_balance_card_widget.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/welcome_widget.dart';

class HomeContentWidget extends StatelessWidget {
  final Home home;
  final String remainingHours;
  final double percent;
  final String todayDays;
  final bool isEnglish;
  final List<Request> requests;
  final double percentageOfToday;
  final double percentageOfYear;
  final String endOfTheYearDays;
  final Function() checkInEvent;
  final Function() checkOutEvent;
  final Function() onTapSeeMoreQuickAccess;
  final Function() onTapSeeMoreVacationBalance;
  final void Function(Request request) onTapRequest;
  final void Function(LastUpdate lastUpdate) onTapLastUpdate;
  final void Function(LastRequests lastRequests) onTapRequestCard;
  final void Function(LastUpdate lastUpdate) onTapSeeMoreLastUpdates;

  const HomeContentWidget({
    super.key,
    required this.checkInEvent,
    required this.checkOutEvent,
    required this.home,
    required this.remainingHours,
    required this.percent,
    required this.onTapSeeMoreVacationBalance,
    required this.endOfTheYearDays,
    required this.todayDays,
    required this.onTapSeeMoreLastUpdates,
    required this.onTapSeeMoreQuickAccess,
    required this.onTapRequest,
    required this.onTapLastUpdate,
    required this.isEnglish,
    required this.requests,
    required this.percentageOfToday,
    required this.percentageOfYear,
    required this.onTapRequestCard,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          WelcomeWidget(userName: home.userName),
          CheckInOutWidget(
            checkInEvent: checkInEvent,
            checkOutEvent: checkOutEvent,
            home: home,
          ),
          // RemainingProgressWidget(
          //   remainingProgress: RemainingProgress(
          //     remainingHours: remainingHours,
          //     percent: percent,
          //     isPlusTime: home.homeData!.isPlusTime,
          //   ),
          //   isRTL: isEnglish,
          // ),
          VacationBalanceCardWidget(
            endOfTheYearDays: endOfTheYearDays,
            todayDays: todayDays,
            onTapSeeMore: onTapSeeMoreVacationBalance,
            isEnglish: isEnglish,
            percentageOfToday: percentageOfToday,
            percentageOfYear: percentageOfYear,
          ),
          home.lastUpdateRequests != null
              ? LastUpdateWidget(
                  onTapSeeMore: (LastUpdate lastUpdate) =>
                      onTapSeeMoreLastUpdates(lastUpdate),
                  home: home,
                  onTapRequestCard: (LastRequests lastRequests) =>
                      onTapRequestCard(lastRequests),
                  isEnglishLanguage: isEnglish,
                )
              : Container(),
          requests.isNotEmpty
              ? QuickRequestsWidget(
                  requests: requests,
                  onTapSeeMore: onTapSeeMoreQuickAccess,
                  onTapRequest: (Request request) => onTapRequest(request),
                )
              : const SizedBox.shrink(),
        ]),
      )
    ]);
  }
}
