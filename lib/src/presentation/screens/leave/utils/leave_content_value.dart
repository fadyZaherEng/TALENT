class LeaveContentValue {
  int employeeId;
  int type;
  String startDate;
  String endDate;
  int payrollId;
  int paymentMethod;
  String expectedResumingData;
  String addressDuringLeave;
  String remarks;
  String contactNo;
  String leaveReasons;
  String file;
  int isCurrentBalance;
  String currentBalance;
  String yearlyBalance;
  String totalAmount;
  String leaveDays;
  String remainingBalance;

  LeaveContentValue({
    this.type = 0,
    this.startDate = "",
    this.endDate = "",
    this.payrollId = 0,
    this.paymentMethod = 0,
    this.expectedResumingData = "",
    this.addressDuringLeave = "",
    this.remarks = "",
    this.contactNo = "",
    this.leaveReasons = "",
    this.file = "",
    this.isCurrentBalance = 0,
    this.currentBalance = "",
    this.yearlyBalance = "",
    this.totalAmount = "",
    this.leaveDays = "",
    this.remainingBalance = "",
    this.employeeId = 3234,
  });
}
