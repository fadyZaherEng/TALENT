import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/air_ticket/calculate_in_case_air_ticket.dart';

part 'remote_calculate_in_case_air_ticket.g.dart';

@JsonSerializable()
class RemoteCalculateInCaseAirTicket {
  @JsonKey(name: "serviceDays")
  final int? serviceDays;
  @JsonKey(name: "ticketAmount")
  final int? ticketAmount;

  const RemoteCalculateInCaseAirTicket({
    this.serviceDays,
    this.ticketAmount,
  });

  factory RemoteCalculateInCaseAirTicket.fromJson(Map<String, dynamic> json) =>
      _$RemoteCalculateInCaseAirTicketFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCalculateInCaseAirTicketToJson(this);
}

extension RemoteCalculateInCaseAirTicketExtension
    on RemoteCalculateInCaseAirTicket {
  CalculateInCaseAirTicket mapToDomain() {
    return CalculateInCaseAirTicket(
      serviceDays: serviceDays ?? 0,
      ticketAmount: ticketAmount ?? 0,
    );
  }
}
