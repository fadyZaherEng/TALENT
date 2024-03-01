import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/user/user.dart';
import 'package:talent_link/src/domain/repositories/authentication/login/login_repository.dart';

class LoginUseCase {
  final LoginRepository? _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<DataState<User>> call(
      {required String email, required String password}) async {
    return await _loginRepository!.login(email: email, password: password);
  }
}
