import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/half_day/half_day_repository.dart';

class GetHalfDayTypesUseCase {
  final HalfDayRepository _repository;

  GetHalfDayTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call(int employeeId) async {
    return await _repository.halfDayTypes(employeeId);
  }
}
