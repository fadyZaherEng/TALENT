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
import 'package:talent_link/src/domain/entities/countries/country.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/education/education_bloc.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_controller.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_error_message.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_functions.dart';
import 'package:talent_link/src/presentation/screens/education/utils/education_global_key.dart';
import 'package:talent_link/src/presentation/screens/education/widgets/education_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/countries_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class EducationScreen extends BaseStatefulWidget {
  const EducationScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _EducationScreenState();
}

class _EducationScreenState extends BaseState<EducationScreen> {
  EducationBloc get _bloc => BlocProvider.of<EducationBloc>(context);

  final EducationController _educationController = EducationController(
    qualificationType: TextEditingController(),
    qualificationPlaceName: TextEditingController(),
    country: TextEditingController(),
    remarks: TextEditingController(),
  );
  final EducationGlobalKey _educationGlobalKey = EducationGlobalKey(
    qualificationType: GlobalKey(),
    qualificationPlaceName: GlobalKey(),
    country: GlobalKey(),
    expiryDate: GlobalKey(),
    issueDate: GlobalKey(),
  );
  final EducationErrorMassage _educationErrorMassage = EducationErrorMassage();
  String _filePath = '';
  String _issueDate = '';
  String _expiryDate = '';
  final _picker = ImagePicker();
  RequestType _qualificationType = RequestType(id: 0, name: '');
  List<RequestType> _qualificationTypes = [];
  List<Country> _countries = [];
  Country _country = Country(countryId: 0, countryName: '');

  @override
  void initState() {
    _bloc.add(GetQualificationTypeEvent());
    _bloc.add(GetCountriesEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<EducationBloc, EducationState>(
      listener: (context, state) {
        if (state is EducationLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is EducationBackState) {
          Navigator.pop(context);
        } else if (state is EducationOpenQualificationTypeBottomSheetState) {
          _openQualificationTypeBottomSheet();
        } else if (state is EducationOpenCountryBottomSheetState) {
          _openCountryBottomSheet();
        } else if (state is EducationOpenFileBottomSheetState) {
          _openFileBottomSheet();
        } else if (state is EducationOpenCameraState) {
          _openCamera();
        } else if (state is EducationOpenGalleryState) {
          _openGallery();
        } else if (state is EducationOpenFileState) {
          _openFile();
        } else if (state is EducationValidationQualificationTypeNotValidState) {
          _educationErrorMassage.qualificationType = state.validationMessage;
          _animateTo(_educationGlobalKey.qualificationType);
        } else if (state is EducationValidationQualificationTypeValidState) {
          _educationErrorMassage.qualificationType = null;
          _educationController.qualificationType.text =
              state.qualificationType.name;
        } else if (state
            is EducationValidationQualificationPlaceNameNotValidState) {
          _educationErrorMassage.qualificationPlaceName =
              state.validationMessage;
          _animateTo(_educationGlobalKey.qualificationPlaceName);
        } else if (state
            is EducationValidationQualificationPlaceNameValidState) {
          _educationErrorMassage.qualificationPlaceName = null;
        } else if (state is EducationValidationCountryNotValidState) {
          _educationErrorMassage.country = state.validationMessage;
          _animateTo(_educationGlobalKey.country);
        } else if (state is EducationValidationCountryValidState) {
          _educationErrorMassage.country = null;
          _educationController.country.text = state.country.countryName;
        } else if (state is EducationValidationIssueDateNotValidState) {
          _educationErrorMassage.issueDate = state.validationMessage;
          _animateTo(_educationGlobalKey.issueDate);
        } else if (state is EducationValidationIssueDateValidState) {
          _educationErrorMassage.issueDate = null;
        } else if (state is EducationValidationExpiryDateNotValidState) {
          _educationErrorMassage.expiryDate = state.validationState;
          _animateTo(_educationGlobalKey.expiryDate);
        } else if (state is EducationValidationExpiryDateValidState) {
          _educationErrorMassage.expiryDate = null;
        } else if (state is EducationSelectFileState) {
          _filePath = state.filePath;
        } else if (state is EducationDeleteFileState) {
          _filePath = state.file;
        } else if (state is GetQualificationTypeSuccessState) {
          _qualificationTypes = state.qualificationTypes;
        } else if (state is GetQualificationTypeErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(EducationBackEvent());
          });
        } else if (state is GetCountriesSuccessState) {
          _countries = state.countries;
        } else if (state is GetCountriesErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(EducationBackEvent());
          });
        } else if (state is EducationSubmitSuccessState) {
          _massageDialog(state.successMessage, () {
            _bloc.add(EducationBackEvent());
            _bloc.add(EducationBackEvent());
          });
        } else if (state is EducationSubmitErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(EducationBackEvent());
          });
        } else if (state is EducationDataFillingSuccessState) {
          showConfirmBackDialog(context);
        } else if (state is EducationDataFillingErrorState) {
          _pop(context);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            _bloc.add(EducationDataFillingEvent(
                educationController: _educationController,
                issueDate: _issueDate,
                expireDate: _expiryDate,
                pathFile: _filePath));
            return Future.value(true);
          },
          child: Scaffold(
            appBar: buildAppBarWidget(context,
                title: S.of(context).education,
                isHaveBackButton: true, onBackButtonPressed: () {
              _bloc.add(EducationDataFillingEvent(
                  educationController: _educationController,
                  issueDate: _issueDate,
                  expireDate: _expiryDate,
                  pathFile: _filePath));
            }),
            body: EducationContentWidget(
              filePath: _filePath,
              educationController: _educationController,
              educationGlobalKey: _educationGlobalKey,
              educationErrorMassage: _educationErrorMassage,
              educationFunctions: EducationFunctions(
                onTapQualificationType: () {
                  _bloc.add(EducationOpenQualificationTypeBottomSheetEvent());
                },
                onChangeQualificationPlaceName: (String value) {
                  _bloc.add(EducationValidationQualificationPlaceNameEvent(
                      value: value));
                },
                onTapCountry: () {
                  _bloc.add(EducationOpenCountryBottomSheetEvent());
                },
                onPickIssueDate: (String value) {
                  _issueDate = value;
                  _bloc.add(EducationValidationIssueDateEvent(value: value));
                },
                onDeleteIssueDate: () {
                  _issueDate = '';
                  _bloc.add(EducationValidationIssueDateEvent(value: ''));
                },
                onPickExpiryDate: (String value) {
                  _expiryDate = value;
                  _bloc.add(EducationValidationExpiryDateEvent(value: value));
                },
                onDeleteExpiryDate: () {
                  _expiryDate = '';
                  _bloc.add(EducationValidationExpiryDateEvent(value: ''));
                },
                onChangeRemarks: (String value) {},
                showUploadFileBottomSheet: () {
                  _bloc.add(EducationOpenFileBottomSheetEvent());
                },
                deleteFileAction: (String file) {
                  _deleteFile(file);
                },
                onTapSubmit: () {
                  _bloc.add(EducationSubmitEvent(
                    issueDate: _issueDate,
                    expiryDate: _expiryDate,
                    educationController: _educationController,
                    file: _filePath,
                    qualificationTypeId: _qualificationType.id,
                    countryId: _country.countryId,
                  ));
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _openQualificationTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _qualificationTypes,
        requestType: _qualificationType,
      ),
      titleLabel: S.of(context).qualificationType,
    ).then((value) {
      _qualificationType = value;
      _bloc.add(
          EducationValidationQualificationTypeEvent(value: _qualificationType));
    });
  }

  void _openCountryBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: CountriesBottomSheetWidget(
        countries: _countries,
        country: _country,
      ),
      titleLabel: S.of(context).country,
    ).then((value) {
      if (value != null) {
        _country = value;
        _bloc.add(EducationValidationCountryEvent(value: _country));
      }
    });
  }

  void _openFileBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () => _bloc.add(EducationOpenCameraEvent()),
        onTapGallery: () => _bloc.add(EducationOpenGalleryEvent()),
        onTapFile: () => _bloc.add(EducationOpenFileEvent()),
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
          _bloc.add(EducationBackEvent());
          _bloc.add(EducationSelectFileEvent(filePath: value.path));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(EducationBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(EducationBackEvent());
                  _bloc.add(EducationSelectFileEvent(filePath: value.path));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(EducationBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _openGallery() async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Platform.isIOS ? Permission.photos : Permission.storage,
    )) {
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(EducationBackEvent());
          _bloc.add(EducationSelectFileEvent(filePath: value.path));
        }
      });
    } else {
      _showActionDialog(
          onPrimaryAction: () {
            _bloc.add(EducationBackEvent());
            openAppSettings().then((value) async {
              if (await PermissionServiceHandler().handleServicePermission(
                setting:
                    Platform.isIOS ? Permission.photos : Permission.storage,
              )) {
                await _picker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  if (value!.path.isNotEmpty) {
                    _bloc.add(EducationBackEvent());
                    _bloc.add(EducationSelectFileEvent(filePath: value.path));
                  }
                });
              }
            });
          },
          onSecondaryAction: () {
            _bloc.add(EducationBackEvent());
          },
          primaryText: S.of(context).ok,
          secondaryText: S.of(context).cancel,
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
        _bloc.add(EducationBackEvent());
        _bloc.add(EducationSelectFileEvent(
          filePath: result.files.single.path!,
        ));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(EducationBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(EducationBackEvent());
                _bloc.add(EducationSelectFileEvent(
                    filePath: result.files.single.path!));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(EducationBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveStoragePermission,
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
        _bloc.add(EducationBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(EducationBackEvent());
        _bloc.add(EducationDeleteFileEvent(file: value));
      },
      primaryText: S.of(context).no,
      secondaryText: S.of(context).yes,
      text: S.of(context).areYouSureYouWantToDeleteThisFile,
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

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }

  void _pop(BuildContext context) {
    Navigator.pop(context);
  }
}
