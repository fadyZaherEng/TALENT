import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/presentation/blocs/more/more_bloc.dart';
import 'package:talent_link/src/presentation/screens/more/widgets/more_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/restart_widget.dart';

class MoreScreen extends BaseStatefulWidget {
  const MoreScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MoreScreenState();
}

class _MoreScreenState extends BaseState<MoreScreen> {
  MoreBloc get _bloc => BlocProvider.of<MoreBloc>(context);
  bool _notificationsToggle = true;
  bool _isEnglish = true;
  int _userTypeId = 0;

  @override
  void initState() {
    super.initState();
    _bloc.add(MoreGetNotificationStatusEvent());
    _bloc.add(MoreGetLanguageEvent());
    _bloc.add(MoreTeamRequestAndAttendanceVisibilityEvent());
    _bloc.add(MoreTeamRequestAndAttendanceVisibilityEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreNavigateToUpdateProfileScreenState) {
          Navigator.pushNamed(context, Routes.updateProfile);
        } else if (state is MoreNavigateToMyRequestsScreenState) {
          Navigator.pushNamed(context, Routes.myRequests);
        } else if (state is MoreNavigateToMyTeamRequestsScreenState) {
          Navigator.pushNamed(context, Routes.myTeamRequests);
        } else if (state is MoreNavigateToAttendanceHistoryScreenState) {
          Navigator.pushNamed(context, Routes.attendanceHistory);
        } else if (state is MoreNavigateToMyTeamAttendanceScreenState) {
          Navigator.pushNamed(context, Routes.myTeamAttendance);
        } else if (state is MoreNavigateToTermsConditionsScreenState) {
          Navigator.pushNamed(context, Routes.termsConditions);
        } else if (state is MoreNavigateToAboutUsScreenState) {
          Navigator.pushNamed(context, Routes.aboutUs);
        } else if (state is MoreNotificationsToggleState) {
          _notificationsToggle = state.value;
        } else if (state is MoreSwitchLanguageState) {
          _isEnglish = state.value;
          RestartWidget.restartApp(context);
        } else if (state is MoreLogoutState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.login, (route) => false);
        } else if (state is MoreBackState) {
          Navigator.pop(context);
        } else if (state is MoreGetNotificationStatusState) {
          _notificationsToggle = state.status;
        } else if (state is MoreGetLanguageState) {
          _isEnglish = state.language;
        } else if (state is MoreTeamRequestAndAttendanceVisibilityState) {
          _userTypeId = state.userTypeId;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: MoreContentWidget(
            isEnglish: _isEnglish,
            isNotificationsOn: _notificationsToggle,
            userTypeId: _userTypeId,
            onTapUpdateProfile: () {
              _bloc.add(MoreNavigateToUpdateProfileScreenEvent());
            },
            onTapMyRequests: () {
              _bloc.add(MoreNavigateToMyRequestsScreenEvent());
            },
            onTapMyTeamRequests: () {
              _bloc.add(MoreNavigateToMyTeamRequestsScreenEvent());
            },
            onTapAttendanceHistory: () {
              _bloc.add(MoreNavigateToAttendanceHistoryScreenEvent());
            },
            onTapMyTeamAttendance: () {
              _bloc.add(MoreNavigateToMyTeamAttendanceScreenEvent());
            },
            onTapNotifications: (bool value) {
              _bloc.add(MoreNotificationsToggleEvent(value: value));
            },
            onTapTermsConditions: () {
              _bloc.add(MoreNavigateToTermsConditionsScreenEvent());
            },
            onTapAboutUs: () => _bloc.add(MoreNavigateToAboutUsScreenEvent()),
            onSwitchLanguage: (bool value) {
              _bloc.add(MoreSwitchLanguageEvent(value: value));
            },
            onTapLogout: () {
              _showActionDialog(
                  onPrimaryAction: () {
                    _bloc.add(MoreLogoutEvent());
                  },
                  onSecondaryAction: () {
                    _bloc.add(MoreBackEvent());
                  },
                  primaryText: S.of(context).yes,
                  secondaryText: S.of(context).no,
                  text: S.of(context).areYouSureYouWantToExitTheApp);
            },
          ),
        );
      },
    );
  }

  Future _showActionDialog({
    required Function() onPrimaryAction,
    required Function() onSecondaryAction,
    required String primaryText,
    required String secondaryText,
    required String text,
  }) {
    return showActionDialogWidget(
      context: context,
      text: text,
      primaryText: primaryText,
      primaryAction: onPrimaryAction,
      secondaryText: secondaryText,
      secondaryAction: onSecondaryAction,
      icon: ImagePaths.approve,
    );
  }
}
