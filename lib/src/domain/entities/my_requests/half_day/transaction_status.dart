class TransactionStatus {
  final int id;
  final String name;
  final String code;
  final String createdAt;
  final int createdBy;
  final String modifiedAt;
  final int modifiedBy;
  final bool isDeleted;
  final bool isEnabled;

  const TransactionStatus({
    required this.id,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.createdBy,
    required this.modifiedAt,
    required this.modifiedBy,
    required this.isDeleted,
    required this.isEnabled,
  });
}
