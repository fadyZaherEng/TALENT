class GetEmployeeRequests {
  final int referenceId;
  final String referenceName;
  final int transactionId;
  final String transactionStatusName;
  final String createdAt;

  GetEmployeeRequests({
    required this.referenceId,
    required this.referenceName,
    required this.transactionId,
    required this.transactionStatusName,
    required this.createdAt,
  });
}
