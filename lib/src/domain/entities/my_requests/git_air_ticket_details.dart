import 'package:talent_link/src/domain/entities/my_requests/employee.dart';

class GetAirTicketDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final String requestedDate;
  final int airTicketDueMonth;
  final int airTicketDueYear;
  final bool isCalculateByServiceDays;
  final int serviceDays;
  final int ticketOriginalAmount;
  final int ticketAmount;
  final bool isByPayroll;
  final int paymentMethodId;
  final int distinationId;
  final int flightClassTypeId;
  final int flightDirctionTypeId;
  final String remarks;
  final int transactionStatusId;
  final String transactionStatusName;
  final int noOfDigits;
  final String currencyCode;
  final Employee? employee;

  const GetAirTicketDetails({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.requestedDate,
    required this.airTicketDueMonth,
    required this.airTicketDueYear,
    required this.isCalculateByServiceDays,
    required this.serviceDays,
    required this.ticketOriginalAmount,
    required this.ticketAmount,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.distinationId,
    required this.flightClassTypeId,
    required this.flightDirctionTypeId,
    required this.remarks,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.noOfDigits,
    required this.currencyCode,
    required this.employee,
  });
}
