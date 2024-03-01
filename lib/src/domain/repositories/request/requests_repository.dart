import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';

abstract class RequestsRepository {
  Future<DataState<List<Request>>> getESSPermission({
    required int userTypeId,
  });
}
