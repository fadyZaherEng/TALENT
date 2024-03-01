import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';

@immutable
abstract class IndemnityEncashmentDetailsState {}

class IndemnityEncashmentDetailsInitialState
    extends IndemnityEncashmentDetailsState {}

class IndemnityEncashmentDetailsShowLoadingState
    extends IndemnityEncashmentDetailsState {}

class IndemnityEncashmentDetailsHideLoadingState
    extends IndemnityEncashmentDetailsState {}

class IndemnityEncashmentDetailsLoadingState
    extends IndemnityEncashmentDetailsState {}

class GetIndemnityEncashmentDetailsSuccessState
    extends IndemnityEncashmentDetailsState {
  final GetIndemnityEncashmentDetails getIndemnityEncashmentDetails;

  GetIndemnityEncashmentDetailsSuccessState(this.getIndemnityEncashmentDetails);
}

class GetIndemnityEncashmentDetailsErrorState
    extends IndemnityEncashmentDetailsState {
  final String errorMSG;

  GetIndemnityEncashmentDetailsErrorState({
    required this.errorMSG,
  });
}

class GetIndemnityEncashmentDetailsErrorDataState
    extends IndemnityEncashmentDetailsState {
  final String errorMSG;

  GetIndemnityEncashmentDetailsErrorDataState({
    required this.errorMSG,
  });
}

class IndemnityEncashmentDetailsApproveSuccessState
    extends IndemnityEncashmentDetailsState {
  final DataSuccess dataSuccess;

  IndemnityEncashmentDetailsApproveSuccessState(this.dataSuccess);
}

class IndemnityEncashmentDetailsRejectSuccessState
    extends IndemnityEncashmentDetailsState {
  final DataSuccess dataSuccess;

  IndemnityEncashmentDetailsRejectSuccessState(this.dataSuccess);
}
