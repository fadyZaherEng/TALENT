import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';

@immutable
abstract class ResumeDutyDetailsState {}

class ResumeDutyDetailsInitialState extends ResumeDutyDetailsState {}

class ResumeDutyDetailsHideLoadingState extends ResumeDutyDetailsState {}

class ResumeDutyDetailsShowLoadingState extends ResumeDutyDetailsState {}

class ResumeDutyDetailsLoadingState extends ResumeDutyDetailsState {}

class GetResumeDutyDetailsSuccessState extends ResumeDutyDetailsState {
  final GetResumeDutyDetails getResumeDutyDetails;

  GetResumeDutyDetailsSuccessState(this.getResumeDutyDetails);
}

class ResumeDutyDetailsErrorState extends ResumeDutyDetailsState {
  final String errorMSG;

  ResumeDutyDetailsErrorState({
    required this.errorMSG,
  });
}

class ResumeDutyDetailsErrorDataState extends ResumeDutyDetailsState {
  final String errorMSG;

  ResumeDutyDetailsErrorDataState({
    required this.errorMSG,
  });
}

class ResumeDutyDetailsApproveSuccessState extends ResumeDutyDetailsState {
  final DataSuccess dataSuccess;

  ResumeDutyDetailsApproveSuccessState(this.dataSuccess);
}

class ResumeDutyDetailsRejectSuccessState extends ResumeDutyDetailsState {
  final DataSuccess dataSuccess;

  ResumeDutyDetailsRejectSuccessState(this.dataSuccess);
}
