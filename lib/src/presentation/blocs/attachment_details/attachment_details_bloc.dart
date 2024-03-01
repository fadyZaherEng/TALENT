import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:talent_link/src/domain/usecase/attachment_details/get_attachment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';

part 'attachment_details_event.dart';

part 'attachment_details_state.dart';

class AttachmentDetailsBloc
    extends Bloc<AttachmentDetailsEvent, AttachmentDetailsState> {
  final GetAttachmentDetailsUseCase _getAttachmentDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  AttachmentDetailsBloc(this._getAttachmentDetailsUseCase,
      this._approveRequestUseCase, this._rejectRequestUseCase)
      : super(AttachmentDetailsInitialState()) {
    on<GetAttachmentDetailsEvent>(_onGetAttachmentDetailsEvent);
    on<AttachmentDetailsApproveEvent>(_onAttachmentDetailsApproveEvent);
    on<AttachmentDetailsRejectEvent>(_onAttachmentDetailsRejectEvent);
  }

  FutureOr<void> _onGetAttachmentDetailsEvent(GetAttachmentDetailsEvent event,
      Emitter<AttachmentDetailsState> emit) async {
    DataState dataState =
        await _getAttachmentDetailsUseCase(transactionId: event.transactionId);
    if (dataState is DataSuccess<AttachmentDetails>) {
      emit(AttachmentDetailsSuccessState(attachmentDetails: dataState.data!));
    } else {
      emit(AttachmentDetailsErrorState(
          errorMessage: dataState.message!.toString()));
    }
  }

  FutureOr<void> _onAttachmentDetailsApproveEvent(
      AttachmentDetailsApproveEvent event,
      Emitter<AttachmentDetailsState> emit) async {
    emit(AttachmentDetailsLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AttachmentDetailsApproveSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(AttachmentDetailsApproveErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onAttachmentDetailsRejectEvent(
      AttachmentDetailsRejectEvent event,
      Emitter<AttachmentDetailsState> emit) async {
    emit(AttachmentDetailsLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      
      emit(AttachmentDetailsRejectSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(AttachmentDetailsRejectErrorState(
          errorMessage: dataState.message.toString()));
    }
  }
}
