import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/flavour_enum.dart';

import 'package:talent_link/src/data/sources/remote/talent_link_hr/address/address_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/area/area_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/asset_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/attachement_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/attachment_details_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attendance_history/attendance_history_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/forgot_password/forgot_password_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/authentication/login/login_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/contact_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/countries/countries_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education/education_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/education_details_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_subscribe_info/get_subscribe_info_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/get_time_line/get_time_line_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/home_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/more/update_notification/update_notification_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_requests/my_requests_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_attendance/get_my_team_attendance_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/my_team_request/get_my_team_request_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/payslip/get_payslip_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/get_employee_profile_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/qualification/qualification_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/request/request_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/air_ticket_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/all_fields/all_fields_mandatory_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/half_day_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/indemnity_encashment_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave/leave_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/leave_encashment/leave_encashment_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/loan/loan_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/notifications/notifications_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/other_request_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/payment_method/payment_method_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/resume_duty_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/short_leave_api_service.dart';

final injector = GetIt.instance;

Future<void> initializeDataDependencies() async {
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = Flavor.baseUrl
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  injector.registerFactory<LeaveApiService>(() => LeaveApiService(injector()));

  injector.registerFactory<LeaveEncashmentApiService>(
      () => LeaveEncashmentApiService(injector()));

  injector.registerFactory<ShortLeaveApiService>(
      () => ShortLeaveApiService(injector()));

  injector.registerFactory<PaymentMethodApiService>(
      () => PaymentMethodApiService(injector()));

  injector.registerFactory<LoanApiService>(() => LoanApiService(injector()));
  injector
      .registerFactory<HalfDayApiService>(() => HalfDayApiService(injector()));

  injector.registerFactory<ResumeDutyApiService>(
      () => ResumeDutyApiService(injector()));

  injector.registerFactory<OtherRequestApiService>(
      () => OtherRequestApiService(injector()));

  injector.registerFactory<AllFieldsMandatoryApiService>(
      () => AllFieldsMandatoryApiService(injector()));

  injector.registerFactory<RequestsApiService>(
      () => RequestsApiService(injector()));

  injector.registerFactory<NotificationsApiService>(
      () => NotificationsApiService(injector()));

  injector.registerFactory<AirTicketApiService>(
      () => AirTicketApiService(injector()));

  injector.registerFactory<IndemnityEncashmentApiService>(
      () => IndemnityEncashmentApiService(injector()));
  injector
      .registerFactory<LoginApiService>(() => (LoginApiService(injector())));
  injector.registerFactory<GetSubscribeInfoApiService>(
      () => (GetSubscribeInfoApiService(injector())));

  injector.registerFactory<ForgotPasswordApiService>(
      () => ForgotPasswordApiService(injector()));

  injector.registerFactory<HomeApiService>(() => HomeApiService(injector()));

  injector.registerFactory<UpdateNotificationApiService>(
      () => UpdateNotificationApiService(injector()));

  injector.registerFactory<QualificationApiService>(
      () => QualificationApiService(injector()));

  injector.registerFactory<AssetApiService>(() => AssetApiService(injector()));
  injector
      .registerFactory<ContactApiService>(() => ContactApiService(injector()));
  injector.registerFactory<AttendanceHistoryApiService>(
      () => AttendanceHistoryApiService(injector()));

  injector.registerFactory<MyTeamAttendanceApiService>(
      () => MyTeamAttendanceApiService(injector()));

  injector.registerFactory<GetTimeLineApiService>(
      () => GetTimeLineApiService(injector()));

  injector.registerFactory<AreaApiService>(() => AreaApiService(injector()));

  injector.registerFactory<GetMyTeamRequestApiService>(
      () => GetMyTeamRequestApiService(injector()));

  injector.registerFactory<MyRequestApiService>(
      () => MyRequestApiService(injector()));
  injector.registerFactory<GetPayslipApiService>(
      () => GetPayslipApiService(injector()));

  injector.registerFactory<CountriesApiService>(
      () => CountriesApiService(injector()));

  injector.registerFactory<EducationApiService>(
      () => EducationApiService(injector()));

  injector.registerFactory<GetEmployeeProfileApiService>(
      () => GetEmployeeProfileApiService(injector()));

  injector
      .registerFactory<AddressApiService>(() => AddressApiService(injector()));
  injector.registerFactory<AttachmentApiService>(
      () => AttachmentApiService(injector()));

  injector.registerFactory<EducationDetailsApiService>(
      () => EducationDetailsApiService(injector()));
  injector.registerFactory<AttachmentDetailsApiService>(
      () => AttachmentDetailsApiService(injector()));
}
