import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/employee_indemnity_encashment_attachments.dart';

class GetIndemnityEncashmentDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int indemnityEncashmentId;
  final bool isByPayroll;
  final int paymentMethodId;
  final int salaryMonth;
  final int salaryYear;
  final String requestedDate;
  final int requestedDays;
  final int totalAmount;
  final int indemnityServiceDays;
  final int indemnityDays;
  final int indemnityAmount;
  final int basicSalaryAmount;
  final int allowancesAmount;
  final bool isSettled;
  final String settlementDate;
  final String settlementRemarks;
  final String remarks;
  final int transactionStatusId;
  final String transactionStatusName;
  final Employee? employee;
  final List<EmployeeIndemnityEncashmentAttachments>
      employeeIndemnityEncashmentAttachments;
  final String indemnityEncashmentName;
  GetIndemnityEncashmentDetails({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.indemnityEncashmentId,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.salaryMonth,
    required this.salaryYear,
    required this.requestedDate,
    required this.requestedDays,
    required this.totalAmount,
    required this.indemnityServiceDays,
    required this.indemnityDays,
    required this.indemnityAmount,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.isSettled,
    required this.settlementDate,
    required this.settlementRemarks,
    required this.remarks,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.employee,
    required this.employeeIndemnityEncashmentAttachments,
    required this.indemnityEncashmentName,
  });
}
