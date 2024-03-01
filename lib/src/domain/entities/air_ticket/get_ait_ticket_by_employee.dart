class GetAirTicketByEmployee {
  final bool status;
  final String message;
  final int id;
  final int dueTicketMonthId;
  final String dueTicketMonth;
  final String ticketStartDate;
  final String ticketEndDate;
  final bool isFixedAmount;
  final double ticketFixedAmount;
  final int flightClassTypeId;
  final String flightClassTypeName;
  final int flightDirctionTypeId;
  final String flightDirctionTypeName;
  final int distinationId;
  final String distinationName;
  final String ticketYear;
  final int ticketYearId;

  const GetAirTicketByEmployee(
      {this.status = false,
      this.message = "",
      this.id = 0,
      this.dueTicketMonthId = 0,
      this.dueTicketMonth = "",
      this.ticketStartDate = "",
      this.ticketEndDate = "",
      this.isFixedAmount = false,
      this.ticketFixedAmount = 0,
      this.flightClassTypeId = 0,
      this.flightClassTypeName = "",
      this.flightDirctionTypeId = 0,
      this.flightDirctionTypeName = "",
      this.distinationId = 0,
      this.distinationName = "",
      this.ticketYear = "",
      this.ticketYearId = 0});
}
