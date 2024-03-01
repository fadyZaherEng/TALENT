import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:talent_link/src/presentation/blocs/attachment_details/attachment_details_bloc.dart';
import 'package:talent_link/src/presentation/screens/attachment_details/widgets/attachment_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/attachment_details/widgets/attachment_details_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class AttachmentDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  AttachmentDetailsScreen({
    required this.transactionId,
    required this.referenceId,
    required this.isFromMyRequest,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _AttachmentDetailsScreenState();
}

class _AttachmentDetailsScreenState extends BaseState<AttachmentDetailsScreen> {
  AttachmentDetailsBloc get _bloc =>
      BlocProvider.of<AttachmentDetailsBloc>(context);
  AttachmentDetails? _attachmentDetails;

  @override
  void initState() {
    _bloc.add(GetAttachmentDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).attachment,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<AttachmentDetailsBloc, AttachmentDetailsState>(
          listener: (context, state) {
        if (state is AttachmentDetailsLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is AttachmentDetailsSuccessState) {
          _attachmentDetails = state.attachmentDetails;
        } else if (state is AttachmentDetailsErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is AttachmentDetailsApproveErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is AttachmentDetailsRejectErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is AttachmentDetailsApproveSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetAttachmentDetailsEvent(
                    transactionId: widget.transactionId));
              });
        } else if (state is AttachmentDetailsRejectSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetAttachmentDetailsEvent(
                    transactionId: widget.transactionId));
              });
        }
      }, builder: (context, state) {
        if (_attachmentDetails == null) {
          return AttachmentDetailsSkeletonWidget(
              isFromMyRequest: widget.isFromMyRequest);
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AttachmentDetailsContentWidget(
              attachmentDetails: _attachmentDetails!,
              isFromMyRequest: widget.isFromMyRequest,
              transactionId: widget.transactionId,
              referenceId: widget.referenceId,
              onApprovePressed: () => _showReasonDialog(isRequired: false),
              onRejectPressed: () => _showReasonDialog(isRequired: true),
            ),
          );
        }
      }),
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
              ? _bloc.add(AttachmentDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: _attachmentDetails!.employeeId!,
                  referenceId: widget.referenceId))
              : _bloc.add(AttachmentDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: _attachmentDetails!.employeeId!,
                  referenceId: widget.referenceId,
                ));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
