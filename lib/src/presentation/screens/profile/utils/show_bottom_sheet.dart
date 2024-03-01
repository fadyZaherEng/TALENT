import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/permission_service_handler.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:talent_link/src/presentation/widgets/image_bottom_sheet_widget.dart';

void showProfileBottomSheet({
  required BuildContext context,
  required ProfileBloc bloc,
}) {
  showBottomSheetWidget(
    height: 200,
    context: context,
    content: ImageBottomSheetWidget(
      onTapCamera: () {
        changeProfileImage(context: context, type: "camera", bloc: bloc);
      },
      onTapGallery: () {
        changeProfileImage(context: context, type: "gallery", bloc: bloc);
      },
    ),
    titleLabel: S.current.choseFile,
  ).then((value) {});
}

void changeProfileImage({
  required context,
  required String type,
  required ProfileBloc bloc,
}) async {
  if (type == "camera") {
    bool currentPermission = await PermissionServiceHandler()
        .handleServicePermission(setting: Permission.camera);
    if (currentPermission) {
      bloc.add(ProfileChangeImagePopDialogEvent());
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        bloc.add(ChangeProfileImageEvent(file: File(pickedFile.path)));
      } else {
        _massageDialog(massage: S.current.noImageSelected, context: context);
      }
    } else {
      await showActionDialogWidget(
        context: context,
        text: S.current.youShouldHaveCameraPermission,
        icon: ImagePaths.profile,
        primaryText: S.current.yes,
        secondaryText: S.current.no,
        primaryAction: () async {
          bloc.add(ProfileChangeImagePopDialogEvent());
          openAppSettings();
        },
        secondaryAction: () {
          bloc.add(ProfileChangeImagePopDialogEvent());
        },
      );
    }
  } else {
    bool currentPermission =
        await PermissionServiceHandler().handleServicePermission(
      setting: Platform.isIOS ? Permission.photos : Permission.storage,
    );
    if (currentPermission) {
      bloc.add(ProfileChangeImagePopDialogEvent());
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        bloc.add(ChangeProfileImageEvent(file: File(pickedFile.path)));
      } else {
        _massageDialog(massage: S.current.noImageSelected, context: context);
      }
    } else {
      await showActionDialogWidget(
        context: context,
        text: Platform.isIOS
            ? S.of(context).youShouldHavePhotosPermission
            : S.of(context).youShouldHaveStoragePermission,
        icon: ImagePaths.profile,
        primaryText: S.current.yes,
        secondaryText: S.current.no,
        primaryAction: () async {
          bloc.add(ProfileChangeImagePopDialogEvent());
          openAppSettings();
        },
        secondaryAction: () {
          bloc.add(ProfileChangeImagePopDialogEvent());
        },
      );
    }
  }
}

void _massageDialog({
  required String massage,
  required BuildContext context,
}) {
  showMassageDialogWidget(
    context: context,
    text: massage,
    icon: ImagePaths.profile,
    buttonText: S.of(context).ok,
    onTap: () {
      Navigator.pop(context);
    },
  );
}
