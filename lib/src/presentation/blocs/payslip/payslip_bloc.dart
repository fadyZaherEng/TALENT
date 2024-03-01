// ignore_for_file: depend_on_referenced_packages, avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/domain/usecase/home/get_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/payslip/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/payslip/payslip_use_case.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_event.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_state.dart';

class PayslipBloc extends Bloc<PayslipEvent, PayslipState> {
  final PayslipUseCase _payslipUseCase;
  final GetPayslipEmployeeIdUseCase _getEmployeeIdUseCase;
  final GetCurrencyUseCase _getCurrencyUseCase;

  PayslipBloc(
    this._payslipUseCase,
    this._getEmployeeIdUseCase,
    this._getCurrencyUseCase,
  ) : super(PayslipInitialState()) {
    on<PayslipGetDataEvent>(_onPayslipGetDataEvent);
    on<PayslipGetChangeDataEvent>(_onPayslipGetChangeDataEvent);
  }

  Future<void> _onPayslipGetDataEvent(
      PayslipGetDataEvent event, Emitter<PayslipState> emit) async {
    emit(PayslipGetDataLoadingState());
    DataState dataState = await _payslipUseCase(
      employeeId: (await _getEmployeeIdUseCase()) ?? 0,
      month: event.month,
      year: event.year,
    );
    if (dataState is DataSuccess<Payslip>) {
      emit(PayslipGetDataSuccessState(
        payslipModel: Payslip(
          additionsAmount: dataState.data!.additionsAmount,
          allowancesAmount: dataState.data!.allowancesAmount,
          currency: (await _getCurrencyUseCase()) ?? '',
          deductionsAmount: dataState.data!.deductionsAmount,
          netTotalAmount: dataState.data!.netTotalAmount,
        ),
      ));
    } else {
      emit(PayslipGetDataErrorState(
        errorMSG: dataState.error.toString(),
      ));
    }
  }

  FutureOr<void> _onPayslipGetChangeDataEvent(
      PayslipGetChangeDataEvent event, Emitter<PayslipState> emit) async {
    emit(PayslipGetChangeDataLoadingState());
    DataState dataState = await _payslipUseCase(
      employeeId: (await _getEmployeeIdUseCase()) ?? 0,
      month: event.month,
      year: event.year,
    );
    if (dataState is DataSuccess<Payslip>) {
      emit(PayslipGetChangeDataSuccessState(
        payslipModel: Payslip(
          additionsAmount: dataState.data!.additionsAmount,
          allowancesAmount: dataState.data!.allowancesAmount,
          currency: (await _getCurrencyUseCase()) ?? '',
          deductionsAmount: dataState.data!.deductionsAmount,
          netTotalAmount: dataState.data!.netTotalAmount,
        ),
      ));
      emit(PayslipHideLoadingState());
    } else {
      emit(PayslipGetChangeDataErrorState(
        errorMSG: dataState.error.toString(),
      ));
      emit(PayslipHideLoadingState());
    }
  }
}
