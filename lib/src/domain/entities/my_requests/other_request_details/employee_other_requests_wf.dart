class EmployeeOtherRequestWF {
  final int id;
  final int employeeOtherRequestId;
  final int levelNo;
  final int actionUserId;
  final int wfStatusId;
  final String remarks;
  final String actionDate;
  final bool isDeleted;

  const EmployeeOtherRequestWF({
    required this.id,
    required this.employeeOtherRequestId,
    required this.levelNo,
    required this.actionUserId,
    required this.wfStatusId,
    required this.remarks,
    required this.actionDate,
    required this.isDeleted,
  });
}
