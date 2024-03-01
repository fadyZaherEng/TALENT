import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/qualification/qualification_repository.dart';

class QualificationUseCase {
  final QualificationRepository _repository;

  QualificationUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.qualification();
  }
}
