import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/get_leave_encashment_details.dart';
import 'package:talent_link/src/presentation/blocs/leave_encashment_details/leave_encashment_details_bloc.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment_details/widgets/leave_encashment_details__shimmer_widget.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment_details/widgets/leave_encashment_details_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class LeaveEncashmentDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const LeaveEncashmentDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestDetailsEncashmenteScreenState();
}

class _RequestDetailsEncashmenteScreenState
    extends BaseState<LeaveEncashmentDetailsScreen> {
  LeaveEncashmentDetailsBloc get _bloc =>
      BlocProvider.of<LeaveEncashmentDetailsBloc>(context);
  GetLeaveEncashmentDetails? getLeaveEncashmentDetails;

  @override
  void initState() {
    _bloc.add(
        GetLeaveEncashmentDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).leaveEncashment,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body:
          BlocConsumer<LeaveEncashmentDetailsBloc, LeaveEncashmentDetailsState>(
        listener: (context, state) {
          if (state is GetLeaveEncashmentDetailsSuccessState) {
            getLeaveEncashmentDetails = state.getLeaveEncashmentDetails;
          } else if (state is LeaveEncashmentDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is LeaveEncashmentDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is LeaveEncashmentDetailsApproveState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetLeaveEncashmentDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is LeaveEncashmentDetailsRejectState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetLeaveEncashmentDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is LeaveEncashmentDetailsShowLoadingState) {
            showLoading();
          } else if (state is LeaveEncashmentDetailsHideLoadingState) {
            hideLoading();
          }
        },
        builder: (context, state) {
          if (getLeaveEncashmentDetails == null) {
            return LeaveEncashmentDetailsShimmerWidget(
              referenceId: widget.referenceId,
              transactionId: widget.transactionId,
              isFromMyRequest: widget.isFromMyRequest,
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: LeaveEncashmentDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId:
                    getLeaveEncashmentDetails?.transactionStatusId ?? 0,
                transactionStatusName:
                    getLeaveEncashmentDetails?.transactionStatusName ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                getLeaveEncashmentDetails: getLeaveEncashmentDetails!,
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
              ? _bloc.add(LeaveEncashmentDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getLeaveEncashmentDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(LeaveEncashmentDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getLeaveEncashmentDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
