import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/other_request_details.dart';

@immutable
abstract class OtherRequestDetailsState {}

class OtherRequestDetailsInitialState extends OtherRequestDetailsState {}

class OtherRequestDetailsShowLoadingState extends OtherRequestDetailsState {}

class OtherRequestDetailsHideLoadingState extends OtherRequestDetailsState {}

class OtherRequestDetailsLoadingState extends OtherRequestDetailsState {}

class GetOtherRequestDetailsSuccessState extends OtherRequestDetailsState {
  final GetOtherRequestDetails getOtherRequestDetails;

  GetOtherRequestDetailsSuccessState(this.getOtherRequestDetails);
}

class GetOtherRequestDetailsErrorState extends OtherRequestDetailsState {
  final String errorMSG;

  GetOtherRequestDetailsErrorState({required this.errorMSG});
}

class GetOtherRequestDetailsErrorDataState extends OtherRequestDetailsState {
  final String errorMSG;

  GetOtherRequestDetailsErrorDataState({required this.errorMSG});
}

class OtherRequestApproveSuccessState extends OtherRequestDetailsState {
  final DataSuccess dataSuccess;

  OtherRequestApproveSuccessState(this.dataSuccess);
}

class OtherRequestRejectSuccessState extends OtherRequestDetailsState {
  final DataSuccess dataSuccess;

  OtherRequestRejectSuccessState(this.dataSuccess);
}
