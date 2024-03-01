import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/home/last_update_request.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';

class GetLastRequestsForDashboardUseCase {
  final HomeRepository _homeRepository;

  GetLastRequestsForDashboardUseCase(this._homeRepository);

  Future<DataState<LastUpdateRequests>> call() async {
    return await _homeRepository.getLastRequestsFroDashboard();
  }
}
