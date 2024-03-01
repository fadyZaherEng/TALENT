import 'package:json_annotation/json_annotation.dart';

part 'insert_address_request.g.dart';

@JsonSerializable()
class InsertAddressRequest {
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
  @JsonKey(name: 'addressName')
  final String addressName;
  @JsonKey(name: 'street')
  final String street;
  @JsonKey(name: 'buildingNo')
  final String buildingNo;
  @JsonKey(name: 'floor')
  final String floor;
  @JsonKey(name: 'flat')
  final String flat;
  @JsonKey(name: 'longitude')
  final String longitude;
  @JsonKey(name: 'latitude')
  final String latitude;
  @JsonKey(name: 'addressDetails')
  final String addressDetails;
  @JsonKey(name: 'addressFilePath')
  final String addressFilePath;
  @JsonKey(name: 'addressFileName')
  final String addressFileName;
  @JsonKey(name: 'fileSource')
  final String fileSource;
  @JsonKey(name: 'areaId')
  final int areaId;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;
  @JsonKey(name: 'areaName')
  final String areaName;

  InsertAddressRequest({
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
    required this.addressName,
    required this.street,
    required this.buildingNo,
    required this.floor,
    required this.flat,
    required this.longitude,
    required this.latitude,
    required this.addressDetails,
    required this.addressFilePath,
    required this.addressFileName,
    required this.fileSource,
    required this.areaId,
    required this.isDeleted,
    required this.areaName,
  });

  factory InsertAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertAddressRequestToJson(this);

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
      "addressName": addressName,
      "street": street,
      "buildingNo": buildingNo,
      "floor": floor,
      "flat": flat,
      "longitude": longitude,
      "latitude": latitude,
      "addressDetails": addressDetails,
      "addressFilePath": addressFilePath,
      "addressFileName": addressFileName,
      "fileSource": fileSource,
      "areaId": areaId,
      "isDeleted": isDeleted,
      "areaName": areaName,
    };
  }

  factory InsertAddressRequest.fromMap(Map<String, dynamic> map) {
    return InsertAddressRequest(
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
      addressName: map['addressName'] as String,
      street: map['street'] as String,
      buildingNo: map['buildingNo'] as String,
      floor: map['floor'] as String,
      flat: map['flat'] as String,
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
      addressDetails: map['addressDetails'] as String,
      addressFilePath: map['addressFilePath'] as String,
      addressFileName: map['addressFileName'] as String,
      fileSource: map['fileSource'] as String,
      areaId: map['areaId'] as int,
      isDeleted: map['isDeleted'] as bool,
      areaName: map['areaName'] as String,
    );
  }
}
