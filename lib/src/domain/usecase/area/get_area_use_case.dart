import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/area/area_repository.dart';

class GetAreaUseCase {
  final AreaRepository _repository;

  GetAreaUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.area();
  }
}
