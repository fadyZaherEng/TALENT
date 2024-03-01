import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gms_check/gms_check.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/HMS_notification_services.dart';
import 'package:talent_link/src/core/utils/firebase_notification_services.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/notifications/services_notification_data.dart';
import 'package:talent_link/src/presentation/screens/home/home_screen.dart';
import 'package:talent_link/src/presentation/screens/more/more_screen.dart';
import 'package:talent_link/src/presentation/screens/payslip/payslip_screen.dart';
import 'package:talent_link/src/presentation/screens/profile/profile_screen.dart';
import 'package:talent_link/src/presentation/screens/request_screen/request_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  final int index;

  const BottomNavigationBarScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _notificationListener();
    _selectedIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(onTapSeeMoreQuickAccess: (int index) => _onItemTapped(index)),
      const ProfileScreen(),
      const RequestScreen(),
      const PayslipScreen(),
      const MoreScreen(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorSchemes.gray,
              blurRadius: 20,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: WillPopScope(
          onWillPop: () {
            _onWillPop();
            return Future.value(true);
          },
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.homeUnSelected),
                ),
                label: S.of(context).home,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.homeSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.profileUnSelected),
                ),
                label: S.of(context).profile,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.profileSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.requestUnSelected),
                ),
                label: S.of(context).request,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.requestSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.payslipUnSelected),
                ),
                label: S.of(context).payslip,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.payslipSelected),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.moreUnSelected),
                ),
                label: S.of(context).more,
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(ImagePaths.moreSelected),
                ),
              )
            ],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: ColorSchemes.redError,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            unselectedItemColor: ColorSchemes.gray,
            backgroundColor: ColorSchemes.white,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorSchemes.redError),
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ColorSchemes.primary),
            onTap: (index) => setState(() => _onItemTapped(index)),
          ),
        ),
      ),
    );
  }

  void _notificationListener() async {
    bool isHaveGms = await GmsCheck().checkGmsAvailability() ?? true;
    if (isHaveGms) {
      FirebaseNotificationService.onNotificationClick?.stream
          .listen(_onNotificationClick);
    } else {
      HMSNotificationServices.onNotificationClick?.stream
          .listen(_onNotificationClick);
    }
  }

  void _onNotificationClick(String? notificationData) {
    ServerNotificationData serverNotificationData =
        mapNotification(notificationData);
    if (serverNotificationData.viewId == "0") {
      showMassageDialogWidget(
          onTap: () => Navigator.pop(context),
          context: context,
          text: serverNotificationData.message,
          icon: '',
          buttonText: S.of(context).ok);
    } else {
      _navigateToRequestDetailScreen(serverNotificationData);
    }
  }

  ServerNotificationData mapNotification(String? notificationData) {
    Map<String, dynamic> mapDate = json.decode(notificationData!);
    ServerNotificationData model = ServerNotificationData.fromJson(mapDate);
    return model;
  }

  Future<void> _navigateToRequestDetailScreen(
      ServerNotificationData firebaseNotificationData) async {
    if (firebaseNotificationData.requestTypeId == "1") {
      await Navigator.pushNamed(context, Routes.leaveDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "5") {
      await Navigator.pushNamed(context, Routes.halfDayLeaveDetails,
          arguments: {
            "transactionId": int.parse(firebaseNotificationData.transactionId),
            "referenceId": int.parse(firebaseNotificationData.requestTypeId),
            "isFromMyRequest": false,
          });
    } else if (firebaseNotificationData.requestTypeId == "6") {
      await Navigator.pushNamed(context, Routes.loanDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "9") {
      await Navigator.pushNamed(context, Routes.otherRequestDetails,
          arguments: {
            "transactionId": int.parse(firebaseNotificationData.transactionId),
            "referenceId": int.parse(firebaseNotificationData.requestTypeId),
            "isFromMyRequest": false,
          });
    } else if (firebaseNotificationData.requestTypeId == "12") {
      await Navigator.pushNamed(context, Routes.leaveEncashmentDetails,
          arguments: {
            "transactionId": int.parse(firebaseNotificationData.transactionId),
            "referenceId": int.parse(firebaseNotificationData.requestTypeId),
            "isFromMyRequest": false,
          });
    } else if (firebaseNotificationData.requestTypeId == "19") {
      await Navigator.pushNamed(context, Routes.resumeDutyDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "22") {
      await Navigator.pushNamed(context, Routes.airTicketDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "25") {
      await Navigator.pushNamed(context, Routes.indemnityEncashmentDetails,
          arguments: {
            "transactionId": int.parse(firebaseNotificationData.transactionId),
            "referenceId": int.parse(firebaseNotificationData.requestTypeId),
            "isFromMyRequest": false,
          });
    } else if (firebaseNotificationData.requestTypeId == "3") {
      await Navigator.pushNamed(context, Routes.shortLeaveDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "1013") {
      await Navigator.pushNamed(context, Routes.educationDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "1011") {
      await Navigator.pushNamed(context, Routes.attachmentDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "1012") {
      await Navigator.pushNamed(context, Routes.assetDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "1009") {
      await Navigator.pushNamed(context, Routes.addressDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    } else if (firebaseNotificationData.requestTypeId == "1010") {
      await Navigator.pushNamed(context, Routes.contactDetails, arguments: {
        "transactionId": int.parse(firebaseNotificationData.transactionId),
        "referenceId": int.parse(firebaseNotificationData.requestTypeId),
        "isFromMyRequest": false,
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWillPop() {
    showActionDialogWidget(
        context: context,
        text: S.of(context).areYouSureYouWantToExitTheApp,
        icon: ImagePaths.profile,
        primaryText: S.of(context).no,
        secondaryText: S.of(context).yes,
        primaryAction: () {
          Navigator.pop(context);
        },
        secondaryAction: () {
          exit(0);
        });
  }
}
