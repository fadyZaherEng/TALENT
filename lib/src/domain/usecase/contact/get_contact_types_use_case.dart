import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/contact/contact_repository.dart';

class GetContactTypesUseCase {
  final ContactRepository _repository;

  GetContactTypesUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.contactTypes();
  }
}
