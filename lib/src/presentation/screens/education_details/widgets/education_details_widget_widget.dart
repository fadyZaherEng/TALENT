import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationDetailsWidget extends StatefulWidget {
  final EducationDetails educationDetails;

  const EducationDetailsWidget({
    super.key,
    required this.educationDetails,
  });

  @override
  State<EducationDetailsWidget> createState() => _EducationDetailsWidgetState();
}

class _EducationDetailsWidgetState extends State<EducationDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7),
          color: ColorSchemes.white,
          boxShadow: [
            BoxShadow(
              color: ColorSchemes.gray.withOpacity(0.13),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Column(
            children: [
              _getRequestDetailsItemContent(
                text: S.of(context).qualificationTypeName,
                value: widget.educationDetails.qualificationPlaceName!,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).countryName,
                value: widget.educationDetails.countryName!,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).issueDate,
                value: widget.educationDetails.issueDate!.split('T')[0],
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).expiryDate,
                value: widget.educationDetails.expiryDate!.split('T')[0],
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).transactionStatusName,
                value: widget.educationDetails.transactionStatusName!,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).remarks,
                value: widget.educationDetails.remarks!,
              ),
              const SizedBox(height: 20),
              _fileWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRequestDetailsItemContent({
    required String text,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.grayText,
                fontWeight: Constants.fontWeightRegular),
            maxLines: 1,
          ),
        ),
        Text(
          textAlign: TextAlign.start,
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: Constants.fontWeightMedium,
                color: ColorSchemes.black,
              ),
          maxLines: 20,
        ),
      ],
    );
  }

  Widget _fileWidget() {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Text(
            S.of(context).file,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.grayText,
                fontWeight: Constants.fontWeightRegular),
            maxLines: 1,
          ),
        ),
        InkWell(
          onTap: () => _launchPdf(widget.educationDetails),
          child: Text(
            textAlign: TextAlign.start,
            S.of(context).openFile,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.redError,
                fontWeight: Constants.fontWeightRegular),
          ),
        ),
      ],
    );
  }

  void _launchPdf(EducationDetails educationDetails) async {
    if (educationDetails.attachmentUpdateRequestAttachments != null &&
        educationDetails.attachmentUpdateRequestAttachments!.isNotEmpty) {
      await canLaunchUrl(Uri.parse(educationDetails
              .attachmentUpdateRequestAttachments![0].filePath!))
          ? launchUrl(Uri.parse(educationDetails
              .attachmentUpdateRequestAttachments![0].filePath!))
          : launch(educationDetails
              .attachmentUpdateRequestAttachments![0].filePath!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(S.of(context).fileIsEmpty,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.white,
                fontWeight: Constants.fontWeightRegular)),
        backgroundColor: ColorSchemes.primary,
      ));
    }
  }
}
