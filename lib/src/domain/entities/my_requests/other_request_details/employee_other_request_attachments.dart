class EmployeeOtherRequestAttachments {
  final int id;
  final int employeeOtherRequestId;
  final String filePath;
  final String fileName;
  final bool isDeleted;

  const EmployeeOtherRequestAttachments({
    required this.id,
    required this.employeeOtherRequestId,
    required this.filePath,
    required this.fileName,
    required this.isDeleted,
  });
}
