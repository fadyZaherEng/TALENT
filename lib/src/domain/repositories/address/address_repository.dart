import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/address/request/insert_address_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

abstract class AddressRepository {
  Future<DataState<TalentLinkResponse>> insertAddress({
    required InsertAddressRequest request,
  });
}
