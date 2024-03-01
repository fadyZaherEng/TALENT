import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/response/remote_get_attachment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'attachment_details_api_service.g.dart';

@RestApi()
abstract class AttachmentDetailsApiService {
  factory AttachmentDetailsApiService(Dio dio) = _AttachmentDetailsApiService;

  @POST(APIKeys.getAttachmentDetails)
  Future<HttpResponse<TalentLinkResponse<RemoteGetAttachmentDetails>>>
  getAttachmentDetails(@Body() TalentLinkHrRequest request);
}
