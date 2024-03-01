class EducationFunctions {
  final Function() onTapQualificationType;
  final Function(String value) onChangeQualificationPlaceName;
  final Function() onTapCountry;
  final void Function(String value) onPickIssueDate;
  final Function() onDeleteIssueDate;
  final void Function(String value) onPickExpiryDate;
  final Function() onDeleteExpiryDate;
  final Function(String value) onChangeRemarks;
  final Function() showUploadFileBottomSheet;
  final Function(String file) deleteFileAction;
  final Function() onTapSubmit;

  EducationFunctions({
    required this.onTapQualificationType,
    required this.onChangeQualificationPlaceName,
    required this.onTapCountry,
    required this.onPickIssueDate,
    required this.onDeleteIssueDate,
    required this.onPickExpiryDate,
    required this.onDeleteExpiryDate,
    required this.onChangeRemarks,
    required this.showUploadFileBottomSheet,
    required this.deleteFileAction,
    required this.onTapSubmit,
  });
}
