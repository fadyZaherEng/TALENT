import 'package:flutter/cupertino.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';

void showProfileMassageDialog({
  required String massage,
  required BuildContext context,
}) {
  showMassageDialogWidget(
    context: context,
    text: massage,
    icon: ImagePaths.profile,
    buttonText: S.of(context).ok,
    onTap: () {},
  );
}
