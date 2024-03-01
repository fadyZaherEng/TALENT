import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/git_air_ticket_details.dart';

@immutable
abstract class AirTicketDetailsState {}

class GetAirTicketDetailsInitial extends AirTicketDetailsState {}

class GetAirTicketDetailsErrorDataState extends AirTicketDetailsState {
  final String errorMSG;

  GetAirTicketDetailsErrorDataState({
    required this.errorMSG,
  });
}

class AirTicketDetailsShowLoadingState extends AirTicketDetailsState {}

class AirTicketDetailsHideLoadingState extends AirTicketDetailsState {}

class GetAirTicketDetailsLoadingState extends AirTicketDetailsState {}

class GetAirTicketDetailsSuccessState extends AirTicketDetailsState {
  final GetAirTicketDetails getAirTicketDetails;

  GetAirTicketDetailsSuccessState(this.getAirTicketDetails);
}

class GetAirTicketDetailsErrorState extends AirTicketDetailsState {
  final String errorMSG;

  GetAirTicketDetailsErrorState({
    required this.errorMSG,
  });
}

class AirTicketDetailsApproveSuccessState extends AirTicketDetailsState {
  final DataSuccess dataSuccess;

  AirTicketDetailsApproveSuccessState(this.dataSuccess);
}

class AirTicketDetailsRejectSuccessState extends AirTicketDetailsState {
  final DataSuccess dataSuccess;

  AirTicketDetailsRejectSuccessState(this.dataSuccess);
}
