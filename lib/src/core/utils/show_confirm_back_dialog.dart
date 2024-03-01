import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';

void showConfirmBackDialog(BuildContext context) async {
  await showActionDialogWidget(
    context: context,
    text: S.current.areYouSureYouWantToDiscardTheChanges,
    icon: ImagePaths.profile,
    primaryText: S.current.yes,
    secondaryText: S.current.no,
    primaryAction: () async {
      _pop(context);
    },
    secondaryAction: () {
      Navigator.pop(context);
    },
  );
}

void _pop(BuildContext context) {
  Navigator.pop(context);
  Navigator.pop(context);
}
