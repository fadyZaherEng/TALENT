import 'package:json_annotation/json_annotation.dart';

part 'insert_other_request.g.dart';

@JsonSerializable()
class InsertOtherRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'otherRequestId')
  final int otherRequestId;
  @JsonKey(name: 'requestedDate')
  final String requestedDate;
  @JsonKey(name: 'requestNote')
  final String requestNote;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;

  InsertOtherRequest({
    required this.employeeId,
    required this.id,
    required this.companyId,
    required this.remarks,
    required this.transactionStatusId,
    required this.workFlowId,
    required this.requestedDate,
    required this.otherRequestId,
    required this.requestNote,

  });

  factory InsertOtherRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertOtherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertOtherRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "remarks": remarks,
      "transactionStatusId": transactionStatusId,
      "otherRequestId": otherRequestId,
      "requestedDate": requestedDate,
      "requestNote": requestNote,
      "workFlowId": workFlowId,
    };
  }

  factory InsertOtherRequest.fromMap(Map<String, dynamic> map) {
    return InsertOtherRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      remarks: map['remarks'] as String,
      requestNote: map['requestNote'] as String,
      transactionStatusId: map['transactionStatusId'] as int,
      otherRequestId: map['otherRequestId'] as int,
      requestedDate: map['requestedDate'] as String,
      workFlowId: map['workFlowId'] as int,

    );
  }
}
