import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetAddressDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetAddressDetailsUseCase(this._myRequestsRepository);

  Future<DataState<AddressDetails>> call({required int transactionId}) async {
    return await _myRequestsRepository.getAddressDetails(
        transactionId: transactionId);
  }
}
