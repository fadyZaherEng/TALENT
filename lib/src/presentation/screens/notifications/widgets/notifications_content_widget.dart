import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/notifications/notifications.dart';
import 'package:talent_link/src/presentation/screens/notifications/widgets/notifications_card_widget.dart';
import 'package:talent_link/src/presentation/screens/notifications/widgets/notifications_empty_screen_widget.dart';

class NotificationsContentWidget extends StatefulWidget {
  final List<Notifications> notifications;

  const NotificationsContentWidget({
    super.key,
    required this.notifications,
  });

  @override
  State<NotificationsContentWidget> createState() =>
      _NotificationsContentWidgetState();
}

class _NotificationsContentWidgetState
    extends State<NotificationsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.notifications.isNotEmpty
        ? ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: widget.notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return NotificationCardWidget(
                  notification: widget.notifications[index]);
            })
        : const NotificationsEmptyScreenWidget();
  }
}
