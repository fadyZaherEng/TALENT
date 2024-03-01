class AssetDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final int quantity;
  final String assetTypeName;
  final String status;
  final int statusId;
  final String remarks;

  AssetDetails(
      {required this.quantity,
      required this.assetTypeName,
      required this.companyId,
      required this.employeeId,
      required this.id,
      required this.status,
      required this.statusId,
      required this.remarks});
}
