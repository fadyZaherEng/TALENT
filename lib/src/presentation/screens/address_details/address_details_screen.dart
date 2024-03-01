import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';
import 'package:talent_link/src/presentation/blocs/address_details/address_details_bloc.dart';
import 'package:talent_link/src/presentation/screens/address_details/widgets/address_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/address_details/widgets/address_details_skeleton_widget.dart';
import 'package:talent_link/src/presentation/screens/attachment_details/widgets/attachment_details_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class AddressDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  AddressDetailsScreen({
    required this.transactionId,
    required this.referenceId,
    required this.isFromMyRequest,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends BaseState<AddressDetailsScreen> {
  AddressDetailsBloc get _bloc => BlocProvider.of<AddressDetailsBloc>(context);
  AddressDetails? _addressDetails;

  @override
  void initState() {
    _bloc.add(GetAddressDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).address,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<AddressDetailsBloc, AddressDetailsState>(
          listener: (context, state) {
        if (state is AddressDetailsLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is AddressDetailsSuccessState) {
          _addressDetails = state.addressDetails;
        } else if (state is AddressDetailsErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is AddressDetailsApproveErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is AddressDetailsRejectErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is AddressDetailsApproveSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetAddressDetailsEvent(
                    transactionId: widget.transactionId));
              });
        } else if (state is AddressDetailsRejectSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetAddressDetailsEvent(
                    transactionId: widget.transactionId));
              });
        }
      }, builder: (context, state) {
        if (_addressDetails == null) {
          return AttachmentDetailsSkeletonWidget(
              isFromMyRequest: widget.isFromMyRequest);
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AddressDetailsContentWidget(
              addressDetails: _addressDetails!,
              isFromMyRequest: widget.isFromMyRequest,
              transactionId: widget.transactionId,
              referenceId: widget.referenceId,
              onApprovePressed: () => _showReasonDialog(isRequired: false),
              onRejectPressed: () => _showReasonDialog(isRequired: true),
            ),
          );
        }
      }),
    );
  }

  void _pop() => Navigator.pop(context);

  void _massageDialog({
    required String massage,
    required Function() onTap,
  }) {
    showMassageDialogWidget(
      context: context,
      text: massage,
      icon: ImagePaths.profile,
      buttonText: S.of(context).ok,
      onTap: onTap,
    );
  }

  void _showReasonDialog({
    required bool isRequired,
  }) {
    showReasonDialogWidget(
        context: context,
        primaryAction: (String reason) {
          _pop();
          isRequired
              ? _bloc.add(AddressDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: _addressDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(AddressDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: _addressDetails!.employeeId,
                  referenceId: widget.referenceId,
                ));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
