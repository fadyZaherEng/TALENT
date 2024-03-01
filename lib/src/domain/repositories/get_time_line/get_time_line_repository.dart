import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';

abstract class GetTimeLineRepository {
  Future<DataState<List<GetTimeLine>>> getTimeLine({
    required int tableId,
    required int transactionId,
    required String baseUrl,
  });
}
