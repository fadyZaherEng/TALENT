import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/more_header_widget.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/more_items_widget.dart';

class MoreContentWidget extends StatelessWidget {
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

  const MoreContentWidget({
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
    required this.isNotificationsOn,
    required this.isEnglish,
    required this.onTapLogout,
    required this.userTypeId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MoreHeaderWidget(logo: ImagePaths.profile),
        MoreItemsWidget(
          onTapUpdateProfile: onTapUpdateProfile,
          onTapMyRequests: onTapMyRequests,
          onTapMyTeamRequests: onTapMyTeamRequests,
          onTapAttendanceHistory: onTapAttendanceHistory,
          onTapMyTeamAttendance: onTapMyTeamAttendance,
          onTapNotifications: (bool value) => onTapNotifications(value),
          onTapTermsConditions: onTapTermsConditions,
          onTapAboutUs: onTapAboutUs,
          onTapLogout: onTapLogout,
          isNotificationsOn: isNotificationsOn,
          onSwitchLanguage: (bool value) => onSwitchLanguage(value),
          isEnglish: isEnglish,
          userTypeId: userTypeId,
        ),
      ],
    );
  }
}
