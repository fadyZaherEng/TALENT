import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';
import 'package:talent_link/src/presentation/blocs/loan_details/loan_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/loan_details/loan_details_state.dart';
import 'package:talent_link/src/presentation/screens/loan_details/widgets/loan_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/loan_details/widgets/loan_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class LoanDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  const LoanDetailsScreen({
    super.key,
    this.isFromMyRequest = false,
    required this.transactionId,
    required this.referenceId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _RequestLoanDetailsScreenState();
}

class _RequestLoanDetailsScreenState extends BaseState<LoanDetailsScreen> {
  LoanDetailsBloc get _bloc => BlocProvider.of<LoanDetailsBloc>(context);
  GetLoanDetails? getLoanDetails;

  @override
  void initState() {
    _bloc.add(GetLoanDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).loans,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<LoanDetailsBloc, LoanDetailsState>(
        listener: (context, state) {
          if (state is RequstDetailsLoanSuccessState) {
            getLoanDetails = state.getLoanDetails;
          } else if (state is RequstDetailsLoanErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is RequstDetailsLoanErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is RequstDetailsLoanApproveState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(
                      GetLoanDetailsEvent(transactionId: widget.transactionId));
                });
          } else if (state is RequstDetailsLoanRejectState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(
                      GetLoanDetailsEvent(transactionId: widget.transactionId));
                });
          } else if (state is RequestDetailsLoanShowLoading) {
            showLoading();
          } else if (state is RequestDetailsLoanHideLoading) {
            hideLoading();
          }
        },
        builder: (context, state) {
          if (getLoanDetails == null) {
            return LoanDetailsShimmerWidget(
                referenceId: widget.referenceId,
                transactionId: widget.transactionId);
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: LoanDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId: getLoanDetails?.transactionStatusId ?? 0,
                transactionStatusName:
                    getLoanDetails?.transactionStatusName ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                getLoanDetails: getLoanDetails!,
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
              ? _bloc.add(LoanDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: getLoanDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(LoanDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: getLoanDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
