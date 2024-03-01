part of 'leave_encashment_details_bloc.dart';

@immutable
abstract class LeaveEncashmentDetailsState {}

class LeaveEncashmentDetailsInitialState extends LeaveEncashmentDetailsState {}

class LeaveEncashmentDetailsShowLoadingState
    extends LeaveEncashmentDetailsState {}

class LeaveEncashmentDetailsHideLoadingState
    extends LeaveEncashmentDetailsState {}

class LeaveEncashmentDetailsLoadingState extends LeaveEncashmentDetailsState {}

class GetLeaveEncashmentDetailsSuccessState
    extends LeaveEncashmentDetailsState {
  final GetLeaveEncashmentDetails getLeaveEncashmentDetails;

  GetLeaveEncashmentDetailsSuccessState({
    required this.getLeaveEncashmentDetails,
  });
}

class LeaveEncashmentDetailsErrorState extends LeaveEncashmentDetailsState {
  final String errorMSG;

  LeaveEncashmentDetailsErrorState({required this.errorMSG});
}

class LeaveEncashmentDetailsErrorDataState extends LeaveEncashmentDetailsState {
  final String errorMSG;

  LeaveEncashmentDetailsErrorDataState({required this.errorMSG});
}

class LeaveEncashmentDetailsApproveState extends LeaveEncashmentDetailsState {
  final DataSuccess dataSuccess;

  LeaveEncashmentDetailsApproveState(this.dataSuccess);
}

class LeaveEncashmentDetailsRejectState extends LeaveEncashmentDetailsState {
  final DataSuccess dataSuccess;

  LeaveEncashmentDetailsRejectState(this.dataSuccess);
}
