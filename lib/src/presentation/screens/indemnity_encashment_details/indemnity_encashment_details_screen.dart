import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment_details/idemnity_encashment_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment_details/idemnity_encashment_details_event.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment_details/idemnity_encashment_details_state.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment_details/widgets/indemnity_encashment_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment_details/widgets/indemnity_encashment_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class IndemnityEncashmentDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const IndemnityEncashmentDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestGetIndemnityEncashmentDetailsScreenState();
}

class _RequestGetIndemnityEncashmentDetailsScreenState
    extends BaseState<IndemnityEncashmentDetailsScreen> {
  IndemnityEncashmentDetailsBloc get _bloc =>
      BlocProvider.of<IndemnityEncashmentDetailsBloc>(context);
  GetIndemnityEncashmentDetails? getIndemnityEncashmentDetails;

  @override
  void initState() {
    _bloc.add(GetIndemnityEncashmentDetailsEvent(
        transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).indemnityEncashment,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<IndemnityEncashmentDetailsBloc,
          IndemnityEncashmentDetailsState>(
        listener: (context, state) {
          if (state is GetIndemnityEncashmentDetailsSuccessState) {
            getIndemnityEncashmentDetails = state.getIndemnityEncashmentDetails;
          } else if (state is GetIndemnityEncashmentDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is GetIndemnityEncashmentDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is IndemnityEncashmentDetailsApproveSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetIndemnityEncashmentDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is IndemnityEncashmentDetailsRejectSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetIndemnityEncashmentDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is IndemnityEncashmentDetailsShowLoadingState) {
            showLoading();
          } else if (state is IndemnityEncashmentDetailsHideLoadingState) {
            hideLoading();
          }
        },
        builder: (context, state) {
          if (getIndemnityEncashmentDetails == null) {
            return IndemnityEncashmentDetailsShimmerWidget(
                referenceId: widget.referenceId,
                transactionId: widget.transactionId);
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: IndemnityEncashmentDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId:
                    getIndemnityEncashmentDetails?.transactionStatusId ?? 0,
                transactionStatusName:
                    getIndemnityEncashmentDetails?.transactionStatusName ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                getIndemnityEncashmentDetails: getIndemnityEncashmentDetails!,
                onApprovePressed: () => _showReasonDialog(isRequired: false),
                onRejectPressed: () => _showReasonDialog(isRequired: true),
              ),
            );
          }
        },
      ),
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
              ? _bloc.add(IndemnityEncashmentDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getIndemnityEncashmentDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(IndemnityEncashmentDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getIndemnityEncashmentDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
