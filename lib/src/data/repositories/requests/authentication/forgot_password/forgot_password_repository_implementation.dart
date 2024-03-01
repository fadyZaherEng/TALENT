import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/forgot_password/forgot_password_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/forgot_password/model/remote_forgot_password_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/forgot_password/request/forgot_password_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/forgot_password/forgot_password_status.dart';
import 'package:talent_link/src/domain/repositories/authentication/forgot_password/forgot_password_repository.dart';

class ForgotPasswordRepositoryImplementation extends ForgotPasswordRepository {
  final ForgotPasswordApiService _forgotPasswordApiService;

  ForgotPasswordRepositoryImplementation(this._forgotPasswordApiService);

  @override
  Future<DataState<ForgotPasswordStatus>> forgotPassword(
      {required String email}) async {
    TalentLinkHrRequest<ForgotPasswordRequest> request =
        await TalentLinkHrRequest<ForgotPasswordRequest>()
            .createRequest(ForgotPasswordRequest(email: email));

    try {
      final httpResponse =
          await _forgotPasswordApiService.forgotPassword(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? RemoteForgotPasswordState())
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
