import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/transaction_status.dart';

class GetHalfDayLeaveDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int halfDayLeaveTypeId;
  final String halfDayLeaveDate;
  final String startTime;
  final String endTime;
  final int noOfMinutes;
  final String reason;
  final String halfDayLeaveTypeName;
  final String remarks;
  final int basicSalaryAmount;
  final dynamic allowancesAmount;
  final dynamic remainingBalance;
  final int transactionStatusId;
  final int wfId;
  final String filePath;
  final String fileName;
  final String fileSource;
  final bool isEnabled;
  final String employeeName;
  final String companyName;
  final String halfDayLeaveName;
  final String transactionStatusName;
  final String currentWFLevelName;
  final TransactionStatus? transactionStatus;
  final Employee? employee;

  const GetHalfDayLeaveDetails({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.halfDayLeaveTypeId,
    required this.halfDayLeaveDate,
    required this.startTime,
    required this.endTime,
    required this.noOfMinutes,
    required this.reason,
    required this.remarks,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.remainingBalance,
    required this.transactionStatusId,
    required this.halfDayLeaveTypeName,
    required this.wfId,
    required this.filePath,
    required this.fileName,
    required this.fileSource,
    required this.isEnabled,
    required this.employeeName,
    required this.companyName,
    required this.halfDayLeaveName,
    required this.transactionStatusName,
    required this.currentWFLevelName,
    required this.transactionStatus,
    required this.employee,
  });
}
