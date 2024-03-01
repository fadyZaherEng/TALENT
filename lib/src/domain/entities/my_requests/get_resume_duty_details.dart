import 'package:talent_link/src/domain/entities/my_requests/employee.dart';

class GetResumeDutyDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final bool isNewJoining;
  final bool isByPayroll;
  final int paymentMethodId;
  final int transactionStatusId;
  final int wfId;
  final String remarks;
  final String expectedResumeDutyDate;
  final String actualResumeDutyDate;
  final int resumeDutyTypeId;
  final int basicSalaryAmount;
  final int allowancesAmount;
  final int totalAmount;
  final int totalResumedDays;
  final int noOfDigits;
  final String currencyCode;
  final String resumeDutyTypeName;
  final String transactionStatusName;
  final Employee? employee;

  const GetResumeDutyDetails({
    required this.id,
    required this.companyId,
    required this.resumeDutyTypeName,
    required this.employeeId,
    required this.isNewJoining,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.transactionStatusId,
    required this.wfId,
    required this.remarks,
    required this.expectedResumeDutyDate,
    required this.actualResumeDutyDate,
    required this.resumeDutyTypeId,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.totalAmount,
    required this.totalResumedDays,
    required this.noOfDigits,
    required this.currencyCode,
    required this.transactionStatusName,
    required this.employee,
  });
}
