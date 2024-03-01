import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/presentation/screens/my_requests/widgets/my_request_empty_scrren_widget.dart';
import 'package:talent_link/src/presentation/screens/update_profile/widgets/update_profile_card_item.dart';

class UpdateProfileContentWidget extends StatelessWidget {
  final List<Request> requests;
  final void Function(Request request) onTapItem;

  const UpdateProfileContentWidget(
      {super.key, required this.requests, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return requests.isEmpty
        ? const MyTeamRequestEmptyScreenWidget()
        : GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            padding: const EdgeInsets.all(16),
            children: requests.map((e) {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: UpdateProfileCardItemWidget(
                    request: e,
                    onTapItem: () => onTapItem(e),
                  ));
            }).toList(),
          );
  }
}
