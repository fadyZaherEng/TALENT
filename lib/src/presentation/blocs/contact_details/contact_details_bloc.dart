import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/contact_details/contact_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_contact_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';

part 'contact_details_event.dart';

part 'contact_details_state.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  final GetContactDetailsUseCase _getContactDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  ContactDetailsBloc(this._getContactDetailsUseCase,
      this._approveRequestUseCase, this._rejectRequestUseCase)
      : super(ContactDetailsInitialState()) {
    on<GetContactDetailsEvent>(_onGetContactDetailsEvent);
    on<ContactDetailsApproveEvent>(_onContactDetailsApproveEvent);
    on<ContactDetailsRejectEvent>(_onContactDetailsRejectEvent);
  }

  FutureOr<void> _onGetContactDetailsEvent(
      GetContactDetailsEvent event, Emitter<ContactDetailsState> emit) async {
    DataState dataState =
        await _getContactDetailsUseCase(transactionId: event.transactionId);
    if (dataState is DataSuccess<ContactDetails>) {
      emit(ContactDetailsSuccessState(contactDetails: dataState.data!));
    } else {
      emit(ContactDetailsErrorState(
          errorMessage: dataState.message!.toString()));
    }
  }

  FutureOr<void> _onContactDetailsApproveEvent(ContactDetailsApproveEvent event,
      Emitter<ContactDetailsState> emit) async {
    emit(ContactDetailsLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(ContactDetailsApproveSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(ContactDetailsApproveErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onContactDetailsRejectEvent(ContactDetailsRejectEvent event,
      Emitter<ContactDetailsState> emit) async {
    emit(ContactDetailsLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(ContactDetailsRejectSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(ContactDetailsRejectErrorState(
          errorMessage: dataState.message.toString()));
    }
  }
}
