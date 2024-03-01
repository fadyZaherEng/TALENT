import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/air_ticket/get_ait_ticket_by_employee.dart';

part 'remote_get_air_ticket_by_employee.g.dart';

@JsonSerializable()
class RemoteGetAirTicketByEmployee {
  @JsonKey(name: "status")
  final bool? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "dueTicketMonthId")
  final int? dueTicketMonthId;
  @JsonKey(name: "dueTicketMonth")
  final String? dueTicketMonth;
  @JsonKey(name: "ticketStartDate")
  final String? ticketStartDate;
  @JsonKey(name: "ticketEndDate")
  final String? ticketEndDate;
  @JsonKey(name: "isFixedAmount")
  final bool? isFixedAmount;
  @JsonKey(name: "ticketFixedAmount")
  final double? ticketFixedAmount;
  @JsonKey(name: "flightClassTypeId")
  final int? flightClassTypeId;
  @JsonKey(name: "flightClassTypeName")
  final String? flightClassTypeName;
  @JsonKey(name: "flightDirctionTypeId")
  final int? flightDirctionTypeId;
  @JsonKey(name: "flightDirctionTypeName")
  final String? flightDirctionTypeName;
  @JsonKey(name: "distinationId")
  final int? distinationId;
  @JsonKey(name: "distinationName")
  final String? distinationName;
  @JsonKey(name: "dueTicketYear")
  final String? dueTicketYear;
  @JsonKey(name: "dueTicketYearId")
  final int? dueTicketYearId;

  const RemoteGetAirTicketByEmployee(
      {this.status,
      this.message,
      this.id,
      this.dueTicketMonthId,
      this.dueTicketMonth,
      this.ticketStartDate,
      this.ticketEndDate,
      this.isFixedAmount,
      this.ticketFixedAmount,
      this.flightClassTypeId,
      this.flightClassTypeName,
      this.flightDirctionTypeId,
      this.flightDirctionTypeName,
      this.distinationId,
      this.distinationName,
      this.dueTicketYear,
      this.dueTicketYearId});

  factory RemoteGetAirTicketByEmployee.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetAirTicketByEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetAirTicketByEmployeeToJson(this);
}

extension RemoteGetAirTicketExtension on RemoteGetAirTicketByEmployee {
  GetAirTicketByEmployee mapToDomain() {
    return GetAirTicketByEmployee(
        status: status ?? false,
        message: message ?? "",
        id: id ?? 0,
        dueTicketMonthId: dueTicketMonthId ?? 0,
        dueTicketMonth: dueTicketMonth ?? "",
        ticketStartDate: ticketStartDate ?? "",
        ticketEndDate: ticketEndDate ?? "",
        isFixedAmount: isFixedAmount ?? false,
        ticketFixedAmount: ticketFixedAmount ?? 0,
        flightClassTypeId: flightClassTypeId ?? 0,
        flightClassTypeName: flightClassTypeName ?? "",
        flightDirctionTypeId: flightDirctionTypeId ?? 0,
        flightDirctionTypeName: flightDirctionTypeName ?? "",
        distinationId: distinationId ?? 0,
        distinationName: distinationName ?? "",
        ticketYear: dueTicketYear ?? "",
        ticketYearId: dueTicketYearId ?? 0);
  }
}
