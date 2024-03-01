class MyRequest {
  final int id;
  final String date;
  final String requestType;
  final String requestStatus;
  final int transactionId;
  final int transactionStatuesId;

  MyRequest({
    required this.id,
    required this.requestType,
    required this.date,
    required this.requestStatus,
    required this.transactionId,
    required this.transactionStatuesId,
  });
}
