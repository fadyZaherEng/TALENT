import 'package:talent_link/src/data/repositories/attachment_details/attachment_details_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/education_details/education_details_repository_implementaion.dart';
import 'package:talent_link/src/domain/repositories/attachment_details/attachment_details_repository.dart';
import "package:talent_link/src/domain/repositories/contact/contact_repository.dart";
import 'package:talent_link/src/data/repositories/address/address_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/area/area_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/asset/asset_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/attachemnt/attachment_repository_implemenation.dart';
import 'package:talent_link/src/data/repositories/attendance_histiory/attendance_history_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/contact/contact_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/countries/countries_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/education/education_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/get_my_team_request/get_my_team_request_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/get_subscribe_info/get_subscribe_info_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/get_time_line/get_time_line_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/home/home_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/more/update_notification/update_notification_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/my_requests/my_requests_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/my_team_attendance/get_my_team_attendance_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/notifications/notifications_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/payslip/get_payslip_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/profile/get_employee_profile_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/qualification/qualification_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/request/requests_repository_implemintaion.dart';
import 'package:talent_link/src/data/repositories/requests/air_ticket/air_ticket_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/all_fields/all_fields_mandatory_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/authentication/forgot_password/forgot_password_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/authentication/login/login_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/half_day/half_day_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/indemnity_encashment/indemnity_encashment_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/leave/leave_repository_implementation.dart';
import 'package:talent_link/src/data/repositories/requests/leave_encashment/leave_encashment_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/loan/loan_types_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/other_request/other_request_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/payment_method/payment_method_repository_implemintaion.dart';
import 'package:talent_link/src/data/repositories/requests/resume_duty/resume_duty_repository_implementaion.dart';
import 'package:talent_link/src/data/repositories/requests/short_leave/short_leave_repository_implemention.dart';
import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/repositories/address/address_repository.dart';
import 'package:talent_link/src/domain/repositories/area/area_repository.dart';
import 'package:talent_link/src/domain/repositories/asset/asset_repository.dart';
import 'package:talent_link/src/domain/repositories/attachment/attachment_repository.dart';
import 'package:talent_link/src/domain/repositories/attendance_history/attendance_history_repository.dart';
import 'package:talent_link/src/domain/repositories/authentication/forgot_password/forgot_password_repository.dart';
import 'package:talent_link/src/domain/repositories/authentication/login/login_repository.dart';
import 'package:talent_link/src/domain/repositories/countries/countries_repository.dart';
import 'package:talent_link/src/domain/repositories/education/education_repository.dart';
import 'package:talent_link/src/domain/repositories/education_details/education_details_repository.dart';
import 'package:talent_link/src/domain/repositories/get_my_team_request/get_my_team_request_repository.dart';
import 'package:talent_link/src/domain/repositories/get_subscribe_info/get_subscribe_info_repository.dart';
import 'package:talent_link/src/domain/repositories/get_time_line/get_time_line_repository.dart';
import 'package:talent_link/src/domain/repositories/home/home_repository.dart';
import 'package:talent_link/src/domain/repositories/more/update_notification/update_notification_repository.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';
import 'package:talent_link/src/domain/repositories/my_team_attendance/get_my_team_attendance_repository.dart';
import 'package:talent_link/src/domain/repositories/payslip/get_payslip_repository.dart';
import 'package:talent_link/src/domain/repositories/profile/get_profile_employee_repository.dart';
import 'package:talent_link/src/domain/repositories/qualification/qualification_repository.dart';
import 'package:talent_link/src/domain/repositories/request/requests_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/air_ticket/air_ticket_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/all_fields_mandatory/all_fields_mandatory_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/half_day/half_day_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/indemnity_encashment/indemnity_encashment_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/leave/leave_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/leave_encashment/leave_encashment_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/loan/loan_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/notifications/notifications_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/other_request/other_request_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/payment_method/payment_method_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';
import 'package:talent_link/src/domain/repositories/requests/short_leave/short_leave_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<LeaveRepository>(
      () => LeaveRepositoryImplementation(injector()));
  injector.registerFactory<LeaveEncashmentRepository>(
      () => LeaveEncashmentRepositoryImplementation(injector()));
  injector.registerFactory<ShortLeaveRepository>(
      () => ShortLeaveRepositoryImplementation(injector()));
  injector.registerFactory<PaymentMethodRepository>(
      () => PaymentMethodRepositoryImplementation(injector()));
  injector.registerFactory<LoanRepository>(
      () => LoanRepositoryImplementation(injector()));
  injector.registerFactory<HalfDayRepository>(
      () => HalfDayRepositoryImplementation(injector()));
  injector.registerFactory<ResumeDutyRepository>(
      () => ResumeDutyRepositoryImplementation(injector()));
  injector.registerFactory<OtherRequestRepository>(
      () => OtherRequestRepositoryImplementation(injector()));
  injector.registerFactory<AllFieldsMandatoryRepository>(
      () => AllFieldsMandatoryRepositoryImplementation(injector()));
  injector.registerFactory<GetPaySlipRepository>(
      () => GetPayslipRepositoryImplementation(injector()));
  injector.registerFactory<RequestsRepository>(
      () => RequestsRepositoryImplementation(injector()));
  injector.registerFactory<GetProfileEmployeeRepository>(
      () => GetEmployeeProfileRepositoryImplementation(injector()));
  injector.registerFactory<NotificationsRepository>(
      () => NotificationsRepositoryImplementation(injector()));
  injector.registerFactory<AirTicketRepository>(
      () => AirTicketRepositoryImplementation(injector()));
  injector.registerFactory<IndemnityEncashmentRepository>(
      () => IndemnityEncashmentRepositoryImplementation(injector()));
  injector.registerFactory<LoginRepository>(
      () => LoginRepositoryImplementation(injector()));
  injector.registerFactory<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImplementation(injector()));
  injector.registerFactory<AssetRepository>(
      () => AssetRepositoryImplementation(injector()));
  injector.registerFactory<HomeRepository>(
      () => HomeRepositoryImplementation(injector()));
  injector.registerFactory<UpdateNotificationRepository>(
      () => UpdateNotificationRepositoryImplementation(injector()));
  injector.registerFactory<QualificationRepository>(
      () => QualificationRepositoryImplementation(injector()));
  injector.registerFactory<ContactRepository>(
      () => ContactRepositoryImplementation(injector()));
  injector.registerFactory<AttendanceHistoryRepository>(
      () => AttendanceHistoryRepositoryImplementation(injector()));
  injector.registerFactory<GetMyTeamAttendanceRepository>(
      () => GetMyTeamAttendanceRepositoryImplementation(injector()));
  injector.registerFactory<GetTimeLineRepository>(
      () => GetTimeLineRepositoryImplementation(injector()));
  injector.registerFactory<AreaRepository>(
      () => AreaRepositoryImplementation(injector()));
  injector.registerFactory<GetMyTeamRequestRepository>(
      () => GetMyTeamRequestRepositoryImplementation(injector()));
  injector.registerFactory<MyRequestsRepository>(
      () => MyRequestsRepositoryImplementation(injector()));
  injector.registerFactory<CountriesRepository>(
      () => CountriesRepositoryImplementation(injector()));
  injector.registerFactory<EducationRepository>(
      () => EducationRepositoryImplementation(injector()));
  injector.registerFactory<AddressRepository>(
      () => AddressRepositoryImplementation(injector()));
  injector.registerFactory<AttachmentRepository>(
      () => AttachmentRepositoryImplementation(injector()));
  injector.registerFactory<GetSubscribeInfoRepository>(
      () => GetSubscribeInfoRepositoryImplementation(injector()));
  injector.registerFactory<EducationDetailsRepository>(
      () => EducationDetailsRepositoryImplementation(injector()));
  injector.registerFactory<AttachmentDetailsRepository>(
      () => AttachmentDetailsRepositoryImplementation(injector()));
}
