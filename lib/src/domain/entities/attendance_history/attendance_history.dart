class AttendanceHistory {
  final String? attendanceDate;
  final String? timeIn;
  final String? timeOut;
  final int? actualNoOfWorkingMins;

  AttendanceHistory({
    this.actualNoOfWorkingMins,
    this.attendanceDate,
    this.timeIn,
    this.timeOut,
  });
}
