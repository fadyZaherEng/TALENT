import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:url_launcher/url_launcher.dart';

class AttachmentDetailsWidget extends StatefulWidget {
  final AttachmentDetails attachmentDetails;

  const AttachmentDetailsWidget({
    super.key,
    required this.attachmentDetails,
  });

  @override
  State<AttachmentDetailsWidget> createState() =>
      _AttachmentDetailsWidgetState();
}

class _AttachmentDetailsWidgetState extends State<AttachmentDetailsWidget> {
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
                text: S.of(context).documentNo,
                value: widget.attachmentDetails.documentNo!,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).attachmentTypeName,
                value: widget.attachmentDetails.attachmentTypeName!,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).issueDate,
                value: widget.attachmentDetails.issueDate!.split('T')[0],
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).expiryDate,
                value: widget.attachmentDetails.expiryDate!.split('T')[0],
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).transactionStatusName,
                value: widget.attachmentDetails.transactionStatusName!,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).remarks,
                value: widget.attachmentDetails.remarks!,
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
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.grayText,
                fontWeight: Constants.fontWeightRegular),
            maxLines: 1,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: Constants.fontWeightMedium,
                  color: ColorSchemes.black,
                ),
            maxLines: 10,
          ),
        ),
      ],
    );
  }

  Widget _fileWidget() {
    return Row(
      children: [
        Expanded(
          child: Text(
            S.of(context).file,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.grayText,
                fontWeight: Constants.fontWeightRegular),
            maxLines: 1,
          ),
        ),
        InkWell(
          onTap: () => _launchPdf(widget.attachmentDetails),
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

  void _launchPdf(AttachmentDetails attachmentDetails) async {
    if (attachmentDetails.attachmentUpdateRequestAttachments != null &&
        attachmentDetails.attachmentUpdateRequestAttachments!.isNotEmpty) {
      await canLaunchUrl(Uri.parse(attachmentDetails
              .attachmentUpdateRequestAttachments![0].filePath!))
          ? launchUrl(Uri.parse(attachmentDetails
              .attachmentUpdateRequestAttachments![0].filePath!))
          : launch(attachmentDetails
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
