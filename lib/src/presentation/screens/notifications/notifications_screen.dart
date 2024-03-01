import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/notifications/notifications.dart';
import 'package:talent_link/src/presentation/blocs/notification/notifications_bloc.dart';
import 'package:talent_link/src/presentation/screens/notifications/widgets/notifications_content_widget.dart';
import 'package:talent_link/src/presentation/screens/notifications/widgets/notifications_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class NotificationsScreen extends BaseStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseState<NotificationsScreen> {
  NotificationsBloc get _bloc => BlocProvider.of<NotificationsBloc>(context);
  List<Notifications> _notifications = [];

  @override
  void initState() {
    _bloc.add(GetNotificationsEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsBackState) {
          Navigator.pop(context);
        } else if (state is GetNotificationsSuccessState) {
          _notifications = state.notifications;
        } else if (state is GetNotificationsErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(NotificationsBackEvent());
          });
        }
      },
      builder: (context, state) {
        if (state is NotificationSkeletonState) {
          return const NotificationsSkeletonWidget();
        }
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).notifications,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(NotificationsBackEvent());
          }),
          body: NotificationsContentWidget(notifications: _notifications),
        );
      },
    );
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }
}
