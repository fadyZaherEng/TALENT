import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/request/insert_other_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class OtherRequestRepository {
  Future<DataState<List<RequestType>>> otherRequestTypes();

  Future<DataState<TalentLinkResponse>> insertOtherRequest(
      {required InsertOtherRequest request, File? file});
}
