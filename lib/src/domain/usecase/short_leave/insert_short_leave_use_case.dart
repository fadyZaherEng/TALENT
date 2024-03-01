import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/insert_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/short_leave/short_leave_repository.dart';

class InsertShortLeaveUseCase {
  final ShortLeaveRepository _shortLeaveRepository;

  InsertShortLeaveUseCase(this._shortLeaveRepository);

  Future<DataState<TalentLinkResponse>> call({
    required InsertShortLeaveRequest request,
    File? file,
  }) async {
    return await _shortLeaveRepository.insertShortLeave(
        request: request, file: file);
  }
}
