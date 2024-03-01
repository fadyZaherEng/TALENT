class AddressDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int statusId;
  final String status;
  final String remarks;
  final String addressName;
  final String street;
  final String buildingNumber;
  final String floor;
  final String flat;
  final String addressDetails;
  final String areaName;

  AddressDetails(
      {required this.street,
      required this.floor,
      required this.flat,
      required this.buildingNumber,
      required this.areaName,
      required this.addressName,
      required this.companyId,
      required this.status,
      required this.statusId,
      required this.remarks,
      required this.employeeId,
      required this.id,
      required this.addressDetails});
}
