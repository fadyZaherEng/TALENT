import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/user/user.dart';

abstract class LoginRepository {
  Future<DataState<User>> login({
    required String email,
    required String password,
  });
}
