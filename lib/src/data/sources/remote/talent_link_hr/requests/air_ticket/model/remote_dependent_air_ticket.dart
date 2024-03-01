import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';

part 'remote_dependent_air_ticket.g.dart';

@JsonSerializable()
class RemoteDependentAirTicket {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final dynamic message;
  @JsonKey(name: 'dueTicketMonthId')
  final int? dueTicketMonthId;
  @JsonKey(name: 'dueTicketMonth')
  final String? dueTicketMonth;
  @JsonKey(name: 'employeeDependentId')
  final int? employeeDependentId;
  @JsonKey(name: 'dependentName')
  final String? dependentName;
  @JsonKey(name: 'ticketStartDate')
  final String? ticketStartDate;
  @JsonKey(name: 'ticketEndDate')
  final String? ticketEndDate;
  @JsonKey(name: 'isFixedAmount')
  final bool? isFixedAmount;
  @JsonKey(name: 'ticketFixedAmount')
  final double? ticketFixedAmount;
  @JsonKey(name: 'flightClassTypeId')
  final int? flightClassTypeId;
  @JsonKey(name: 'flightClassTypeName')
  final String? flightClassTypeName;
  @JsonKey(name: 'flightDirctionTypeId')
  final int? flightDirctionTypeId;
  @JsonKey(name: 'flightDirctionTypeName')
  final String? flightDirctionTypeName;
  @JsonKey(name: 'distinationId')
  final int? distinationId;
  @JsonKey(name: 'distinationName')
  final String? distinationName;
  @JsonKey(name: 'noOfDigits')
  final int? noOfDigits;

  RemoteDependentAirTicket({
    this.status = false,
    this.message,
    this.dueTicketMonthId,
    this.dueTicketMonth,
    this.employeeDependentId,
    this.dependentName,
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
    this.noOfDigits,
  });

  factory RemoteDependentAirTicket.fromJson(Map<String, dynamic> json) =>
      _$RemoteDependentAirTicketFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDependentAirTicketToJson(this);
}

extension RemoteDependentAirTicketExtension on RemoteDependentAirTicket {
  AirTicket mapToDomain() {
    return AirTicket(
        id: distinationId.toString(),
        ticketAmount: ticketFixedAmount.toString(),
        dependent: dependentName.toString(),
        destination: distinationName!);
  }
}

extension RemoteDependentAirTicketListExtension
    on List<RemoteDependentAirTicket>? {
  List<AirTicket> mapDependentAirTicketToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
