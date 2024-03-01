import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/forgot_password/forgot_password_status.dart';

abstract class ForgotPasswordRepository {
  Future<DataState<ForgotPasswordStatus>> forgotPassword({
    required String email,
  });
}
