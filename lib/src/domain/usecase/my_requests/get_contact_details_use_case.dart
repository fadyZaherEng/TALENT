import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/contact_details/contact_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetContactDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetContactDetailsUseCase(this._myRequestsRepository);

  Future<DataState<ContactDetails>> call({required int transactionId}) async {
    return await _myRequestsRepository.getContactDetails(
        transactionId: transactionId);
  }
}
