import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/request/insert_contact_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/contact/contact_repository.dart';

class InsertContactUseCase {
  final ContactRepository _repository;

  InsertContactUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertContactRequest request}) async {
    return await _repository.insertContact(request: request);
  }
}
