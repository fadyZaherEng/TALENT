class ServerNotificationData {
  final String transactionId;
  final String requestTypeId;
  final String viewId;
  final String message;

  ServerNotificationData(
      {required this.transactionId,
      required this.message,
      required this.viewId,
      required this.requestTypeId});

  factory ServerNotificationData.fromJson(Map<String, dynamic> json) {
    return ServerNotificationData(
        transactionId: json['transactionId'] ?? "0",
        message: json['message'] ?? "",
        viewId: json['viewId'] ?? "0",
        requestTypeId: json['requestTypeId'] ?? "0");
  }
}
