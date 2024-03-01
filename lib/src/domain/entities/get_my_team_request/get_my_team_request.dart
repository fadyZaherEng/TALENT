class MyTeamRequest {
  final String employeeName;
  final int referenceId;
  final String referenceName;
  final String createdAt;
  final int transactionId;
  final String imagePath;
  final int transactionStatusId;
  final String transactionStatusName;

  MyTeamRequest({
    required this.employeeName,
    required this.referenceId,
    required this.referenceName,
    required this.createdAt,
    required this.transactionId,
    required this.imagePath,
    required this.transactionStatusId,
    required this.transactionStatusName,
  });
}
