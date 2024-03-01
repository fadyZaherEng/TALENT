import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/payslip/get_payslip_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/payslip/model/remote_get_payslip.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/payslip/request/get_payslip_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/domain/repositories/payslip/get_payslip_repository.dart';

class GetPayslipRepositoryImplementation extends GetPaySlipRepository {
  final GetPayslipApiService _getPayslipApiService;

  GetPayslipRepositoryImplementation(this._getPayslipApiService);

  @override
  Future<DataState<Payslip>> getPayslip({
    required int employeeId,
    required String month,
    required int year,
  }) async {
    try {
      TalentLinkHrRequest<PayslipRequest> request =
          await TalentLinkHrRequest<PayslipRequest>()
              .createRequest(PayslipRequest(
        employeeId: employeeId,
        month: month,
        year: year,
      ));

      final httpResponse = await _getPayslipApiService.getPayslip(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? const RemoteGetPayslip())
              .mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
