import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/asset_details/asset_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_asset_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';

part 'asset_details_event.dart';

part 'asset_details_state.dart';

class AssetDetailsBloc extends Bloc<AssetDetailsEvent, AssetDetailsState> {
  final GetAssetDetailsUseCase getAssetDetailsUseCase;
  final RejectRequestUseCase rejectRequestUseCase;
  final ApproveRequestUseCase approveRequestUseCase;

  AssetDetailsBloc(
      {required this.getAssetDetailsUseCase,
      required this.approveRequestUseCase,
      required this.rejectRequestUseCase})
      : super(AssetDetailsInitial()) {
    on<GetAssetDetailsEvent>(_onGetAssetDetailsEvent);
    on<AssetApproveRequestEvent>(_onAssetApproveRequestEvent);
    on<AssetRejectRequestEvent>(_onAssetRejectRequestEvent);
  }

  Future<void> _onGetAssetDetailsEvent(
      GetAssetDetailsEvent event, Emitter<AssetDetailsState> emit) async {
    DataState dataState =
        await getAssetDetailsUseCase(transactionId: event.transactionId);
    if (dataState is DataSuccess) {
      emit(SuccessGetAssetDetailsDataState(assetDetails: dataState.data));
    } else {
      emit(AssetDetailsErrorDataState(errorMSG: dataState.message.toString()));
    }
  }

  Future<void> _onAssetApproveRequestEvent(
      AssetApproveRequestEvent event, Emitter<AssetDetailsState> emit) async {
    emit(AssetDetailsShowLoadingState());
    DataState dataState = await approveRequestUseCase(
      transactionId: event.transactionId!,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AssetDetailsHideLoadingState());
      emit(AssetDetailsApproveSuccessState(dataState));
    } else {
      emit(AssetDetailsHideLoadingState());
      emit(AssetDetailsErrorDataState(errorMSG: dataState.message.toString()));
    }
  }

  Future<void> _onAssetRejectRequestEvent(
      AssetRejectRequestEvent event, Emitter<AssetDetailsState> emit) async {
    emit(AssetDetailsShowLoadingState());
    DataState dataState = await rejectRequestUseCase(
      transactionId: event.transactionId!,
      requestTypeId: event.referenceId,
      employeeId: event.employeeId,
    );
    if (dataState is DataSuccess) {
      emit(AssetDetailsHideLoadingState());
      emit(AssetDetailsRejectSuccessState(dataState));
    } else {
      emit(AssetDetailsHideLoadingState());
      emit(AssetDetailsErrorDataState(errorMSG: dataState.message.toString()));
    }
  }
}
