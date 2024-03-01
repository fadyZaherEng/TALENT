import 'package:json_annotation/json_annotation.dart';

part 'insert_indemnity_encashment_request.g.dart';

@JsonSerializable()
class InsertIndemnityEncashmentRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'indemnityEncashmentId')
  final int indemnityEncashmentId;
  @JsonKey(name: 'isByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'paymentMethodId')
  final int paymentMethodId;
  @JsonKey(name: 'salaryMonth')
  final int salaryMonth;
  @JsonKey(name: 'salaryYear')
  final int salaryYear;
  @JsonKey(name: 'requestedDate')
  final String requestedDate;
  @JsonKey(name: 'requestedDays')
  final int requestedDays;
  @JsonKey(name: 'totalAmount')
  final int totalAmount;
  @JsonKey(name: 'indemnityServiceDays')
  final int indemnityServiceDays;
  @JsonKey(name: 'indemnityDays')
  final int indemnityDays;
  @JsonKey(name: 'indemnityAmount')
  final int indemnityAmount;
  @JsonKey(name: 'basicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'allowancesAmount')
  final int allowancesAmount;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;

  @JsonKey(name: 'workFlowId')
  final int workFlowId;

  InsertIndemnityEncashmentRequest({
    required this.employeeId,
    required this.id,
    required this.companyId,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.remarks,
    required this.totalAmount,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.transactionStatusId,
    required this.requestedDays,
    required this.requestedDate,
    required this.salaryYear,
    required this.salaryMonth,
    required this.indemnityAmount,
    required this.indemnityDays,
    required this.indemnityEncashmentId,
    required this.indemnityServiceDays,
    required this.workFlowId,
  });

  factory InsertIndemnityEncashmentRequest.fromJson(
          Map<String, dynamic> json) =>
      _$InsertIndemnityEncashmentRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InsertIndemnityEncashmentRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "indemnityEncashmentId": indemnityEncashmentId,
      "isByPayroll": isByPayroll,
      "paymentMethodId": paymentMethodId,
      "salaryMonth": salaryMonth,
      "salaryYear": salaryYear,
      "requestedDate": requestedDate,
      "requestedDays": requestedDays,
      "totalAmount": totalAmount,
      "indemnityServiceDays": indemnityServiceDays,
      "indemnityDays": indemnityDays,
      "indemnityAmount": indemnityAmount,
      "basicSalaryAmount": basicSalaryAmount,
      "allowancesAmount": allowancesAmount,
      "remarks": remarks,
      "transactionStatusId": transactionStatusId,
      "workFlowId": workFlowId,
    };
  }

  factory InsertIndemnityEncashmentRequest.fromMap(Map<String, dynamic> map) {
    return InsertIndemnityEncashmentRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      indemnityEncashmentId: map['indemnityEncashmentId'] as int,
      isByPayroll: map['isByPayroll'] as int,
      paymentMethodId: map['paymentMethodId'] as int,
      remarks: map['remarks'] as String,
      indemnityDays: map['indemnityDays'] as int,
      indemnityServiceDays: map['indemnityServiceDays'] as int,
      salaryMonth: map['salaryMonth'] as int,
      indemnityAmount: map['indemnityAmount'] as int,
      totalAmount: map['totalAmount'] as int,
      salaryYear: map['salaryYear'] as int,
      requestedDate: map['requestedDate'] as String,
      requestedDays: map['requestedDays'] as int,
      workFlowId: map['workFlowId'] as int,
      basicSalaryAmount: map['basicSalaryAmount'] as int,
      allowancesAmount: map['allowancesAmount'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
    );
  }
}
