class EmployerShortLeaveAttachment {
  final int id;
  final int employeeShortLeaveId;
  final String filePath;
  final String fileName;
  final bool isDeleted;

  EmployerShortLeaveAttachment({
    required this.id,
    required this.employeeShortLeaveId,
    required this.filePath,
    required this.fileName,
    required this.isDeleted,
  });
}
