import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/more/update_notification/request/update_notification_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'update_notification_api_service.g.dart';

@RestApi()
abstract class UpdateNotificationApiService {
  factory UpdateNotificationApiService(Dio dio) = _UpdateNotificationApiService;

  @POST(APIKeys.updateAllowNotification)
  Future<HttpResponse<TalentLinkResponse<bool>>> updateNotification(
      @Body() TalentLinkHrRequest<UpdateNotificationRequest> request);
}
