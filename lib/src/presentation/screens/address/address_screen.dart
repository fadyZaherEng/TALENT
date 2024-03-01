import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_confirm_back_dialog.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/presentation/blocs/address/address_bloc.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_controller.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_error_message.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_functions.dart';
import 'package:talent_link/src/presentation/screens/address/utils/address_global_key.dart';
import 'package:talent_link/src/presentation/screens/address/widgets/address_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_type_bottom_sheet_widget.dart';

class AddressScreen extends BaseStatefulWidget {
  const AddressScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AddressScreenState();
}

class _AddressScreenState extends BaseState<AddressScreen> {
  AddressBloc get _bloc => BlocProvider.of<AddressBloc>(context);
  final AddressErrorMassage _addressErrorMassage = AddressErrorMassage();
  final AddressController _addressController = AddressController(
    name: TextEditingController(),
    area: TextEditingController(),
    street: TextEditingController(),
    building: TextEditingController(),
    floor: TextEditingController(),
    flat: TextEditingController(),
    addressDetails: TextEditingController(),
    remarks: TextEditingController(),
  );
  final AddressGlobalKey _addressGlobalKey = AddressGlobalKey(
    name: GlobalKey(),
    area: GlobalKey(),
    street: GlobalKey(),
    building: GlobalKey(),
    floor: GlobalKey(),
    flat: GlobalKey(),
  );
  int _areaId = 0;
  List<RequestType> _areas = [];
  RequestType _area = RequestType(id: 0, name: '');

  @override
  void initState() {
    _bloc.add(GetAreasEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state is AddressLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is AddressBackState) {
          Navigator.pop(context);
        } else if (state is AddressValidationNameEmptyState) {
          _animateTo(_addressGlobalKey.name);
          _addressErrorMassage.name = state.validationMessage;
        } else if (state is AddressValidationBuildingEmptyState) {
          _animateTo(_addressGlobalKey.building);
          _addressErrorMassage.building = state.validationMessage;
        } else if (state is AddressValidationFlatEmptyState) {
          _animateTo(_addressGlobalKey.flat);
          _addressErrorMassage.flat = state.validationMessage;
        } else if (state is AddressValidationFloorEmptyState) {
          _animateTo(_addressGlobalKey.floor);
          _addressErrorMassage.floor = state.validationMessage;
        } else if (state is AddressValidationStreetEmptyState) {
          _animateTo(_addressGlobalKey.street);
          _addressErrorMassage.street = state.validationMessage;
        } else if (state is AddressValidationAreaEmptyState) {
          _animateTo(_addressGlobalKey.area);
          _addressErrorMassage.area = state.validationMessage;
        } else if (state is AddressValidationNameValidState) {
          _addressErrorMassage.name = null;
        } else if (state is AddressValidationAreaValidState) {
          _addressErrorMassage.area = null;
        } else if (state is AddressValidationBuildingValidState) {
          _addressErrorMassage.building = null;
        } else if (state is AddressValidationFlatValidState) {
          _addressErrorMassage.flat = null;
        } else if (state is AddressValidationFloorValidState) {
          _addressErrorMassage.floor = null;
        } else if (state is AddressValidationStreetValidState) {
          _addressErrorMassage.street = null;
        } else if (state is AddressOpenAreaBottomSheetState) {
          _openAreaBottomSheet();
        } else if (state is GetAreasSuccessState) {
          _areas = state.areas;
        } else if (state is GetAreasErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(AddressBackEvent());
          });
        } else if (state is SelectAreaState) {
          _area = state.area;
          _addressController.area.text = state.area.name;
        } else if (state is AddressSubmitSuccessState) {
          _massageDialog(state.successMessage, () {
            _bloc.add(AddressBackEvent());
            _bloc.add(AddressBackEvent());
          });
        } else if (state is AddressSubmitErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(AddressBackEvent());
          });
        } else if (state is AddressDataFillingSuccessState) {
          showConfirmBackDialog(context);
        } else if (state is AddressDataFillingErrorState) {
          _pop(context);
        }else if (state is AddressClearAreaState){
          _area = RequestType(id: 0, name: '');
          _addressController.area.text = '';
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: (){
            _bloc.add(AddressDataFillingEvent(
              addressController: _addressController,
            ));
            return Future.value(true);
          },
          child: Scaffold(
            appBar: buildAppBarWidget(context,
                title: S.of(context).address,
                isHaveBackButton: true, onBackButtonPressed: () {
                  _bloc.add(AddressDataFillingEvent(
                    addressController: _addressController,
                  ));
            }),
            body: AddressContentWidget(
              addressController: _addressController,
              addressErrorMassage: _addressErrorMassage,
              addressGlobalKey: _addressGlobalKey,
              addressFunctions: AddressFunctions(onChangeName: (String value) {
                _addressController.name.text = value;
                _bloc.add(AddressValidationNameEvent(value: value));
              }, onChangeBuilding: (String value) {
                _addressController.building.text = value;
                _bloc.add(AddressValidationBuildingEvent(value: value));
              }, onChangeFlat: (String value) {
                _addressController.flat.text = value;
                _bloc.add(AddressValidationFlatEvent(value: value));
              }, onChangeFloor: (String value) {
                _addressController.floor.text = value;
                _bloc.add(AddressValidationFloorEvent(value: value));
              }, onChangeStreet: (String value) {
                _addressController.street.text = value;
                _bloc.add(AddressValidationStreetEvent(value: value));
              }, onTapArea: () {
                _bloc.add(AddressOpenAreaBottomSheetEvent());
              }, onTapSubmit: () {
                _bloc.add(AddressSubmitEvent(
                    addressController: _addressController, areaId: _areaId));
              }, onClearArea: () {
               _bloc.add(AddressClearAreaEvent());


              }),
            ),
          ),
        );
      },
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

  void _openAreaBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestTypeBottomSheetWidget(
        requestTypes: _areas,
        requestType: _area,
      ),
      titleLabel: S.of(context).area,
    ).then((value) {
      if (value != null) {
        _area = value;
        _areaId = _area.id;
        _bloc.add(SelectAreaEvent(
          area: value,
        ));
        _addressErrorMassage.area = null;
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

  void _pop(BuildContext context) {
    Navigator.pop(context);
  }
}
