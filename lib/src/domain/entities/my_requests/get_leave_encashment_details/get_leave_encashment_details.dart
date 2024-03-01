import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/employee_leave_encashment_wf.dart';

class GetLeaveEncashmentDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int leaveEncashmentId;
  final int encashmentLeaveTypeId;
  final bool isByPayroll;
  final int paymentMethodId;
  final String requestedDate;
  final String encashmentLeaveTypeName;
  final int requestedDays;
  final double totalAmount;
  final bool isByCurrentBalance;
  final double currentBalance;
  final int yearlyBalance;
  final double remainingBalance;
  final double basicSalaryAmount;
  final double allowancesAmount;
  final String remarks;
  final int transactionStatusId;
  final String transactionStatusName;
  final int wfId;
  final Employee? employee;
  final List<EmployeeLeaveEncashmentWF> employeeLeaveEncashmentWF;
  final bool isAllowYearlyBalance;

  GetLeaveEncashmentDetails(
    this.id,
    this.companyId,
    this.employeeId,
    this.leaveEncashmentId,
    this.encashmentLeaveTypeId,
    this.isByPayroll,
    this.paymentMethodId,
    this.requestedDate,
    this.requestedDays,
    this.totalAmount,
    this.isByCurrentBalance,
    this.currentBalance,
    this.yearlyBalance,
    this.remainingBalance,
    this.basicSalaryAmount,
    this.allowancesAmount,
    this.remarks,
    this.transactionStatusId,
    this.transactionStatusName,
    this.wfId,
    this.employee,
    this.employeeLeaveEncashmentWF,
    this.isAllowYearlyBalance,
    this.encashmentLeaveTypeName,
  );
}
