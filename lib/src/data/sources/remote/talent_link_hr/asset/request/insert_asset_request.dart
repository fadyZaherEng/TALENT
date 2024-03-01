import 'package:json_annotation/json_annotation.dart';

part 'insert_asset_request.g.dart';

@JsonSerializable()
class InsertAssetRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'transactionStatusName')
  final String transactionStatusName;
  @JsonKey(name: 'transactionStatusCode')
  final String transactionStatusCode;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;
  @JsonKey(name: 'workFlowName')
  final String workFlowName;
  @JsonKey(name: 'isEnabled')
  final bool isEnabled;
  @JsonKey(name: 'quantity')
  final String quantity;
  @JsonKey(name: 'assetFilePath')
  final String assetFilePath;
  @JsonKey(name: 'assetFileName')
  final String assetFileName;
  @JsonKey(name: 'assetTypeId')
  final String assetTypeId;
  @JsonKey(name: 'assetTypeName')
  final String assetTypeName;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;

  InsertAssetRequest({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.transactionStatusCode,
    required this.remarks,
    required this.workFlowId,
    required this.workFlowName,
    required this.isEnabled,
    required this.quantity,
    required this.assetFilePath,
    required this.assetFileName,
    required this.assetTypeId,
    required this.assetTypeName,
    required this.isDeleted,
  });

  factory InsertAssetRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertAssetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertAssetRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "transactionStatusId": transactionStatusId,
      "transactionStatusName": transactionStatusName,
      "transactionStatusCode": transactionStatusCode,
      "remarks": remarks,
      "workFlowId": workFlowId,
      "workFlowName": workFlowName,
      "isEnabled": isEnabled,
      "quantity": quantity,
      "assetFilePath": assetFilePath,
      "assetFileName": assetFileName,
      "assetTypeId": assetTypeId,
      "assetTypeName": assetTypeName,
      "isDeleted": isDeleted,
    };
  }

  factory InsertAssetRequest.fromMap(Map<String, dynamic> map) {
    return InsertAssetRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      transactionStatusName: map['transactionStatusName'] as String,
      transactionStatusCode: map['transactionStatusCode'] as String,
      remarks: map['remarks'] as String,
      workFlowId: map['workFlowId'] as int,
      workFlowName: map['workFlowName'] as String,
      isEnabled: map['isEnabled'] as bool,
      quantity: map['quantity'] as String,
      assetFilePath: map['assetFilePath'] as String,
      assetFileName: map['assetFileName'] as String,
      assetTypeId: map['assetTypeId'] as String,
      assetTypeName: map['assetTypeName'] as String,
      isDeleted: map['isDeleted'] as bool,
    );
  }
}
