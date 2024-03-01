import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/employee_loan_attachment.dart';

class GetLoanDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int loanTypeId;
  final String loanRequestedDate;
  final int loanRequestedAmount;
  final int profitRate;
  final int loanTotalAmount;
  final int paymentStartMonth;
  final int paymentStartYear;
  final bool isByInstallmentAmount;
  final int installments;
  final bool isByPayroll;
  final int paymentMethodId;
  final int salaryDeductionPercentage;
  final bool isClosed;
  final String remarks;
  final int indemnityServiceDays;
  final int indemnityDays;
  final int basicSalaryAmount;
  final int allowancesAmount;
  final int transactionStatusId;
  final String transactionStatusName;
  final int noOfDigits;
  final String currencyCode;
  final String loanTypeName;
  final Employee employee;
  final List<EmployeeLoanAttachments> employeeLoanAttachments;

  GetLoanDetails({
    required this.id,
    required this.loanTypeName,
    required this.companyId,
    required this.employeeId,
    required this.loanTypeId,
    required this.loanRequestedDate,
    required this.loanRequestedAmount,
    required this.profitRate,
    required this.loanTotalAmount,
    required this.paymentStartMonth,
    required this.paymentStartYear,
    required this.isByInstallmentAmount,
    required this.installments,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.salaryDeductionPercentage,
    required this.isClosed,
    required this.remarks,
    required this.indemnityServiceDays,
    required this.indemnityDays,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.noOfDigits,
    required this.currencyCode,
    required this.employee,
    required this.employeeLoanAttachments,
  });
}
