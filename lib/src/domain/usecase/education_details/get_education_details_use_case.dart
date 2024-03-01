import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';
import 'package:talent_link/src/domain/repositories/education_details/education_details_repository.dart';

class GetEducationDetailsUseCase {
  final EducationDetailsRepository _repository;

  GetEducationDetailsUseCase(this._repository);

  Future<DataState<EducationDetails>> call({
    required int transactionId,
  }) async {
    return await _repository.getEducationDetails(transactionId: transactionId);
  }
}
