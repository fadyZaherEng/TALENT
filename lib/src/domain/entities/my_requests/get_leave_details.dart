import 'package:talent_link/src/domain/entities/my_requests/employee.dart';

class GetLeaveDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int leaveTypeId;
  final String leaveStartDate;
  final String leaveEndDate;
  final String expectedResumeDuty;
  final bool isByPayroll;
  final int paymentMethodId;
  final String remarks;
  final String leaveReason;
  final int alternativeEmployeeId;
  final String emergencyContactNo;
  final String addressDuringLeave;
  final bool isExtendedLeave;
  final int extendedEmployeeLeaveId;
  final int totalAmount;
  final bool isByCurrentBalance;
  final double currentBalance;
  final double yearlyBalance;
  final double remainingBalance;
  final double basicSalaryAmount;
  final double allowancesAmount;
  final int leaveDays;
  final int transactionStatusId;
  final String transactionStatusName;
  final String leaveTypeName;
  final int wfId;
  final Employee employee;
  final bool isAllowYearlyBalance;

  GetLeaveDetails({
    required this.id,
    required this.leaveTypeName,
    required this.companyId,
    required this.employeeId,
    required this.leaveTypeId,
    required this.leaveStartDate,
    required this.leaveEndDate,
    required this.expectedResumeDuty,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.remarks,
    required this.leaveReason,
    required this.alternativeEmployeeId,
    required this.emergencyContactNo,
    required this.addressDuringLeave,
    required this.isExtendedLeave,
    required this.extendedEmployeeLeaveId,
    required this.totalAmount,
    required this.isByCurrentBalance,
    required this.currentBalance,
    required this.yearlyBalance,
    required this.remainingBalance,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.leaveDays,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.wfId,
    required this.employee,
    required this.isAllowYearlyBalance,
  });
}
