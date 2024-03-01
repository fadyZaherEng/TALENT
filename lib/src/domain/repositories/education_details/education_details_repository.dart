import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';

abstract class EducationDetailsRepository {
  Future<DataState<EducationDetails>> getEducationDetails({
    required int transactionId,
  });
}
