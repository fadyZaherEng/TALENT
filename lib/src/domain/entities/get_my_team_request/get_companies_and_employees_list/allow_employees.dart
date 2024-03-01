class AllowEmployees {
  final int companyId;
  final int employeeId;
  final String employeeName;
  bool isSelected;

  AllowEmployees({
    required this.companyId,
    required this.employeeId,
    required this.employeeName,
    this.isSelected = false,
  });

  AllowEmployees copy() {
    return AllowEmployees(
      companyId: companyId,
      employeeId: employeeId,
      employeeName: employeeName,
      isSelected: isSelected,
    );
  }
}
