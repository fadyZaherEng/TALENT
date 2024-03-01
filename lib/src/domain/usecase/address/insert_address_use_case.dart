import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/address/request/insert_address_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/address/address_repository.dart';

class InsertAddressUseCase {
  final AddressRepository _repository;
  InsertAddressUseCase(this._repository);
  Future<DataState<TalentLinkResponse>> call({
    required InsertAddressRequest request,
    File? file,
  }) async {
    return await _repository.insertAddress(request: request);
  }
}
