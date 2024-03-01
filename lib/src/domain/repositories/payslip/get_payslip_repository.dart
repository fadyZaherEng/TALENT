import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';

abstract class GetPaySlipRepository {
  Future<DataState<Payslip>> getPayslip({
    required int employeeId,
    required String month,
    required int year,
  });
}
