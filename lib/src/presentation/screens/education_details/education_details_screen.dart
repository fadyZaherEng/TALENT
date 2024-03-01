import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_reason_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';
import 'package:talent_link/src/presentation/blocs/education_details/education_details_bloc.dart';
import 'package:talent_link/src/presentation/screens/education_details/widgets/education_details_content_widget.dart';
import 'package:talent_link/src/presentation/screens/education_details/widgets/education_details_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class EducationDetailsScreen extends BaseStatefulWidget {
  final int transactionId;
  final int referenceId;
  final bool isFromMyRequest;

  EducationDetailsScreen(
      {required this.transactionId,
      required this.referenceId,
      required this.isFromMyRequest});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends BaseState<EducationDetailsScreen> {
  EducationDetailsBloc get _bloc =>
      BlocProvider.of<EducationDetailsBloc>(context);
  EducationDetails? _educationDetails;

  @override
  void initState() {
    _bloc.add(GetEducationDetailsEvent(transactionId: widget.transactionId));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).education,
          isHaveBackButton: true, onBackButtonPressed: () {
        _pop();
      }),
      body: BlocConsumer<EducationDetailsBloc, EducationDetailsState>(
          listener: (context, state) {
        if (state is EducationDetailsLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is EducationDetailsSuccessState) {
          _educationDetails = state.educationDetails;
        } else if (state is EducationDetailsErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is EducationDetailsApproveErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is EducationDetailsRejectErrorState) {
          _massageDialog(massage: state.errorMessage, onTap: () => _pop());
        } else if (state is EducationDetailsApproveSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetEducationDetailsEvent(
                    transactionId: widget.transactionId));
              });
        } else if (state is EducationDetailsRejectSuccessState) {
          _massageDialog(
              massage: state.dataSuccess.message.toString(),
              onTap: () {
                _pop();
                _bloc.add(GetEducationDetailsEvent(
                    transactionId: widget.transactionId));
              });
        }
      }, builder: (context, state) {
        if (_educationDetails == null) {
          return EducationDetailsSkeletonWidget(
              isFromMyRequest: widget.isFromMyRequest);
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: EducationDetailsContentWidget(
              educationDetails: _educationDetails!,
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
              ? _bloc.add(EducationDetailsRejectEvent(
                  transactionId: widget.transactionId,
                  employeeId: _educationDetails!.employeeId!,
                  referenceId: widget.referenceId))
              : _bloc.add(EducationDetailsApproveEvent(
                  transactionId: widget.transactionId,
                  employeeId: _educationDetails!.employeeId!,
                  referenceId: widget.referenceId,
                ));
        },
        secondaryAction: () => _pop(),
        isRequired: isRequired);
  }
}
