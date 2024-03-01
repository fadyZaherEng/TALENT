// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/domain/entities/home/ess_permission_singleton.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/language_switch_widget.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/more_item_widget.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/more_logout_item.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/notifications_toggle_widget.dart';

class MoreItemsWidget extends StatelessWidget {
  final bool isEnglish;
  final bool isNotificationsOn;
  final int userTypeId;
  final Function() onTapUpdateProfile;
  final Function() onTapMyRequests;
  final Function() onTapMyTeamRequests;
  final Function() onTapAttendanceHistory;
  final Function() onTapMyTeamAttendance;
  final Function() onTapTermsConditions;
  final Function() onTapAboutUs;
  final Function() onTapLogout;
  final void Function(bool value) onTapNotifications;
  final void Function(bool value) onSwitchLanguage;

  const MoreItemsWidget({
    super.key,
    required this.onTapUpdateProfile,
    required this.onTapMyRequests,
    required this.onTapMyTeamRequests,
    required this.onTapAttendanceHistory,
    required this.onTapMyTeamAttendance,
    required this.onTapNotifications,
    required this.onSwitchLanguage,
    required this.onTapTermsConditions,
    required this.onTapAboutUs,
    required this.onTapLogout,
    required this.isNotificationsOn,
    required this.isEnglish,
    required this.userTypeId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 14),
              MoreItemWidget(
                  image: ImagePaths.updateProfile,
                  text: S.of(context).updateProfile,
                  onTap: onTapUpdateProfile),
              MoreItemWidget(
                  image: ImagePaths.myRequests,
                  text: S.of(context).myRequests,
                  onTap: onTapMyRequests),
              checkIfUserHasAccess(1043)
                  ? MoreItemWidget(
                      image: ImagePaths.myTeamRequests,
                      text: S.of(context).myTeamRequests,
                      onTap: onTapMyTeamRequests)
                  : SizedBox(),
              MoreItemWidget(
                  image: ImagePaths.attendanceHistory,
                  text: S.of(context).attendanceHistory,
                  onTap: onTapAttendanceHistory),
              checkIfUserHasAccess(6165)
                  ? MoreItemWidget(
                      image: ImagePaths.myTeamAttendance,
                      text: S.of(context).myTeamAttendance,
                      onTap: onTapMyTeamAttendance)
                  : SizedBox(),
              MoreItemWidget(
                  image: ImagePaths.notificationsMore,
                  text: S.of(context).notifications,
                  hasSuffixIcons: true,
                  widget: NotificationsToggleWidget(
                      isNotificationsOn: isNotificationsOn,
                      onToggleNotifications: (bool value) {
                        onTapNotifications(value);
                      })),
              MoreItemWidget(
                  image: ImagePaths.language,
                  text: S.of(context).language,
                  hasSuffixIcons: true,
                  widget: LanguageSwitchWidget(
                      isEnglish: isEnglish,
                      onSwitchLanguage: (bool value) {
                        onSwitchLanguage(value);
                      })),
              MoreItemWidget(
                  image: ImagePaths.termsConditions,
                  text: S.of(context).termsConditions,
                  onTap: onTapTermsConditions),
              MoreItemWidget(
                  image: ImagePaths.aboutUs,
                  text: S.of(context).aboutUs,
                  onTap: onTapAboutUs),
              MoreLogoutItem(onTapLogout: onTapLogout),
            ],
          ),
        ),
      ),
    );
  }

  bool checkIfUserHasAccess(int id) {
    bool flag = false;
    EssPermissionSingleTon.getEssPermission.forEach((element) {
      if (element.id == id) {
        flag = true;
      }
      element.requests?.forEach((element) {
        if (element.id == id) {
          flag = true;
        }
        element.requests?.forEach((element) {
          if (element.id == id) {
            flag = true;
          }
        });
      });
    });

    return flag;
  }
}
