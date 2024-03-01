import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/model/remote_attachment_type.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'attachement_api_service.g.dart';

@RestApi()
abstract class AttachmentApiService {
  factory AttachmentApiService(Dio dio) = _AttachmentApiService;

  @POST(APIKeys.getAttachmentTypeList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteAttachmentType>>>> attachmentType(
      @Body() TalentLinkHrRequest request);


  @POST(APIKeys.insertAttachment)
  @MultiPart()
  Future<HttpResponse<TalentLinkResponse>> insertAttachment(
      @Part(name: 'requestbody') String requestBody,
      @Part(name: "Files") List<MultipartFile> file,
      );
}
