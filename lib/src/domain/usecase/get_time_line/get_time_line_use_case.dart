import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';
import 'package:talent_link/src/domain/repositories/get_time_line/get_time_line_repository.dart';

class GetTimeLineUseCase {
  final GetTimeLineRepository _getTimeLineRepository;

  GetTimeLineUseCase(this._getTimeLineRepository);

  Future<DataState<List<GetTimeLine>>> call({
    required int tableId,
    required int transactionId,
    required String baseUrl,
  }) async {
    return await _getTimeLineRepository.getTimeLine(
        tableId: tableId, transactionId: transactionId, baseUrl: baseUrl);
  }
}
