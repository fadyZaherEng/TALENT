class EmployeeLoanAttachments {
  final int id;
  final int employeeLoanId;
  final String filePath;
  final String fileName;
  final bool isDeleted;

  EmployeeLoanAttachments({
    required this.id,
    required this.employeeLoanId,
    required this.filePath,
    required this.fileName,
    required this.isDeleted,
  });
}
