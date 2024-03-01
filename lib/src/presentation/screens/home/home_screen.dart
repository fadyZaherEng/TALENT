// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/permission_service_handler.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/home/last_requests.dart';
import 'package:talent_link/src/domain/entities/last_update/last_update.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/presentation/blocs/home/home_bloc.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/home_content_widget.dart';
import 'package:talent_link/src/presentation/screens/home/widgets/home_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import '../../../domain/entities/home/home.dart';

class HomeScreen extends BaseStatefulWidget {
  final void Function(int index) onTapSeeMoreQuickAccess;

  const HomeScreen({super.key, required this.onTapSeeMoreQuickAccess});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  Home home = Home();
  bool clicked = true;

  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);
  bool _isEnglish = true;
  List<Request> _requests = [];

  @override
  void initState() {
    _bloc.add(GetHomeDataEvent());
    _bloc.add(GetGrossSalaryAndCurrencyEvent());
    _bloc.add(HomeGetEssPermissionEvent());
    _bloc.add(HomeGetRequestsEvent());
    _bloc.add(HomeGetLanguageEvent());
    _getLastRequestsEvent();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeShowLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is HomeGetNewsListSuccessState) {
          home = state.home;
        } else if (state is HomeUpdateScreenState) {
          home = state.home;
          clicked = true;
        } else if (state is HomeEmployeeAlreadyCheckedIn) {
          clicked = true;
          _showErrorMessage(state.message);
        } else if (state is HomeEmployeeAlreadyCheckedOut) {
          clicked = true;
          _showErrorMessage(state.message);
        } else if (state is HomeEmployeeNotCheckedInState) {
          clicked = true;
          _showErrorMessage(state.message);
        } else if (state is HomeNavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        } else if (state is HomeShowMassageDialogResponseState) {
          _showResponseMassageDialog(context, state.massage);
        } else if (state is HomeFailedToGetCurrentLocationState) {
          _showResponseMassageDialog(
            context,
            S.current.failedToGetCurrentLocation,
          );
        } else if (state is HomeDialogPopState) {
          _pop();
        } else if (state is HomeNavigateToAttendanceHistoryScreenState) {
          Navigator.pushNamed(context, Routes.attendanceHistory);
        } else if (state is HomeGetLanguageState) {
          _isEnglish = state.isEnglish;
        } else if (state is GetRequestsSuccessState) {
          _requests = state.requests;
        } else if (state is NavigateToLeaveScreenState) {
          Navigator.pushNamed(context, Routes.leave)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToShortLeaveScreenState) {
          Navigator.pushNamed(context, Routes.shortLeave)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToLeaveEncashmentScreenState) {
          Navigator.pushNamed(context, Routes.leaveEncashment)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToLoanScreenState) {
          Navigator.pushNamed(context, Routes.loans)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToIndemnityScreenState) {
          Navigator.pushNamed(context, Routes.indemnityEncashment)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToAirTicketScreenState) {
          Navigator.pushNamed(context, Routes.airTicket)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToHalfDayLeaveScreenState) {
          Navigator.pushNamed(context, Routes.halfDayLeave)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToResumeDutyScreenState) {
          Navigator.pushNamed(context, Routes.resumeDuty)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToBusinessTripScreenState) {
          Navigator.pushNamed(context, Routes.businessTrip)
              .then((value) => _getLastRequestsEvent());
        } else if (state is NavigateToOtherRequestScreenState) {
          Navigator.pushNamed(context, Routes.otherRequest)
              .then((value) => _getLastRequestsEvent());
        } else if (state is GetLastRequestsForDashboardSuccessState) {
          home.lastUpdateRequests = state.lastUpdateRequests;
        } else if (state is HomeNavigateToLeaveDetailsScreenState) {
          Navigator.pushNamed(context, Routes.leaveDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        } else if (state is HomeNavigateToHalfDayLeaveDetailsScreenState) {
          Navigator.pushNamed(context, Routes.halfDayLeaveDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        } else if (state is HomeNavigateToLoanDetailsScreenState) {
          Navigator.pushNamed(context, Routes.loanDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        } else if (state is HomeNavigateToOtherRequestDetailsScreenState) {
          Navigator.pushNamed(context, Routes.otherRequestDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        } else if (state is HomeNavigateToLeaveEncashmentDetailsScreenState) {
          Navigator.pushNamed(context, Routes.leaveEncashmentDetails,
              arguments: {
                "transactionId": state.lastRequests.transactionId,
                "referenceId": state.lastRequests.referenceId,
                "isFromMyRequest": true,
              });
        } else if (state is HomeNavigateToResumeDutyDetailsScreenState) {
          Navigator.pushNamed(context, Routes.resumeDutyDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        } else if (state is HomeNavigateToAirTicketDetailsScreenState) {
          Navigator.pushNamed(context, Routes.airTicketDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        } else if (state
            is HomeNavigateToIndemnityEncashmentDetailsScreenState) {
          Navigator.pushNamed(context, Routes.indemnityEncashmentDetails,
              arguments: {
                "transactionId": state.lastRequests.transactionId,
                "referenceId": state.lastRequests.referenceId,
                "isFromMyRequest": true,
              });
        } else if (state is HomeNavigateToShortLeaveDetailsScreenState) {
          Navigator.pushNamed(context, Routes.shortLeaveDetails, arguments: {
            "transactionId": state.lastRequests.transactionId,
            "referenceId": state.lastRequests.referenceId,
            "isFromMyRequest": true,
          });
        }
      },
      builder: (context, state) {
        return home.homeData != null
            ? Scaffold(
                appBar: buildAppBarWidget(context,
                    title: S.of(context).home,
                    isHaveBackButton: false,
                    onBackButtonPressed: () {},
                    actionWidget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: InkWell(
                        onTap: () {
                          _bloc.add(HomeNavigateToNotificationScreenEvent());
                        },
                        child: badge.Badge(
                            badgeContent: SizedBox(
                              child: Center(
                                child: Text(
                                  home.homeData?.notificationCount ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          color: ColorSchemes.white,
                                          fontWeight:
                                              Constants.fontWeightSemiBold),
                                ),
                              ),
                            ),
                            badgeAnimation: const badge.BadgeAnimation.scale(
                                animationDuration: Duration(milliseconds: 0)),
                            badgeStyle: const badge.BadgeStyle(
                              badgeColor: ColorSchemes.yellow,
                              padding: EdgeInsets.all(2),
                            ),
                            position:
                                badge.BadgePosition.topEnd(top: -6, end: 12),
                            child: SvgPicture.asset(
                              ImagePaths.notification,
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                    )),
                body: HomeContentWidget(
                  remainingHours: home.homeData!.remainingTime.toString(),
                  percent: home.homeData!.remainingWorkHoursProgress,
                  isEnglish: _isEnglish,
                  endOfTheYearDays:
                      home.homeData!.remainingCurrentBalance.toString(),
                  todayDays: home.homeData!.currentBalance.toString(),
                  home: home,
                  checkInEvent: () => _checkInEvent(),
                  checkOutEvent: () => _checkOutEvent(),
                  onTapSeeMoreVacationBalance: () {},
                  onTapSeeMoreLastUpdates: (LastUpdate lastUpdate) {
                    _seeMoreLastUpdates(lastUpdate);
                  },
                  onTapSeeMoreQuickAccess: () {
                    _navigateToRequestsScreen();
                  },
                  onTapRequest: (Request request) {
                    _bloc.add(NavigateToQuickAccessRequestsDetailsScreen(
                        request: request));
                  },
                  onTapLastUpdate: (LastUpdate lastUpdate) {},
                  requests: _requests,
                  percentageOfToday: _calculatePercentageOfDay(
                      home.homeData!.currentBalance,
                      home.homeData!.remainingYearlyBalance),
                  percentageOfYear: _calculatePercentageOfYear(
                      home.homeData!.remainingCurrentBalance,
                      home.homeData!.remainingYearlyBalance),
                  onTapRequestCard: (LastRequests lastRequests) {
                    _bloc.add(HomeNavigateToLastRequestDetailsEvent(
                        lastRequests: lastRequests));
                  },
                ))
            : const HomeSkeletonWidget();
      },
    );
  }

  void _checkInEvent() async {
    bool currentPermission = await PermissionServiceHandler()
        .handleServicePermission(setting: Permission.location);
    if (currentPermission && clicked) {
      clicked = false;
      _bloc.add(HomeInsertPunchEvent(
        punchType: "in",
        punchTime: DateFormat('HH:mm', "en").format(DateTime.now()),
      ));
    } else if (!currentPermission) {
      await showActionDialogWidget(
          context: context,
          text: S.current.locationDialogTitle,
          icon: ImagePaths.profile,
          primaryText: S.current.yes,
          secondaryText: S.current.no,
          primaryAction: () async {
            _bloc.add(HomeDialogPopEvent());
            openAppSettings();
          },
          secondaryAction: () {
            _bloc.add(HomeDialogPopEvent());
          });
    }
  }

  void _checkOutEvent() async {
    bool currentPermission = await PermissionServiceHandler()
        .handleServicePermission(setting: Permission.location);
    if (currentPermission && clicked) {
      clicked = false;
      _bloc.add(HomeInsertPunchEvent(
        punchType: "out",
        punchTime: DateFormat('HH:mm', "en").format(DateTime.now()),
      ));
    } else if (!currentPermission) {
      await showActionDialogWidget(
          context: context,
          text: S.current.locationDialogTitle,
          icon: ImagePaths.profile,
          primaryText: S.current.yes,
          secondaryText: S.current.no,
          primaryAction: () async {
            _bloc.add(HomeDialogPopEvent());
            openAppSettings();
          },
          secondaryAction: () {
            _bloc.add(HomeDialogPopEvent());
          });
    }
  }

  void _showErrorMessage(String errorMessage) {
    showMassageDialogWidget(
      context: context,
      text: errorMessage,
      icon: ImagePaths.profile,
      buttonText: S.of(context).ok,
      onTap: () {
        _pop();
      },
    );
  }

  _navigateToNotificationScreen() {
    Navigator.pushNamed(context, Routes.notification);
  }

  _pop() {
    Navigator.of(context).pop();
  }

  void _showResponseMassageDialog(BuildContext context, String massage) {
    showMassageDialogWidget(
      context: context,
      text: massage,
      icon: ImagePaths.profile,
      buttonText: S.current.ok,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  void _navigateToRequestsScreen() => widget.onTapSeeMoreQuickAccess(2);

  void _seeMoreLastUpdates(LastUpdate lastUpdate) {
    if (lastUpdate.id == 0) {
      Navigator.pushNamed(context, Routes.attendanceHistory);
    } else {
      Navigator.pushNamed(context, Routes.myRequests);
    }
  }

  double _calculatePercentageOfDay(double number, int total) {
    if (total == 0) {
      return 0.0;
    }
    double result = (number / total) * 100.0;
    return double.parse(result.toStringAsFixed(1));
  }

  double _calculatePercentageOfYear(int number, int total) {
    if (total == 0) {
      return 0.0;
    }
    double result = (number / total) * 100.0;
    return double.parse(result.toStringAsFixed(1));
  }

  void _getLastRequestsEvent() {
    _bloc.add(GetLastRequestsForDashboardEvent());
  }
}
