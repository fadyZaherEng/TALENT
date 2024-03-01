import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty_details/resume_duty_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty_details/resume_duty_details_event.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty_details/resume_duty_details_state.dart';
import 'package:talent_link/src/presentation/screens/resume_duty_details/widgets/resume_duty_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/resume_duty_details/widgets/resume_duty_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class ResumeDutyDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const ResumeDutyDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestGetResumeDutyDetailsScreenState();
}

class _RequestGetResumeDutyDetailsScreenState
    extends BaseState<ResumeDutyDetailsScreen> {
  ResumeDutyDetailsBloc get _bloc =>
      BlocProvider.of<ResumeDutyDetailsBloc>(context);
  GetResumeDutyDetails? getResumeDutyDetails;

  @override
  void initState() {
    _bloc.add(GetResumeDutyDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).resumeDuty,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<ResumeDutyDetailsBloc, ResumeDutyDetailsState>(
        listener: (context, state) {
          if (state is GetResumeDutyDetailsSuccessState) {
            getResumeDutyDetails = state.getResumeDutyDetails;
          } else if (state is ResumeDutyDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is ResumeDutyDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is ResumeDutyDetailsApproveSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetResumeDutyDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is ResumeDutyDetailsRejectSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetResumeDutyDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is ResumeDutyDetailsHideLoadingState) {
            hideLoading();
          } else if (state is ResumeDutyDetailsShowLoadingState) {
            showLoading();
          }
        },
        builder: (context, state) {
          if (getResumeDutyDetails == null) {
            return ResumeDutyDetailsShimmerWidget(
                referenceId: widget.referenceId,
                transactionId: widget.transactionId);
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ResumDutyDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId:
                    getResumeDutyDetails?.transactionStatusId ?? 0,
                transactionStatusName:
                    getResumeDutyDetails?.transactionStatusName ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                getResumeDutyDetails: getResumeDutyDetails!,
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
              ? _bloc.add(ResumeDutyDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getResumeDutyDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(ResumeDutyDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getResumeDutyDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
