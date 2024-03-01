import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/home/news.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';

class GetNewsListUseCase {
  final HomeRepository _repository;

  GetNewsListUseCase(this._repository);

  Future<DataState<List<News>>> call() async {
    return await _repository.getNewsList();
  }
}
