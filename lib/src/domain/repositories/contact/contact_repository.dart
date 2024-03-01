import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/request/insert_contact_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class ContactRepository {
  Future<DataState<List<RequestType>>> contactTypes();

  Future<DataState<TalentLinkResponse>> insertContact({
    required InsertContactRequest request,
  });
}
