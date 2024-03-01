import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetAllRequestsListUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetAllRequestsListUseCase(this._myRequestsRepository);

  Future<DataState<List<RequestType>>> call({
    int transactionId = 29,
  }) async {
    return _myRequestsRepository.getAllRequestsList();
  }
}
