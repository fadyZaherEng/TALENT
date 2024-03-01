class HomeData {
  String checkInTime;
  String checkOutTime;
  String shiftTime;
  int remainingWorkHours;
  double remainingWorkHoursProgress;
  double currentBalance;
  int remainingCurrentBalance;
  double yearlyBalance;
  int remainingYearlyBalance;
  String remainingTime;
  bool isPlusTime;
  String notificationCount;

  HomeData({
    this.checkOutTime = '',
    this.checkInTime = '',
    this.yearlyBalance = 0,
    this.currentBalance = 0,
    this.remainingCurrentBalance = 0,
    this.remainingWorkHours = 0,
    this.remainingYearlyBalance = 0,
    this.shiftTime = '',
    this.remainingTime = '',
    this.remainingWorkHoursProgress = 0,
    this.isPlusTime = false,
    this.notificationCount = '',
  });
}
