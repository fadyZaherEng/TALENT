import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/domain/repositories/payslip/get_payslip_repository.dart';

class PayslipUseCase {
  final GetPaySlipRepository _payslipRepository;
  PayslipUseCase(this._payslipRepository);
  Future<DataState<Payslip>> call({
    required int employeeId,
    required String month,
    required int year,
  }) async {
    return await _payslipRepository.getPayslip(
      employeeId: employeeId,
      month: month,
      year: year,
    );
  }
}
