import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_confirm_back_dialog.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/asset/asset_bloc.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_controller.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_error_message.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_functions.dart';
import 'package:talent_link/src/presentation/screens/asset/utils/asset_global_key.dart';
import 'package:talent_link/src/presentation/screens/asset/widgets/asset_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class AssetScreen extends BaseStatefulWidget {
  const AssetScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AssetScreenState();
}

class _AssetScreenState extends BaseState<AssetScreen> {
  AssetBloc get _bloc => BlocProvider.of<AssetBloc>(context);
  final AssetGlobalKey _assetGlobalKey =
      AssetGlobalKey(quantity: GlobalKey(), assetType: GlobalKey());

  final AssetController _assetController = AssetController(
      assetType: TextEditingController(),
      quantity: TextEditingController(),
      remarks: TextEditingController());
  final AssetErrorMassage _assetErrorMassage = AssetErrorMassage();

  int _typeId = 0;
  List<RequestType> _requestTypes = [];
  RequestType _requestType = RequestType(id: 0, name: '');
  bool _emptyFields = true;

  @override
  void initState() {
    _bloc.add(GetAssetTypeListEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AssetBloc, AssetState>(listener: (context, state) {
      if (state is AssetLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is AssetBackState) {
      Navigator.pop(context);
      } else if (state is AssetValidationQuantityEmptyState) {
        _animateTo(_assetGlobalKey.quantity);
        _assetErrorMassage.quantity = state.validationMessage;
      } else if (state is AssetValidationQuantityValidState) {
        _emptyFields = false;
        _assetErrorMassage.quantity = null;
      } else if (state is AssetValidationAssetTypeEmptyState) {
        _animateTo(_assetGlobalKey.assetType);
        _assetErrorMassage.assetType = state.validationMessage;
      } else if (state is AssetValidationAssetTypeValidState) {
        _emptyFields = false;
        _assetErrorMassage.assetType = null;
      } else if (state is GetAssetTypeListSuccessState) {
        _requestTypes = state.requestTypes;
      } else if (state is GetAssetTypeListErrorState) {
        _massageDialog(state.errorMessage, () {
          _bloc.add(AssetBackEvent());
        });
      } else if (state is OpenAssetTypeBottomSheetState) {
        _openAssetTypeBottomSheet();
      } else if (state is SelectAssetTypeState) {
        _typeId = state.requestType.id;
        _assetController.assetType.text = state.requestType.name;
        _bloc.add(AssetValidationAssetTypeEvent(value: state.requestType.name));
      } else if (state is AssetSubmitSuccessState) {
        _massageDialog(state.successMessage, () {
          _bloc.add(AssetBackEvent());
          _bloc.add(AssetBackEvent());
        });
      } else if (state is AssetSubmitErrorState) {
        _massageDialog(state.errorMessage, () {
          _bloc.add(AssetBackEvent());
        });
      } else if (state is AssetDataFillingSuccessState) {
        showConfirmBackDialog(context);
      } else if (state is AssetDataFillingErrorState) {
        _pop(context);
      }
    }, builder: (context, state) {
      return WillPopScope(
        onWillPop: (){
          _bloc.add(AssetDataFillingEvent(
            assetController: _assetController,
          ));
          return Future.value(true);
        },
        child: Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).asset,
              isHaveBackButton: true, onBackButtonPressed: () {
                _bloc.add(AssetDataFillingEvent(
                  assetController: _assetController,
                ));
          }),
          body: AssetContentWidget(
            assetGlobalKey: _assetGlobalKey,
            assetController: _assetController,
            assetErrorMassage: _assetErrorMassage,
            assetFunctions: AssetFunctions(onChangeQuantity: (String value) {
              _bloc.add(AssetValidationQuantityEvent(value: value));
            }, onTapAssetType: () {
              _bloc.add(OpenAssetTypeBottomSheetEvent());
            }, onTapSubmit: () {
              _bloc.add(AssetSubmitEvent(
                  assetController: _assetController, typeId: _typeId));
            }),
          ),
        ),
      );
    });
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

  void _openAssetTypeBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _requestTypes,
        requestType: _requestType,
      ),
      titleLabel: S.of(context).assetType,
    ).then((value) {
      if (value != null) {
        _requestType = value;
        _bloc.add(SelectAssetTypeEvent(
          requestType: value,
        ));
      }
    });
  }

  void _pop(BuildContext context) {
    Navigator.pop(context);
  }
}
