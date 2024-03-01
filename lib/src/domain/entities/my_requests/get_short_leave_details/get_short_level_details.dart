import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/employer_short_leave_attachments.dart';

class GetShortLevelDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int shortLeaveTypeId;
  final String shortLeaveDate;
  final String startTime;
  final String endTime;
  final int noOfMinutes;
  final String reason;
  final String referenceName;
  final String referenceContactNo;
  final int currentBalance;
  final int remainingBalance;
  final String remarks;
  final int transactionStatusId;
  final int basicSalaryAmount;
  final int allowancesAmount;
  final String transactionStatusName;
  final Employee employee;
  final String shortLeaveTypeName;
  final List<EmployerShortLeaveAttachment> employeeShortLeaveAttachments;

  GetShortLevelDetails({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.shortLeaveTypeId,
    required this.shortLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.noOfMinutes,
    required this.reason,
    required this.referenceName,
    required this.referenceContactNo,
    required this.currentBalance,
    required this.remainingBalance,
    required this.remarks,
    required this.transactionStatusId,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.shortLeaveTypeName,
    required this.transactionStatusName,
    required this.employee,
    required this.employeeShortLeaveAttachments,
  });
}
