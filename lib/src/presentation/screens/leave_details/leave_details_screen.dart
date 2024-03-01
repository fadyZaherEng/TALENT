import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';
import 'package:talent_link/src/presentation/blocs/leave_details/leave_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave_details/leave_details_state.dart';
import 'package:talent_link/src/presentation/screens/leave_details/widgets/leave_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/leave_details/widgets/leave_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class LeaveDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const LeaveDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestLeaveDetailsScreenState();
}

class _RequestLeaveDetailsScreenState
    extends BaseState<LeaveDetailsScreen> {
  LeaveDetailsBloc get _bloc =>
      BlocProvider.of<LeaveDetailsBloc>(context);
  GetLeaveDetails? getLeaveDetails;
  final TextEditingController _reasonControl = TextEditingController();

  @override
  void initState() {
    _bloc.add(GetLeaveDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).leave,
          isHaveBackButton: true, onBackButtonPressed: () {
        _popEvent();
      }),
      body: BlocConsumer<LeaveDetailsBloc, LeaveDetailsState>(
        listener: (context, state) {
          if (state is GetLeaveDetailsSuccessState) {
            getLeaveDetails = state.getLeaveDetails;
          } else if (state is LeaveDetailsErrorState) {
            _massageDialog(massage: state.errorMSG);
          } else if (state is LeaveDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG);
          } else if (state is LeaveDetailsApproveState) {
            _massageDialog(massage: state.dataSuccess.message.toString());
            _bloc.add(
                GetLeaveDetailsEvent(transactionId: widget.transactionId));
          } else if (state is LeaveDetailsRejectState) {
            _massageDialog(massage: state.dataSuccess.message.toString());
            _bloc.add(
                GetLeaveDetailsEvent(transactionId: widget.transactionId));
          } else if (state is LeaveDetailsShowLoadingState) {
            showLoading();
          } else if (state is LeaveDetailsHideLoadingState) {
            hideLoading();
          } else if (state is LeaveDetailsPopState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (getLeaveDetails == null) {
            return LeaveDetailsShimmerWidget(
                referenceId: widget.referenceId,
                transactionId: widget.transactionId);
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: LeaveDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId: getLeaveDetails?.transactionStatusId ?? 0,
                transactionStatusName:
                    getLeaveDetails?.transactionStatusName ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                getLeaveDetails: getLeaveDetails!,
                onApprovePressed: () => _showReasonDialog(isRequired: false),
                onRejectPressed: () => _showReasonDialog(isRequired: true),
              ),
            );
          }
        },
      ),
    );
  }

  void _popEvent() => _bloc.add(LeaveDetailsPopEvent());

  void _massageDialog({
    required String massage,
  }) {
    showMassageDialogWidget(
      context: context,
      text: massage,
      icon: ImagePaths.profile,
      buttonText: S.of(context).ok,
      onTap: _popEvent,
    );
  }

  void _showReasonDialog({
    required bool isRequired,
  }) {
    showReasonDialogWidget(
        context: context,
        primaryAction: (String reason) {
          _popEvent();
          isRequired
              ? _bloc.add(LeaveDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getLeaveDetails!.employeeId,
                  referenceId: widget.referenceId,
                  reason: _reasonControl.text))
              : _bloc.add(LeaveDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getLeaveDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _popEvent(),
        isRequired: isRequired);
  }
}
