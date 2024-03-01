import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';

@immutable
abstract class LeaveDetailsState {}

class LeaveDetailsInitialState extends LeaveDetailsState {}

class LeaveDetailsShowLoadingState extends LeaveDetailsState {}

class LeaveDetailsHideLoadingState extends LeaveDetailsState {}

class LeaveDetailsLoadingState extends LeaveDetailsState {}

class GetLeaveDetailsSuccessState extends LeaveDetailsState {
  final GetLeaveDetails getLeaveDetails;

  GetLeaveDetailsSuccessState(this.getLeaveDetails);
}

class LeaveDetailsErrorState extends LeaveDetailsState {
  final String errorMSG;

  LeaveDetailsErrorState({
    required this.errorMSG,
  });
}

class LeaveDetailsErrorDataState extends LeaveDetailsState {
  final String errorMSG;

  LeaveDetailsErrorDataState({
    required this.errorMSG,
  });
}

class LeaveDetailsApproveState extends LeaveDetailsState {
  final DataSuccess dataSuccess;

  LeaveDetailsApproveState(this.dataSuccess);
}

class LeaveDetailsRejectState extends LeaveDetailsState {
  final DataSuccess dataSuccess;

  LeaveDetailsRejectState(this.dataSuccess);
}


class LeaveDetailsPopState extends LeaveDetailsState {}
