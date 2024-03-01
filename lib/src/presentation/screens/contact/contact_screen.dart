import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_confirm_back_dialog.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/contact/contact_bloc.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_controller.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_error_message.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_functions.dart';
import 'package:talent_link/src/presentation/screens/contact/utils/contact_global_key.dart';
import 'package:talent_link/src/presentation/screens/contact/widgets/contact_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class ContactScreen extends BaseStatefulWidget {
  const ContactScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ContactScreenState();
}

class _ContactScreenState extends BaseState<ContactScreen> {
  final ContactErrorMassage _contactErrorMassage = ContactErrorMassage();
  final ContactController _contactController = ContactController(
      contactType: TextEditingController(),
      contactNo: TextEditingController(),
      remark: TextEditingController());

  final ContactGlobalKey _contactGlobalKey =
      ContactGlobalKey(contactNo: GlobalKey(), contactType: GlobalKey());
  List<RequestType> _contactTypes = [];
  RequestType _contactType = RequestType(id: 0, name: '');

  ContactBloc get _bloc => BlocProvider.of<ContactBloc>(context);

  @override
  void initState() {
    _bloc.add(GetContactTypeEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
      listener: (context, state) {
        if (state is ContactLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is ContactBackState) {
          Navigator.pop(context);
        } else if (state is GetContactTypeSuccessState) {
          _contactTypes = state.requestTypes;
        } else if (state is GetContactTypeErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(ContactBackEvent());
          });
        } else if (state is OpenContactTypeBottomSheetState) {
          _openContactTypeBottomSheet();
        } else if (state is SelectContactTypeState) {
          _contactType = state.contactType;
          _contactController.contactType.text = state.contactType.name;
          _bloc.add(
              ContactValidationContactTypeEvent(value: state.contactType.name));
        } else if (state is ContactValidationContactTypeEmptyState) {
          _animateTo(_contactGlobalKey.contactType);
          _contactErrorMassage.contactType = state.validationMessage;
        } else if (state is ContactValidationContactTypeValidState) {
          _contactErrorMassage.contactType = null;
        } else if (state is ContactValidationContactNoEmptyState) {
          _animateTo(_contactGlobalKey.contactNo);
          _contactErrorMassage.contactNo = state.validationMessage;
        } else if (state is ContactValidationContactNoValidState) {
          _contactErrorMassage.contactNo = null;
        } else if (state is ContactSubmitSuccessState) {
          _massageDialog(state.successMessage, () {
            _bloc.add(ContactBackEvent());
            _bloc.add(ContactBackEvent());
          });
        } else if (state is ContactSubmitErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(ContactBackEvent());
          });
        } else if (state is ContactDataFillingSuccessState) {
          showConfirmBackDialog(context);
        } else if (state is ContactDataFillingErrorState) {
          _pop(context);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            _bloc.add(ContactDataFillingEvent(
              contactController: _contactController,
            ));
            return Future.value(true);
          },
          child: Scaffold(
            appBar: buildAppBarWidget(context,
                title: S.of(context).contact,
                isHaveBackButton: true, onBackButtonPressed: () {
              _bloc.add(ContactDataFillingEvent(
                contactController: _contactController,
              ));
            }),
            body: ContactContentWidget(
              contactController: _contactController,
              contactGlobalKey: _contactGlobalKey,
              contactErrorMassage: _contactErrorMassage,
              contactFunctions: ContactFunctions(
                onTapContactType: () {
                  _bloc.add(OpenContactTypeBottomSheetEvent());
                },
                onChangeContactNo: (String value) {
                  _contactController.contactNo.text = value;
                  _bloc.add(ContactValidationContactNoEvent(value: value));
                },
                onTapSubmit: () {
                  _bloc.add(ContactSubmitEvent(
                      contactController: _contactController,
                      contactTypeId: _contactType.id));
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _openContactTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _contactTypes,
        requestType: _contactType,
      ),
      titleLabel: S.of(context).contactType,
    ).then((value) {
      if (value != null) {
        _contactType = value;
        _bloc.add(SelectContactTypeEvent(
          contactType: value,
        ));
      }
    });
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
    );
  }

  void _pop(BuildContext context) {
    Navigator.pop(context);
  }
}
