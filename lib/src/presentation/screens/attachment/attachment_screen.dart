import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/permission_service_handler.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_confirm_back_dialog.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/attachment/attachment_bloc.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_controller.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_error_message.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_functions.dart';
import 'package:talent_link/src/presentation/screens/attachment/utils/attachment_global_key.dart';
import 'package:talent_link/src/presentation/screens/attachment/widgets/attachment_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class AttachmentScreen extends BaseStatefulWidget {
  const AttachmentScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AttachmentScreenState();
}

class _AttachmentScreenState extends BaseState<AttachmentScreen> {
  String _filePath = '';
  String _issueDate = '';
  String _expiryDate = '';
  bool _isFileMandatory = false;

  RequestType _attachmentType = RequestType(id: 0, name: '');
  List<RequestType> _attachmentTypes = [];
  final _picker = ImagePicker();

  AttachmentBloc get _bloc => BlocProvider.of<AttachmentBloc>(context);
  final AttachmentErrorMassage _attachmentErrorMassage =
      AttachmentErrorMassage();

  final AttachmentController _attachmentController = AttachmentController(
      attachmentType: TextEditingController(),
      documentNo: TextEditingController(),
      remarks: TextEditingController());
  final AttachmentGlobalKey _attachmentGlobalKey = AttachmentGlobalKey(
    attachmentType: GlobalKey(),
    documentNo: GlobalKey(),
    issueDate: GlobalKey(),
    file: GlobalKey(),
  );

  @override
  void initState() {
    _bloc.add(GetAttachmentTypeEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AttachmentBloc, AttachmentState>(
      listener: (context, state) {
        if (state is AttachmentLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }

        if (state is AttachmentBackState) {
          Navigator.pop(context);
        } else if (state is OpenAttachmentTypeBottomSheetState) {
          _openAttachmentTypeBottomSheet();
        } else if (state is ValidationAttachmentTypeValidState) {
          _attachmentController.attachmentType.text = state.attachmentType.name;
          _attachmentErrorMassage.attachmentType = null;
        } else if (state is ValidationAttachmentTypeNotValidState) {
          _animateTo(_attachmentGlobalKey.attachmentType);
          _attachmentErrorMassage.attachmentType = state.validationMessage;
        } else if (state is GetAttachmentTypeSuccessState) {
          _attachmentTypes = state.attachmentTypes;
        } else if (state is GetAttachmentTypeErrorState) {
          _messageDialog(state.errorMessage, () {
            _bloc.add(AttachmentBackEvent());
          });
        } else if (state is AttachmentOpenUploadFileBottomSheetState) {
          _openFileBottomSheet();
        } else if (state is AttachmentOpenCameraState) {
          _openCamera();
        } else if (state is AttachmentOpenGalleryState) {
          _openGallery();
        } else if (state is AttachmentOpenFileState) {
          _openFile();
        } else if (state is AttachmentValidationFileValidState) {
          _filePath = state.filePath;
          _isFileMandatory = false;
        } else if (state is AttachmentValidationFileNotValidState) {
          _attachmentErrorMassage.file = state.validationMessage;
          _animateTo(_attachmentGlobalKey.file);
          _filePath = '';
          _isFileMandatory = true;
        } else if (state is AttachmentValidationDocumentNoValidState) {
          _attachmentErrorMassage.documentNo = null;
        } else if (state is AttachmentValidationDocumentNoNotValidState) {
          _attachmentErrorMassage.documentNo = state.validationMessage;
          _animateTo(_attachmentGlobalKey.documentNo);
        } else if (state is AttachmentValidationIssueDateValidState) {
          _attachmentErrorMassage.issueDate = null;
        } else if (state is AttachmentValidationIssueDateNotValidState) {
          _attachmentErrorMassage.issueDate = state.validationMessage;
          _animateTo(_attachmentGlobalKey.issueDate);
        } else if (state is AttachmentSubmitSuccessState) {
          _messageDialog(state.successMessage, () {
            _bloc.add(AttachmentBackEvent());
            _bloc.add(AttachmentBackEvent());
          });
        } else if (state is AttachmentSubmitErrorState) {
          _messageDialog(state.errorMessage, () {
            _bloc.add(AttachmentBackEvent());
          });
        } else if (state is AttachmentDataFillingSuccessState) {
          showConfirmBackDialog(context);
        } else if (state is AttachmentDataFillingErrorState) {
          _pop(context);
        } else if (state is AttachmentSelectExpireDateState) {
          _expiryDate = state.value;
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            _bloc.add(AttachmentDataFillingEvent(
              attachmentController: _attachmentController,
              expireDate: _expiryDate,
              issueDate: _issueDate,
              filePath: _filePath,
            ));
            return Future.value(true);
          },
          child: Scaffold(
            appBar: buildAppBarWidget(context,
                title: S.current.attachment,
                isHaveBackButton: true, onBackButtonPressed: () {
              _bloc.add(AttachmentDataFillingEvent(
                attachmentController: _attachmentController,
                expireDate: _expiryDate,
                issueDate: _issueDate,
                filePath: _filePath,
              ));
            }),
            body: AttachmentContentWidget(
              isFileMandatory: _isFileMandatory,
              filePath: _filePath,
              attachmentErrorMassage: _attachmentErrorMassage,
              attachmentController: _attachmentController,
              attachmentGlobalKey: _attachmentGlobalKey,
              attachmentFunctions: AttachmentFunctions(onTapAttachmentType: () {
                _bloc.add(OpenAttachmentTypeBottomSheetEvent());
              }, onChangeDocumentNumber: (String value) {
                _bloc
                    .add(AttachmentValidationDocumentNumberEvent(value: value));
              }, onPickIssueDate: (String value) {
                _issueDate = value;
                _bloc.add(AttachmentValidationIssueDateEvent(value: value));
              }, onDeleteIssueDate: () {
                _issueDate = '';
                _bloc.add(AttachmentValidationIssueDateEvent(value: ''));
              }, onPickExpiryDate: (String value) {
                _bloc.add(AttachmentSelectExpireDateEvent(value: value));
              }, onDeleteExpiryDate: () {
                _bloc.add(AttachmentSelectExpireDateEvent(value: ''));
              }, showUploadFileBottomSheet: () {
                _bloc.add(AttachmentOpenUploadFileBottomSheetEvent());
              }, deleteFileAction: (String value) {
                _deleteFile(value);
              }, onTapSubmit: () {
                _bloc.add(AttachmentSubmitEvent(
                  filePath: _filePath,
                  issueDate: _issueDate,
                  attachmentController: _attachmentController,
                  expiryDate: _expiryDate,
                  attachmentTypeId: _attachmentType.id,
                ));
              }),
            ),
          ),
        );
      },
    );
  }

  void _openAttachmentTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _attachmentTypes,
        requestType: _attachmentType,
      ),
      titleLabel: S.of(context).attachmentType,
    ).then((value) {
      _attachmentType = value;
      _bloc.add(ValidationAttachmentTypeEvent(attachmentType: _attachmentType));
    });
  }

  void _openFileBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () => _bloc.add(AttachmentOpenCameraEvent()),
        onTapGallery: () => _bloc.add(AttachmentOpenGalleryEvent()),
        onTapFile: () => _bloc.add(AttachmentOpenFileEvent()),
      ),
      titleLabel: S.of(context).choseFile,
    );
  }

  void _openCamera() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.camera).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(AttachmentBackEvent());
          _bloc.add(AttachmentValidationFileEvent(filePath: value.path));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(AttachmentBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(AttachmentBackEvent());
                  _bloc
                      .add(AttachmentValidationFileEvent(filePath: value.path));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(AttachmentBackEvent());
        },
        primaryText: S.current.ok,
        secondaryText: S.current.cancel,
        text: S.current.youShouldHaveCameraPermission,
      );
    }
  }

  void _openGallery() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Platform.isIOS ? Permission.photos : Permission.storage,
    )) {
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(AttachmentBackEvent());
          _bloc.add(AttachmentValidationFileEvent(filePath: value.path));
        }
      });
    } else {
      _showActionDialog(
          onPrimaryAction: () {
            _bloc.add(AttachmentBackEvent());
            openAppSettings().then((value) async {
              if (await PermissionServiceHandler().handleServicePermission(
                setting:
                    Platform.isIOS ? Permission.photos : Permission.storage,
              )) {
                await _picker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  if (value!.path.isNotEmpty) {
                    _bloc.add(AttachmentBackEvent());
                    _bloc.add(
                        AttachmentValidationFileEvent(filePath: value.path));
                  }
                });
              }
            });
          },
          onSecondaryAction: () {
            _bloc.add(AttachmentBackEvent());
          },
          primaryText: S.current.ok,
          secondaryText: S.current.cancel,
          text: Platform.isIOS
              ? S.of(context).youShouldHavePhotosPermission
              : S.of(context).youShouldHaveStoragePermission);
    }
  }

  void _openFile() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.storage,
    )) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        _bloc.add(AttachmentBackEvent());
        _bloc.add(AttachmentValidationFileEvent(
          filePath: result.files.single.path!,
        ));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(AttachmentBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(AttachmentBackEvent());
                _bloc.add(AttachmentValidationFileEvent(
                    filePath: result.files.single.path!));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(AttachmentBackEvent());
        },
        primaryText: S.current.ok,
        secondaryText: S.current.cancel,
        text: S.current.youShouldHaveStoragePermission,
      );
    }
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

  void _deleteFile(String value) {
    _showActionDialog(
      onPrimaryAction: () {
        _bloc.add(AttachmentBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(AttachmentBackEvent());
        _bloc.add(AttachmentValidationFileEvent(filePath: ''));
      },
      primaryText: S.current.no,
      secondaryText: S.current.yes,
      text: S.current.areYouSureYouWantToDeleteThisFile,
    );
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }

  void _messageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.current.ok,
        onTap: onTap);
  }

  void _pop(BuildContext context) {
    Navigator.pop(context);
  }
}
