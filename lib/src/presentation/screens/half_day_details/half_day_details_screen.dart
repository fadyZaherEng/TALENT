import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/half_day_details.dart';
import 'package:talent_link/src/presentation/blocs/half_day_details/half_day_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/half_day_details/half_day_details_state.dart';
import 'package:talent_link/src/presentation/screens/half_day_details/widgets/half_day_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/half_day_details/widgets/half_day_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import '../../blocs/half_day_details/half_day_details_event.dart';

class HalfDayDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const HalfDayDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestGetHalfDayDetailsScreenState();
}

class _RequestGetHalfDayDetailsScreenState
    extends BaseState<HalfDayDetailsScreen> {
  HalfDayDetailsBloc get _bloc => BlocProvider.of<HalfDayDetailsBloc>(context);
  GetHalfDayLeaveDetails? getHalfDayDetails;

  @override
  void initState() {
    _bloc.add(GetHalfDayDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).halfDayLeave,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<HalfDayDetailsBloc, HalfDayDetailsState>(
        listener: (context, state) {
          if (state is GetHalfDayDetailsSuccessState) {
            getHalfDayDetails = state.getHalfDayDetails;
          } else if (state is GetHalfDayDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is GetHalfDayDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is HalfDayDetailsApproveSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetHalfDayDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is HalfDayDetailsRejectSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetHalfDayDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is HalfDayDetailsHideLoadingState) {
            hideLoading();
          } else if (state is HalfDayDetailsShowLoadingState) {
            showLoading();
          }
        },
        builder: (context, state) {
          if (getHalfDayDetails == null) {
            return HalfDayDetailsShimmerWidget(
              referenceId: widget.referenceId,
              transactionId: widget.transactionId,
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: HalfDayDetailsContentWidget(
                  transactionId: widget.transactionId,
                  transactionStatusId:
                      getHalfDayDetails?.transactionStatusId ?? 0,
                  transactionStatusName:
                      getHalfDayDetails?.transactionStatusName ?? "",
                  referenceId: widget.referenceId,
                  isFromMyRequest: widget.isFromMyRequest,
                  getHalfDayDetails: getHalfDayDetails!,
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
              ? _bloc.add(HalfDayDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getHalfDayDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(HalfDayDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getHalfDayDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
