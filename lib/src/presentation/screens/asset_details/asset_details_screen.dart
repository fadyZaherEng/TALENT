import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/asset_details/asset_details.dart';
import 'package:talent_link/src/presentation/blocs/asset_details/asset_details_bloc.dart';
import 'package:talent_link/src/presentation/screens/asset_details/widgets/asset_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/attachment_details/widgets/attachment_details_skeleton_widget.dart';
import 'package:talent_link/src/presentation/screens/resume_duty_details/widgets/resume_duty_details_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class AssetDetailsScreen extends BaseStatefulWidget {
  final int transactionId, referenceId;
  final bool isFromMyRequest;

  const AssetDetailsScreen(
      {super.key,
      required this.referenceId,
      required this.transactionId,
      required this.isFromMyRequest});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AssetDetailsScreenState();
}

class _AssetDetailsScreenState extends BaseState<AssetDetailsScreen> {
  AssetDetailsBloc get _bloc => BlocProvider.of<AssetDetailsBloc>(context);

  @override
  void initState() {
    print(widget.transactionId);
    _bloc.add(GetAssetDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  AssetDetails? assetDetails;

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).assetDetails,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<AssetDetailsBloc, AssetDetailsState>(
        listener: (context, state) {
          if (state is SuccessGetAssetDetailsDataState) {
            assetDetails = state.assetDetails;
          } else if (state is AssetDetailsErrorDataState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is AssetDetailsErrorState) {
            _massageDialog(massage: state.errorMSG, onTap: () => _pop());
          } else if (state is AssetDetailsApproveSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetAssetDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is AssetDetailsRejectSuccessState) {
            _massageDialog(
                massage: state.dataSuccess.message.toString(),
                onTap: () {
                  _pop();
                  _bloc.add(GetAssetDetailsEvent(
                      transactionId: widget.transactionId));
                });
          } else if (state is AssetDetailsHideLoadingState) {
            hideLoading();
          } else if (state is AssetDetailsShowLoadingState) {
            showLoading();
          }
        },
        builder: (context, state) {
          if (assetDetails == null) {
            return AttachmentDetailsSkeletonWidget(
              isFromMyRequest: widget.isFromMyRequest,
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AssetDetailsContentWidget(
                transactionId: widget.transactionId,
                transactionStatusId: assetDetails?.statusId ?? -1,
                transactionStatusName: assetDetails?.status ?? "",
                referenceId: widget.referenceId,
                isFromMyRequest: widget.isFromMyRequest,
                assetDetails: assetDetails!,
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
              ? _bloc.add(AssetRejectRequestEvent(
                  transactionId: widget.transactionId,
                  employeeId: assetDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(AssetApproveRequestEvent(
                  transactionId: widget.transactionId,
                  employeeId: assetDetails!.employeeId,
                  referenceId: widget.referenceId));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
