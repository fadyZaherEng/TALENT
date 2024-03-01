import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/permission_service_handler.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/all_fields/all_fields_mandatory.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/entities/short_leave/calculate_in_case_short_leave.dart';
import 'package:talent_link/src/presentation/blocs/short_leave/short_leave_bloc.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_controller.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_error_massage.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_functions.dart';
import 'package:talent_link/src/presentation/screens/short_leave/utils/short_leave_global_key.dart';
import 'package:talent_link/src/presentation/screens/short_leave/widgets/short_leave_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/file_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class ShortLeaveScreen extends BaseStatefulWidget {
  const ShortLeaveScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ShortLeaveScreenState();
}

class _ShortLeaveScreenState extends BaseState<ShortLeaveScreen> {
  bool _isValidLeaveReasons = true;
  bool _isValidRemarks = true;
  bool _fileIsMandatory = false;
  String _filePath = '';
  String _date = '';
  String _startTime = '';
  String _endTime = '';
  RequestType _requestType = RequestType(id: 0, name: '');
  List<RequestType> _requestTypes = [];
  final _picker = ImagePicker();

  final ShortLeaveController _shortLeaveController = ShortLeaveController(
      type: TextEditingController(),
      numberOfMinutes: TextEditingController(),
      referenceName: TextEditingController(),
      referenceContactNo: TextEditingController(),
      leaveReasons: TextEditingController(),
      remarks: TextEditingController(),
      currentBalance: TextEditingController(),
      remainingBalance: TextEditingController(),
      startTime: TextEditingController(),
      endTime: TextEditingController());
  final ShortLeaveErrorMassage _shortLeaveErrorMassage =
      ShortLeaveErrorMassage();
  final ShortLeaveGlobalKey _shortLeaveGlobalKey = ShortLeaveGlobalKey(
    type: GlobalKey(),
    date: GlobalKey(),
    endTime: GlobalKey(),
    remarks: GlobalKey(),
    startTime: GlobalKey(),
    leaveReasons: GlobalKey(),
    referenceName: GlobalKey(),
    referenceContactNo: GlobalKey(),
    numberOfMinuet: GlobalKey(),
    uploadFile: GlobalKey(),
    remainingBalance: GlobalKey(),
    currentBalance: GlobalKey(),
  );

  ShortLeaveBloc get _bloc => BlocProvider.of<ShortLeaveBloc>(context);
  List<AllFieldsMandatory> _allFieldsMandatory = [];

  @override
  void initState() {
    _bloc.add(GetShortLeaveTypesEvent());
    _bloc.shortLeaveContentValue = ShortLeaveContentValue();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ShortLeaveBloc, ShortLeaveState>(
      listener: (context, state) {
        if (state is ShortLeaveLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is ShortLeaveBackState) {
          Navigator.pop(context);
        } else if (state is OpenTypeBottomSheetState) {
          _onOpenTypeBottomSheetState();
        } else if (state is SelectShortLeaveTypeState) {
          _shortLeaveController.type.text = state.shortLeaveType.name;
          _bloc.add(GetAllFieldsMandatoryEvent(
              requestData: state.shortLeaveType.id, requestTypeId: 3));
        } else if (state is OpenUploadFileBottomSheetState) {
          _onOpenUploadFileBottomSheetState(state.isMandatory);
        } else if (state is ShortLeaveOpenCameraState) {
          _openCamera(state.isMandatory);
        } else if (state is ShortLeaveOpenGalleryState) {
          _openGallery(state.isMandatory);
        } else if (state is ShortLeaveOpenFileState) {
          _openFile(state.isMandatory);
        } else if (state is ShortLeaveSelectFileState) {
          _bloc.add(ShortLeaveBackEvent());
          _filePath = state.filePath;
        } else if (state is ShortLeaveDeleteFileState) {
          _filePath = state.filePath;
        } else if (state is ShortLeaveTypeEmptyState) {
          _shortLeaveErrorMassage.type = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.type);
        } else if (state is ShortLeaveTypeValidState) {
          _shortLeaveErrorMassage.type = null;
        } else if (state is ShortLeaveDateEmptyState) {
          _shortLeaveErrorMassage.date = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.date);
        } else if (state is ShortLeaveDateValidState) {
          _shortLeaveErrorMassage.date = null;
        } else if (state is ShortLeaveStartTimeEmptyState) {
          _shortLeaveErrorMassage.startTime = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.startTime);
        } else if (state is ShortLeaveStartTimeValidState) {
          _shortLeaveErrorMassage.startTime = null;
        } else if (state is ShortLeaveEndTimeEmptyState) {
          _shortLeaveErrorMassage.endTime = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.endTime);
        } else if (state is ShortLeaveEndTimeValidState) {
          _shortLeaveErrorMassage.endTime = null;
        } else if (state is ShortLeaveReferenceNameEmptyState) {
          _shortLeaveErrorMassage.referenceName = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.referenceName);
        } else if (state is ShortLeaveReferenceNameValidState) {
          _shortLeaveErrorMassage.referenceName = null;
        } else if (state is ShortLeaveReferenceContactNoEmptyState) {
          _shortLeaveErrorMassage.referenceContactNo = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.referenceContactNo);
        } else if (state is ShortLeaveReferenceContactNoValidState) {
          _shortLeaveErrorMassage.referenceContactNo = null;
        } else if (state is ShortLeaveReasonsEmptyState) {
          _isValidLeaveReasons = false;
          _shortLeaveErrorMassage.leaveReasons = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.leaveReasons);
        } else if (state is ShortLeaveReasonsValidState) {
          _isValidLeaveReasons = true;
          _shortLeaveErrorMassage.leaveReasons = null;
        } else if (state is ShortLeaveRemarksEmptyState) {
          _isValidRemarks = false;
          _shortLeaveErrorMassage.remarks = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.remarks);
        } else if (state is ShortLeaveRemarksValidState) {
          _shortLeaveErrorMassage.remarks = null;
          _isValidRemarks = true;
        } else if (state is ShortLeaveFileEmptyState) {
          _shortLeaveErrorMassage.file = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.uploadFile);
          _fileIsMandatory = true;
        } else if (state is ShortLeaveFileValidState) {
          _shortLeaveErrorMassage.file = null;
          _fileIsMandatory = false;
        } else if (state is ShortLeaveSubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.shortLeaveContentValue = ShortLeaveContentValue();
            _bloc.add(ShortLeaveBackEvent());
            _bloc.add(ShortLeaveBackEvent());
          });
        } else if (state is GetShortLeaveTypesSuccessState) {
          _requestTypes = state.requestTypes;
        } else if (state is GetShortLeaveTypesErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ShortLeaveBackEvent());
          });
        } else if (state is InsertShortLeaveSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(ShortLeaveBackEvent());
            _bloc.add(ShortLeaveBackEvent());
          });
        } else if (state is InsertShortLeaveErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ShortLeaveBackEvent());
          });
        } else if (state is GetAllFieldsMandatorySuccessState) {
          _allFieldsMandatory = state.allFieldsMandatory;
        } else if (state is GetAllFieldsMandatoryErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ShortLeaveBackEvent());
          });
        } else if (state is ShortLeaveRemainingBalanceEmptyState) {
          _shortLeaveErrorMassage.remainingBalance = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.remainingBalance);
        } else if (state is ShortLeaveRemainingBalanceValidState) {
          _shortLeaveErrorMassage.remainingBalance = null;
        } else if (state is ShortLeaveCurrentBalanceEmptyState) {
          _shortLeaveErrorMassage.currentBalance = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.currentBalance);
        } else if (state is ShortLeaveCurrentBalanceValidState) {
          _shortLeaveErrorMassage.currentBalance = null;
        } else if (state is CalculateInCaseShortLeaveSuccessState) {
          _shortLeaveController.currentBalance.text =
              state.remoteCalculateInCaseShortLeave.currentBalance != null
                  ? state.remoteCalculateInCaseShortLeave.currentBalance
                      .toString()
                  : '';
          _shortLeaveController.remainingBalance.text =
              state.remoteCalculateInCaseShortLeave.remainingBalance != null
                  ? state.remoteCalculateInCaseShortLeave.remainingBalance
                      .toString()
                  : '';
        } else if (state is CalculateInCaseShortLeaveErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(ShortLeaveBackEvent());
          });
        } else if (state is ShortLeaveEndTimeNotValidState) {
          _shortLeaveErrorMassage.endTime = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.endTime);
        } else if (state is ShortLeaveStartTimeNotValidState) {
          _shortLeaveErrorMassage.startTime = state.validationMessage;
          _animateTo(_shortLeaveGlobalKey.startTime);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            _backDialog();
            return Future.value(true);
          },
          child: Scaffold(
            appBar: buildAppBarWidget(context,
                title: S.of(context).shortLeave,
                isHaveBackButton: true, onBackButtonPressed: () {
              _backDialog();
            }),
            body: ShortLeaveContentWidget(
              isValidLeaveReasons: _isValidLeaveReasons,
              isValidRemarks: _isValidRemarks,
              fileIsMandatory: _fileIsMandatory,
              filePath: _filePath,
              shortLeaveController: _shortLeaveController,
              shortLeaveErrorMassage: _shortLeaveErrorMassage,
              shortLeaveGlobalKey: _shortLeaveGlobalKey,
              allFieldsMandatory: _allFieldsMandatory,
              shortLeaveFunctions: ShortLeaveFunctions(
                onTapType: () {
                  _bloc.add(OpenTypeBottomSheetEvent());
                },
                onDeleteDate: () {
                  _date = '';
                  _bloc.add(ValidateShortLeaveDateEvent(value: ''));
                },
                onDeleteStartTime: () {
                  _startTime = '';
                  _endTime = '';
                  _shortLeaveController.endTime.text = '';
                  _shortLeaveController.numberOfMinutes.text =
                      _calculateDuration(_startTime, '');
                  _bloc.add(ValidateShortLeaveStartTimeEvent(
                      startTime: '', endTime: _endTime));
                  _bloc.add(ValidateShortLeaveEndTimeEvent(
                      endTime: '', startTime: _startTime));
                },
                onDeleteEndTime: () {
                  _endTime = '';
                  _shortLeaveController.numberOfMinutes.text =
                      _calculateDuration(_startTime, _endTime);
                  _bloc.add(ValidateShortLeaveEndTimeEvent(
                      endTime: '', startTime: _startTime));
                },
                onPickDate: (String value) {
                  _date = value;
                  _bloc.add(ValidateShortLeaveDateEvent(value: value));
                },
                onPickStartTime: (String value) {
                  _startTime = value;
                  _shortLeaveController.numberOfMinutes.text =
                      _calculateDuration(value, _endTime);
                  _bloc.add(ValidateShortLeaveStartTimeEvent(
                      startTime: value, endTime: _endTime));
                },
                onPickEndTime: (String value) {
                  _endTime = value;
                  _shortLeaveController.numberOfMinutes.text =
                      _calculateDuration(_startTime, value);
                  _bloc.add(ValidateShortLeaveEndTimeEvent(
                      endTime: value, startTime: _startTime));
                },
                onChangeReferenceName: (String value, bool isMandatory) {
                  _bloc.add(ValidateShortLeaveReferenceNameEvent(
                      value: value, isMandatory: isMandatory));
                },
                onChangeReferenceContactNo: (String value, bool isMandatory) {
                  _bloc.add(ValidateShortLeaveReferenceContactNoEvent(
                      value: value, isMandatory: isMandatory));
                },
                onChangeLeaveReasons: (String value, bool isMandatory) {
                  _bloc.add(ValidateShortLeaveReasonsEvent(
                      value: value, isMandatory: isMandatory));
                },
                onChangeRemarks: (String value, bool isMandatory) {
                  _bloc.add(ValidateShortLeaveRemarksEvent(
                      value: value, isMandatory: isMandatory));
                },
                showUploadFileBottomSheet: (bool isMandatory) {
                  _bloc.add(
                      OpenUploadFileBottomSheetEvent(isMandatory: isMandatory));
                },
                deleteFileAction: (String value, bool isMandatory) {
                  _deleteFile(value, isMandatory);
                },
                onTapSubmit: () {
                  _bloc.add(ShortLeaveSubmitEvent(
                      shortLeaveController: _shortLeaveController,
                      allFieldsMandatory: _allFieldsMandatory,
                      file: _filePath,
                      date: _date,
                      startTime: _startTime,
                      endTime: _endTime,
                      typeId: _requestType.id));
                },
                onChangeRemainingBalance: (String value, bool isMandatory) {
                  _bloc.add(ValidateShortLeaveRemainingBalanceEvent(
                      value: value, isMandatory: isMandatory));
                },
                onChangeCurrentBalance: (String value, bool isMandatory) {
                  _bloc.add(ValidateShortLeaveCurrentBalanceEvent(
                      value: value, isMandatory: isMandatory));
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _onOpenTypeBottomSheetState() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _requestTypes,
        requestType: _requestType,
      ),
      titleLabel: S.of(context).type,
    ).then((value) {
      _requestType = value;
      _bloc.add(SelectShortLeaveTypeEvent(
        shortLeaveType: value,
      ));
    });
  }

  void _onOpenUploadFileBottomSheetState(bool isMandatory) {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: FileBottomSheetWidget(
        onTapCamera: () =>
            _bloc.add(ShortLeaveOpenCameraEvent(isMandatory: isMandatory)),
        onTapGallery: () =>
            _bloc.add(ShortLeaveOpenGalleryEvent(isMandatory: isMandatory)),
        onTapFile: () =>
            _bloc.add(ShortLeaveOpenFileEvent(isMandatory: isMandatory)),
      ),
      titleLabel: S.of(context).choseFile,
    );
  }

  void _openCamera(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.camera,
    )) {
      await _picker.pickImage(source: ImageSource.camera).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(ShortLeaveSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          openAppSettings().then((value) async {
            _bloc.add(ShortLeaveBackEvent());
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.camera)) {
              await _picker.pickImage(source: ImageSource.camera).then((value) {
                if (value!.path.isNotEmpty) {
                  _bloc.add(ShortLeaveSelectFileEvent(
                      filePath: value.path, isMandatory: isMandatory));
                }
              });
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(ShortLeaveBackEvent());
        },
        primaryText: S.of(context).ok,
        secondaryText: S.of(context).cancel,
        text: S.of(context).youShouldHaveCameraPermission,
      );
    }
  }

  void _openGallery(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Platform.isIOS ? Permission.photos : Permission.storage,
    )) {
      await _picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value!.path.isNotEmpty) {
          _bloc.add(ShortLeaveSelectFileEvent(
              filePath: value.path, isMandatory: isMandatory));
        }
      });
    } else {
      _showActionDialog(
          onPrimaryAction: () {
            _bloc.add(ShortLeaveBackEvent());
            openAppSettings().then((value) async {
              if (await PermissionServiceHandler().handleServicePermission(
                  setting: Platform.isIOS
                      ? Permission.photos
                      : Permission.storage)) {
                await _picker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  if (value!.path.isNotEmpty) {
                    _bloc.add(ShortLeaveSelectFileEvent(
                        filePath: value.path, isMandatory: isMandatory));
                  }
                });
              }
            });
          },
          onSecondaryAction: () {
            Navigator.pop(context);
          },
          primaryText: S.of(context).ok,
          secondaryText: S.of(context).cancel,
          text: Platform.isIOS
              ? S.of(context).youShouldHavePhotosPermission
              : S.of(context).youShouldHaveStoragePermission);
    }
  }

  void _openFile(bool isMandatory) async {
    if (await PermissionServiceHandler().handleServicePermission(
      setting: Permission.storage,
    )) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        _bloc.add(ShortLeaveSelectFileEvent(
            filePath: result.files.single.path!, isMandatory: isMandatory));
      }
    } else {
      _showActionDialog(
        onPrimaryAction: () {
          _bloc.add(ShortLeaveBackEvent());
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.storage)) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result != null) {
                _bloc.add(ShortLeaveSelectFileEvent(
                    filePath: result.files.single.path!,
                    isMandatory: isMandatory));
              }
            }
          });
        },
        onSecondaryAction: () {
          _bloc.add(ShortLeaveBackEvent());
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

  void _deleteFile(String value, bool isMandatory) {
    _showActionDialog(
      onPrimaryAction: () {
        _bloc.add(ShortLeaveBackEvent());
      },
      onSecondaryAction: () {
        _bloc.add(ShortLeaveBackEvent());
        _bloc.add(ShortLeaveDeleteFileEvent(
            filePath: value, isMandatory: isMandatory));
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

  String _calculateDuration(String? startTime, String? endTime) {
    if (startTime == '' || endTime == '') {
      return "00:00";
    }

    final dateFormat = DateFormat("h:mm a", "en");
    final parsedStartTime = dateFormat.parse(startTime!);
    var parsedEndTime = dateFormat.parse(endTime!);

    if (parsedEndTime.isBefore(parsedStartTime)) {
      parsedEndTime = parsedEndTime.add(const Duration(hours: 12));
    }

    final duration = parsedEndTime.difference(parsedStartTime);
    final totalMinutes = duration.inMinutes;

    return totalMinutes.toString();
  }

  void _backDialog() {
    if (_bloc.shortLeaveContentValue.remainingBalance.isEmpty &&
        _bloc.shortLeaveContentValue.shortLeaveTypeId == 0 &&
        _bloc.shortLeaveContentValue.shortLeaveDate.isEmpty &&
        _bloc.shortLeaveContentValue.startTime.isEmpty &&
        _bloc.shortLeaveContentValue.endTime.isEmpty &&
        _bloc.shortLeaveContentValue.endNumberOfMinute.isEmpty &&
        _bloc.shortLeaveContentValue.referenceName.isEmpty &&
        _bloc.shortLeaveContentValue.referenceContactNo.isEmpty &&
        _bloc.shortLeaveContentValue.file.isEmpty &&
        _bloc.shortLeaveContentValue.remark.isEmpty &&
        _bloc.shortLeaveContentValue.leaveReasons.isEmpty &&
        _bloc.shortLeaveContentValue.currentBalance.isEmpty &&
        _bloc.shortLeaveContentValue.remainingBalance.isEmpty) {
      _bloc.add(ShortLeaveBackEvent());
    } else {
      _showActionDialog(
          onPrimaryAction: () {
            _bloc.shortLeaveContentValue = ShortLeaveContentValue();
            _bloc.add(ShortLeaveBackEvent());
            _bloc.add(ShortLeaveBackEvent());
          },
          onSecondaryAction: () {
            _bloc.add(ShortLeaveBackEvent());
          },
          primaryText: S.of(context).yes,
          secondaryText: S.of(context).no,
          text: S.of(context).areYouSureYouWantToDiscardTheChanges);
    }
  }
}
