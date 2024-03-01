import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/domain/repositories/request/requests_repository.dart';

class GetEssPermissionUseCase {
  final RequestsRepository _repository;

  GetEssPermissionUseCase(this._repository);

  Future<DataState<List<Request>>> call({
    required int userTypeId,
  }) async {
    return await _repository.getESSPermission(userTypeId: userTypeId);
  }
}
