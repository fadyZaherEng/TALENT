import 'package:flutter/material.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';
import 'package:talent_link/src/presentation/screens/education_details/widgets/education_details_widget_widget.dart';

class EducationDetailsContentWidget extends StatelessWidget {
  final EducationDetails educationDetails;
  final bool isFromMyRequest;
  final int transactionId;
  final int referenceId;
  final void Function() onApprovePressed;
  final void Function() onRejectPressed;

  const EducationDetailsContentWidget({
    super.key,
    required this.educationDetails,
    required this.isFromMyRequest,
    required this.transactionId,
    required this.referenceId,
    required this.onApprovePressed,
    required this.onRejectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EducationDetailsWidget(educationDetails: educationDetails),
        ]);
  }
}
