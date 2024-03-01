import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';
import 'package:talent_link/src/presentation/blocs/short_leave_details/short_leave_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/short_leave_details/short_leave_details_state.dart';
import 'package:talent_link/src/presentation/screens/request_details_short_leave/widgets/shore_leave_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/screens/request_details_short_leave/widgets/short_leave_details_body_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class ShortLeaveDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const ShortLeaveDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestDetailsShortLeaveScreenState();
}

class _RequestDetailsShortLeaveScreenState
    extends BaseState<ShortLeaveDetailsScreen> {
  ShortLeaveDetailsBloc get _bloc =>
      BlocProvider.of<ShortLeaveDetailsBloc>(context);
  GetShortLevelDetails? getShortLevelDetails;

  @override
  void initState() {
    _bloc.add(GetShortLeaveDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).shortLeave,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<ShortLeaveDetailsBloc, ShortLeaveDetailsState>(
        listener: (context, state) {
          if (state is GetShortLeaveDetailsSuccessState) {
            getShortLevelDetails = state.getShortLevelDetails;
          } else if (state is ShortLeaveDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is ShortLeaveDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is ShortLeaveDetailsApproveState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetShortLeaveDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is ShortLeaveDetailsRejectState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetShortLeaveDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is ShortLeaveDetailsShowLoadingState) {
            showLoading();
          } else if (state is ShortLeaveDetailsHideLoadingState) {
            hideLoading();
          }
        },
        builder: (context, state) {
          if (getShortLevelDetails == null) {
            return ShortLeaveDetailsShimmerWidget(
              referenceId: widget.referenceId,
              transactionId: widget.transactionId,
              isFromMyRequest: widget.isFromMyRequest,
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ShortLeaveDetailsContentWidget(
                getShortLevelDetails: getShortLevelDetails!,
                referenceId: widget.referenceId,
                transactionStatusName:
                    getShortLevelDetails?.transactionStatusName ?? "",
                transactionStatusId:
                    getShortLevelDetails?.transactionStatusId ?? 0,
                transactionId: widget.transactionId,
                isFromMyRequest: widget.isFromMyRequest,
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
              ? _bloc.add(ShortLeaveDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getShortLevelDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(ShortLeaveDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getShortLevelDetails!.employeeId,
                  referenceId: widget.referenceId,
                ));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
