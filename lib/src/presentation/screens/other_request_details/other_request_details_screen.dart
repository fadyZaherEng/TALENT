import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/other_request_details.dart';
import 'package:talent_link/src/presentation/blocs/other_request_details/other_request_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/other_request_details/other_request_details_state.dart';
import 'package:talent_link/src/presentation/screens/other_request_details/widgets/other_request_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/other_request_details/widgets/other_request_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class OtherRequestDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const OtherRequestDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _OtherRequestDetailsScreenState();
}

class _OtherRequestDetailsScreenState
    extends BaseState<OtherRequestDetailsScreen> {
  OtherRequestDetailsBloc get _bloc =>
      BlocProvider.of<OtherRequestDetailsBloc>(context);
  GetOtherRequestDetails? getOtherRequestDetails;

  @override
  void initState() {
    _bloc.add(GetOtherRequestDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).otherRequest,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<OtherRequestDetailsBloc, OtherRequestDetailsState>(
        listener: (context, state) {
          if (state is GetOtherRequestDetailsSuccessState) {
            getOtherRequestDetails = state.getOtherRequestDetails;
          } else if (state is GetOtherRequestDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is GetOtherRequestDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is OtherRequestApproveSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetOtherRequestDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is OtherRequestRejectSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetOtherRequestDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is OtherRequestDetailsShowLoadingState) {
            showLoading();
          } else if (state is OtherRequestDetailsHideLoadingState) {
            hideLoading();
          }
        },
        builder: (context, state) {
          if (getOtherRequestDetails == null) {
            return OtherRequestDetailsShimmerWidget(
              referenceId: widget.referenceId,
              transactionId: widget.transactionId,
              isFromMyRequest: widget.isFromMyRequest,
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: OtherRequestDetailsContentWidget(
                  transactionId: widget.transactionId,
                  transactionStatusId:
                      getOtherRequestDetails?.transactionStatusId ?? 0,
                  transactionStatusName:
                      getOtherRequestDetails?.transactionStatusName ?? "",
                  referenceId: widget.referenceId,
                  isFromMyRequest: widget.isFromMyRequest,
                  getOtherRequestDetails: getOtherRequestDetails!,
                  onApprovePressed: () => _showReasonDialog(isRequired: false),
                  onRejectPressed: () => _showReasonDialog(isRequired: true)),
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
              ? _bloc.add(OtherRequestDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getOtherRequestDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(OtherRequestDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getOtherRequestDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
