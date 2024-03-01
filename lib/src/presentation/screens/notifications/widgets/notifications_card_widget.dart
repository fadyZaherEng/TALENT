import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/notifications/notifications.dart';

class NotificationCardWidget extends StatelessWidget {
  final Notifications notification;

  const NotificationCardWidget({
    required this.notification,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            color: ColorSchemes.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 24,
                spreadRadius: 0,
                color: Color.fromRGBO(23, 43, 77, 0.16),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "# ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorSchemes.gray),
                  ),
                  Text(
                    "${notification.id}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorSchemes.primary),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    notification.date,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorSchemes.black),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorSchemes.black,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    notification.body,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.black,
                        fontWeight: Constants.fontWeightRegular),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
