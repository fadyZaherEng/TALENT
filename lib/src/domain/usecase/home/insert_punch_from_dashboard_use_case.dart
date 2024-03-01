import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/home/punch.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';

class InsertPunchFromDashboardUseCase {
  final HomeRepository _repository;

  InsertPunchFromDashboardUseCase(this._repository);

  Future<DataState<Punch>> call({
    required String punchTypeSystemCode,
    required String fingerPrint,
    required String latitude,
    required String longitude,
  }) async {
    return await _repository.insertPunch(
        punchTypeSystemCode: punchTypeSystemCode,
        fingerPrint: fingerPrint,
        longitude: longitude,
        latitude: latitude);
  }
}
