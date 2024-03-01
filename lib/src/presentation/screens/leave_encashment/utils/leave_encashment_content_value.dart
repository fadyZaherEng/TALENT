class LeaveEncashmentContentValue {
  int typeId;
  String requestedDate;
  String requestedDays;
  int payrollId;
  int paymentMethodId;
  String remainingBalance;
  String file;
  String currentBalance;
  String yearlyBalance;
  String totalAmount;

  LeaveEncashmentContentValue({
    this.typeId = 0,
    this.requestedDate = '',
    this.requestedDays = '',
    this.payrollId = 0,
    this.paymentMethodId = 0,
    this.remainingBalance = '',
    this.file = '',
    this.currentBalance = '',
    this.yearlyBalance = '',
    this.totalAmount = '',
  });
}
