import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/login/login_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/login/model/remote_user.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/login/request/login_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/user/user.dart';
import 'package:talent_link/src/domain/repositories/authentication/login/login_repository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImplementation(this._loginApiService);

  @override
  Future<DataState<User>> login(
      {required String email, required String password}) async {
    TalentLinkHrRequest<LoginRequest> request =
        await TalentLinkHrRequest<LoginRequest>()
            .createRequest(LoginRequest(email: email, password: password));

    try {
      final httpResponse = await _loginApiService.login(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? RemoteUser()).mapToDomain(),
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
