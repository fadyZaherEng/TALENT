class EmployeeIndemnityEncashmentAttachments {
  final int id;
  final int employeeIndemnityEncashmentId;
  final String filePath;
  final String fileName;
  final bool isDeleted;

  const EmployeeIndemnityEncashmentAttachments({
    required this.id,
    required this.employeeIndemnityEncashmentId,
    required this.filePath,
    required this.fileName,
    required this.isDeleted,
  });
}
