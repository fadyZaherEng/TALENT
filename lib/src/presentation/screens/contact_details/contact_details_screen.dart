import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/contact_details/contact_details.dart';
import 'package:talent_link/src/presentation/screens/contact_details/widgets/contact_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/contact_details/widgets/contact_details_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

import '../../blocs/contact_details/contact_details_bloc.dart';

class ContactDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  ContactDetailsScreen({
    required this.transactionId,
    required this.referenceId,
    required this.isFromMyRequest,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends BaseState<ContactDetailsScreen> {
  ContactDetailsBloc get _bloc => BlocProvider.of<ContactDetailsBloc>(context);

  ContactDetails? _contactDetails;

  @override
  void initState() {
    _bloc.add(GetContactDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).contact,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<ContactDetailsBloc, ContactDetailsState>(
          listener: (context, state) {
        if (state is ContactDetailsLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is ContactDetailsSuccessState) {
          _contactDetails = state.contactDetails;
        } else if (state is ContactDetailsErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is ContactDetailsApproveErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is ContactDetailsRejectErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is ContactDetailsApproveSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetContactDetailsEvent(
                    transactionId: widget.transactionId));
              });
        } else if (state is ContactDetailsRejectSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetContactDetailsEvent(
                    transactionId: widget.transactionId));
              });
        }
      }, builder: (context, state) {
        if (_contactDetails == null) {
          return ContactDetailsSkeletonWidget(
              isFromMyRequest: widget.isFromMyRequest);
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ContactDetailsContentWidget(
              contactDetails: _contactDetails!,
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
              ? _bloc.add(ContactDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: _contactDetails!.employeeId,
                  referenceId: widget.referenceId))
              : _bloc.add(ContactDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: _contactDetails!.employeeId,
                  referenceId: widget.referenceId,
                ));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
