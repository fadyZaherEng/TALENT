import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/payslip/model/remote_get_payslip.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'get_payslip_api_service.g.dart';

@RestApi()
abstract class GetPayslipApiService {
  factory GetPayslipApiService(Dio dio) = _GetPayslipApiService;

  @POST(APIKeys.payslip)
  Future<HttpResponse<TalentLinkResponse<RemoteGetPayslip>>> getPayslip(
      @Body() TalentLinkHrRequest request);
}
