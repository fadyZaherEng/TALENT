import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/home/home_data.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';

class GetHomeDataForDashboardUseCase {
  final HomeRepository _homeRepository;

  GetHomeDataForDashboardUseCase(this._homeRepository);

  Future<DataState<HomeData>> call() async {
    return await _homeRepository.getHomeDataForDashBoard();
  }
}
