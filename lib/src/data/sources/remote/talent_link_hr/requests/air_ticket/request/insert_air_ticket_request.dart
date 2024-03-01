import 'package:json_annotation/json_annotation.dart';

part 'insert_air_ticket_request.g.dart';

@JsonSerializable()
class InsertAirTicketRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'requestedDate')
  final String requestedDate;
  @JsonKey(name: 'airTicketDueMonth')
  final int airTicketDueMonth;
  @JsonKey(name: 'airTicketDueYear')
  final int airTicketDueYear;
  @JsonKey(name: 'isCalculateByServiceDays')
  final int isCalculateByServiceDays;
  @JsonKey(name: 'serviceDays')
  final int serviceDays;
  @JsonKey(name: 'ticketOriginalAmount')
  final double ticketOriginalAmount;
  @JsonKey(name: 'ticketAmount')
  final int ticketAmount;
  @JsonKey(name: 'isByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'paymentMethodId')
  final int paymentMethodId;
  @JsonKey(name: 'distinationId')
  final int distinationId;
  @JsonKey(name: 'flightClassTypeId')
  final int flightClassTypeId;
  @JsonKey(name: 'flightDirctionTypeId')
  final int flightDirctionTypeId;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;
  @JsonKey(name: 'noOfDigits')
  final int noOfDigits;
  @JsonKey(name: 'currencyCode')
  final String currencyCode;

  InsertAirTicketRequest({
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
    required this.workFlowId,
    required this.noOfDigits,
    required this.currencyCode,
    required this.id,
  });

  factory InsertAirTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertAirTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertAirTicketRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "requestedDate": requestedDate,
      "airTicketDueMonth": airTicketDueMonth,
      "airTicketDueYear": airTicketDueYear,
      "isCalculateByServiceDays": isCalculateByServiceDays,
      "serviceDays": serviceDays,
      "ticketOriginalAmount": ticketOriginalAmount,
      "ticketAmount": ticketAmount,
      "isByPayroll": isByPayroll,
      "paymentMethodId": paymentMethodId,
      "distinationId": distinationId,
      "flightClassTypeId": flightClassTypeId,
      "flightDirctionTypeId": flightDirctionTypeId,
      "remarks": remarks,
      "transactionStatusId": transactionStatusId,
      "workFlowId": workFlowId,
      "noOfDigits": noOfDigits,
      "currencyCode": currencyCode,
    };
  }

  factory InsertAirTicketRequest.fromMap(Map<String, dynamic> map) {
    return InsertAirTicketRequest(
      id: map['id'] as int,
      workFlowId: map['workFlowId'] as int,
      requestedDate: map['requestedDate'] as String,
      remarks: map['remarks'] as String,
      employeeId: map['employeeId'] as int,
      isByPayroll: map['isByPayroll'] as int,
      paymentMethodId: map['paymentMethodId'] as int,
      ticketAmount: map['ticketAmount'] as int,
      airTicketDueYear: map['airTicketDueYear'] as int,
      airTicketDueMonth: map['airTicketDueMonth'] as int,
      companyId: map['companyId'] as int,
      currencyCode: map['currencyCode'] as String,
      distinationId: map['distinationId'] as int,
      flightClassTypeId: map['flightClassTypeId'] as int,
      flightDirctionTypeId: map['flightDirctionTypeId'] as int,
      isCalculateByServiceDays: map['isCalculateByServiceDays'] as int,
      noOfDigits: map['noOfDigits'] as int,
      serviceDays: map['serviceDays'] as int,
      ticketOriginalAmount: map['ticketOriginalAmount'] as double,
      transactionStatusId: map['transactionStatusId'] as int,
    );
  }
}
