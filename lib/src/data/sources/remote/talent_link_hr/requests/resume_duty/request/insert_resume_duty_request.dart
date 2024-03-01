import 'package:json_annotation/json_annotation.dart';

part 'insert_resume_duty_request.g.dart';

@JsonSerializable()
class InsertResumeDutyRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'isNewJoining')
  final int isNewJoining;
  @JsonKey(name: 'isByPayroll')
  final int isByPayroll;
  @JsonKey(name: 'paymentMethodId')
  final int paymentMethodId;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;
  @JsonKey(name: 'resumeDutyReferenceType')
  final dynamic resumeDutyReferenceType;
  @JsonKey(name: 'resumeDutyReferenceId')
  final dynamic resumeDutyReferenceId;
  @JsonKey(name: 'expectedResumeDutyDate')
  final String expectedResumeDutyDate;
  @JsonKey(name: 'actualResumeDutyDate')
  final String actualResumeDutyDate;
  @JsonKey(name: 'resumeDutyTypeId')
  final int resumeDutyTypeId;
  @JsonKey(name: 'basicSalaryAmount')
  final int basicSalaryAmount;
  @JsonKey(name: 'allowancesAmount')
  final int allowancesAmount;
  @JsonKey(name: 'noOfDigits')
  final int noOfDigits;

  InsertResumeDutyRequest({
    required this.employeeId,
    required this.id,
    required this.companyId,
    required this.isByPayroll,
    required this.paymentMethodId,
    required this.remarks,
    required this.basicSalaryAmount,
    required this.allowancesAmount,
    required this.transactionStatusId,
    required this.noOfDigits,
    required this.workFlowId,
    required this.expectedResumeDutyDate,
    required this.resumeDutyReferenceType,
    required this.actualResumeDutyDate,
    required this.isNewJoining,
    required this.resumeDutyReferenceId,
    required this.resumeDutyTypeId,
  });

  factory InsertResumeDutyRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertResumeDutyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertResumeDutyRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "isByPayroll": isByPayroll,
      "paymentMethodId": paymentMethodId,
      "remarks": remarks,
      "basicSalaryAmount": basicSalaryAmount,
      "allowancesAmount": allowancesAmount,
      "transactionStatusId": transactionStatusId,
      "isNewJoining": isNewJoining,
      "workFlowId": workFlowId,
      "resumeDutyReferenceType": resumeDutyReferenceType,
      "resumeDutyReferenceId": resumeDutyReferenceId,
      "expectedResumeDutyDate": expectedResumeDutyDate,
      "resumeDutyTypeId": resumeDutyTypeId,
      "noOfDigits": noOfDigits,
      "actualResumeDutyDate": actualResumeDutyDate,
    };
  }

  factory InsertResumeDutyRequest.fromMap(Map<String, dynamic> map) {
    return InsertResumeDutyRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      isByPayroll: map['isByPayroll'] as int,
      paymentMethodId: map['paymentMethodId'] as int,
      remarks: map['remarks'] as String,
      basicSalaryAmount: map['basicSalaryAmount'] as int,
      allowancesAmount: map['allowancesAmount'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      noOfDigits: map['noOfDigits'] as int,
      workFlowId: map['workFlowId'] as int,
      expectedResumeDutyDate: map['expectedResumeDutyDate'] as String,
      resumeDutyReferenceType: map['resumeDutyReferenceType'] as dynamic,
      actualResumeDutyDate: map['actualResumeDutyDate'] as String,
      isNewJoining: map['isNewJoining'] as int,
      resumeDutyReferenceId: map['resumeDutyReferenceId'] as dynamic,
      resumeDutyTypeId: map['resumeDutyTypeId'] as int,
    );
  }
}
