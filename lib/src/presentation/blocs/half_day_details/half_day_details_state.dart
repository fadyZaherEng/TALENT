import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/half_day_details.dart';

@immutable
abstract class HalfDayDetailsState {}

class HalfDayDetailsInitialState extends HalfDayDetailsState {}

class HalfDayDetailsShowLoadingState extends HalfDayDetailsState {}

class HalfDayDetailsHideLoadingState extends HalfDayDetailsState {}

class HalfDayDetailsLoadingState extends HalfDayDetailsState {}

class GetHalfDayDetailsSuccessState extends HalfDayDetailsState {
  final GetHalfDayLeaveDetails getHalfDayDetails;

  GetHalfDayDetailsSuccessState(this.getHalfDayDetails);
}

class GetHalfDayDetailsErrorState extends HalfDayDetailsState {
  final String errorMSG;

  GetHalfDayDetailsErrorState({required this.errorMSG});
}

class GetHalfDayDetailsErrorDataState extends HalfDayDetailsState {
  final String errorMSG;

  GetHalfDayDetailsErrorDataState({
    required this.errorMSG,
  });
}

class HalfDayDetailsApproveSuccessState extends HalfDayDetailsState {
  final DataSuccess dataSuccess;

  HalfDayDetailsApproveSuccessState(this.dataSuccess);
}

class HalfDayDetailsRejectSuccessState extends HalfDayDetailsState {
  final DataSuccess dataSuccess;

  HalfDayDetailsRejectSuccessState(this.dataSuccess);
}
