import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';

@immutable
abstract class ShortLeaveDetailsState {}

class ShortLeaveDetailsInitialState extends ShortLeaveDetailsState {}

class ShortLeaveDetailsShowLoadingState extends ShortLeaveDetailsState {}

class ShortLeaveDetailsHideLoadingState extends ShortLeaveDetailsState {}

class ShortLeaveDetailsLoadingState extends ShortLeaveDetailsState {}

class GetShortLeaveDetailsSuccessState extends ShortLeaveDetailsState {
  final GetShortLevelDetails getShortLevelDetails;

  GetShortLeaveDetailsSuccessState(this.getShortLevelDetails);
}

class ShortLeaveDetailsErrorState extends ShortLeaveDetailsState {
  final String errorMSG;

  ShortLeaveDetailsErrorState({required this.errorMSG});
}

class ShortLeaveDetailsErrorDataState extends ShortLeaveDetailsState {
  final String errorMSG;

  ShortLeaveDetailsErrorDataState({required this.errorMSG});
}

class ShortLeaveDetailsApproveState extends ShortLeaveDetailsState {
  final DataSuccess dataSuccess;

  ShortLeaveDetailsApproveState(this.dataSuccess);
}

class ShortLeaveDetailsRejectState extends ShortLeaveDetailsState {
  final DataSuccess dataSuccess;

  ShortLeaveDetailsRejectState(this.dataSuccess);
}
