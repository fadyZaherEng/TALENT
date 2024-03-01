class AttachmentFunctions {
  final Function() onTapAttachmentType;
  final Function(String value) onChangeDocumentNumber;
  final void Function(String value) onPickIssueDate;
  final Function() onDeleteIssueDate;
  final void Function(String value) onPickExpiryDate;
  final Function() onDeleteExpiryDate;
  final Function() showUploadFileBottomSheet;
  final Function(String file) deleteFileAction;
  final Function() onTapSubmit;

  AttachmentFunctions({
    required this.onTapAttachmentType,
    required this.onChangeDocumentNumber,
    required this.onPickIssueDate,
    required this.onDeleteIssueDate,
    required this.onPickExpiryDate,
    required this.onDeleteExpiryDate,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
    required this.onTapSubmit,
  });
}