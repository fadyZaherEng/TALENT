

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/forgot_password/forgot_password_status.dart';
import 'package:talent_link/src/domain/repositories/authentication/forgot_password/forgot_password_repository.dart';

class ForgotPasswordSendEmailUseCase {
  final ForgotPasswordRepository _forgotPasswordRepository;

  ForgotPasswordSendEmailUseCase(this._forgotPasswordRepository);

  Future<DataState<ForgotPasswordStatus>> call({required String email}) async {
    return await _forgotPasswordRepository.forgotPassword(email: email);
  }
}
