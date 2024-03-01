import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_address_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';

part 'address_details_event.dart';

part 'address_details_state.dart';

class AddressDetailsBloc
    extends Bloc<AddressDetailsEvent, AddressDetailsState> {
  final GetAddressDetailsUseCase _getAddressDetailsUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final ApproveRequestUseCase _approveRequestUseCase;

  AddressDetailsBloc(this._getAddressDetailsUseCase,
      this._approveRequestUseCase, this._rejectRequestUseCase)
      : super(AddressDetailsInitialState()) {
    on<GetAddressDetailsEvent>(_onGetAddressDetailsEvent);
    on<AddressDetailsApproveEvent>(_onAddressDetailsApproveEvent);
    on<AddressDetailsRejectEvent>(_onAddressDetailsRejectEvent);
  }

  FutureOr<void> _onGetAddressDetailsEvent(
      GetAddressDetailsEvent event, Emitter<AddressDetailsState> emit) async {
    DataState dataState =
        await _getAddressDetailsUseCase(transactionId: event.transactionId);
    if (dataState is DataSuccess<AddressDetails>) {
      emit(AddressDetailsSuccessState(addressDetails: dataState.data!));
    } else {
      emit(AddressDetailsErrorState(
          errorMessage: dataState.message!.toString()));
    }
  }

  FutureOr<void> _onAddressDetailsApproveEvent(AddressDetailsApproveEvent event,
      Emitter<AddressDetailsState> emit) async {
    emit(AddressDetailsLoadingState());
    DataState dataState = await _approveRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AddressDetailsApproveSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(AddressDetailsApproveErrorState(
          errorMessage: dataState.message.toString()));
    }
  }

  FutureOr<void> _onAddressDetailsRejectEvent(AddressDetailsRejectEvent event,
      Emitter<AddressDetailsState> emit) async {
    emit(AddressDetailsLoadingState());
    DataState dataState = await _rejectRequestUseCase(
      transactionId: event.transactionId,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AddressDetailsRejectSuccessState(dataSuccess: dataState));
    } else if (dataState is DataFailed) {
      emit(AddressDetailsRejectErrorState(
          errorMessage: dataState.message.toString()));
    }
  }
}
