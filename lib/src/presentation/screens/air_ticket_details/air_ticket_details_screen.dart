import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/git_air_ticket_details.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket_details/air_ticket_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket_details/air_ticket_details_state.dart';
import 'package:talent_link/src/presentation/screens/air_ticket_details/widgets/air_ticket_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/air_ticket_details/widgets/air_ticket_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class AirTicketDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const AirTicketDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestGetAirTicketDetailsScreenState();
}

class _RequestGetAirTicketDetailsScreenState
    extends BaseState<AirTicketDetailsScreen> {
  AirTicketDetailsBloc get _bloc =>
      BlocProvider.of<AirTicketDetailsBloc>(context);
  GetAirTicketDetails? getAirTicketDetails;

  @override
  void initState() {
    _bloc.add(GetAirTicketDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).airTicket,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<AirTicketDetailsBloc, AirTicketDetailsState>(
        listener: (context, state) {
          if (state is GetAirTicketDetailsSuccessState) {
            getAirTicketDetails = state.getAirTicketDetails;
          } else if (state is GetAirTicketDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is GetAirTicketDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is AirTicketDetailsApproveSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetAirTicketDetailsEvent(
                      transactionId: widget.transactionId));
                });
            _bloc.add(
                GetAirTicketDetailsEvent(transactionId: widget.transactionId));
          } else if (state is AirTicketDetailsRejectSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetAirTicketDetailsEvent(
                      transactionId: widget.transactionId));
                });
            _bloc.add(
                GetAirTicketDetailsEvent(transactionId: widget.transactionId));
          } else if (state is AirTicketDetailsShowLoadingState) {
            showLoading();
          } else if (state is AirTicketDetailsHideLoadingState) {
            hideLoading();
          }
        },
        builder: (context, state) {
          if (getAirTicketDetails == null) {
            return AirTicketDetailsShimmerWidget(
                referenceId: widget.referenceId,
                transactionId: widget.transactionId);
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AirTicketDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId:
                    getAirTicketDetails?.transactionStatusId ?? 0,
                transactionStatusName:
                    getAirTicketDetails?.transactionStatusName ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                getAirTicketDetails: getAirTicketDetails!,
                onApprovePressed: () => _showReasonDialog(isRequired: false),
                onRejectPressed: () => _showReasonDialog(isRequired: true),
              ),
            );
          }
        },
      ),
    );
  }

  void _pop() {
    Navigator.pop(context);
  }

  void _massageDialog({required String massage, required Function() onTap}) {
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
              ? _bloc.add(AirTicketDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getAirTicketDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(AirTicketApproveDetailsEvent(
                  transactionId: widget.transactionId,
                  employeeId: getAirTicketDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
