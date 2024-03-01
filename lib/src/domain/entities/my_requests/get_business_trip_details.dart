import 'package:talent_link/src/domain/entities/my_requests/employee.dart';

class GetBusinessTripDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int businessTripTypeId;
  final String departureDate;
  final String returnDate;
  final int duration;
  final String expectedResumeDutyDate;
  final bool isByPayroll;
  final int paymentMethodId;
  final String tripPurpose;
  final String remarks;
  final int tripTotalAmount;
  final int tripCashAdvancedPayment;
  final int tripRemainingAmount;
  final int totalAmount;
  final int transactionStatusId;
  final String transactionStatusName;
  final int noOfDigits;
  final String currencyCode;
  final Employee? employee;

  const GetBusinessTripDetails({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.businessTripTypeId,
    required this.departureDate,
    required this.returnDate,
    required this.duration,
    required this.expectedResumeDutyDate,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.tripPurpose,
    required this.remarks,
    required this.tripTotalAmount,
    required this.tripCashAdvancedPayment,
    required this.tripRemainingAmount,
    required this.totalAmount,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.noOfDigits,
    required this.currencyCode,
    required this.employee,
  });
}
