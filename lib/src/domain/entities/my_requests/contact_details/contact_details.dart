class ContactDetails {
  final int id;
  final int companyId;
  final int employeeId;
  final String contactName;
  final String contactNumber;
  final String status;
  final int statusId;
  final String remarks;

  ContactDetails(
      {required this.contactName,
      required this.status,
      required this.statusId,
      required this.remarks,
      required this.employeeId,
      required this.id,
      required this.companyId,
      required this.contactNumber});
}
