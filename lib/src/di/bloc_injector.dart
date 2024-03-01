import 'package:talent_link/src/presentation/blocs/about_us/about_us_bloc.dart';
import 'package:talent_link/src/presentation/blocs/address/address_bloc.dart';
import 'package:talent_link/src/presentation/blocs/address_details/address_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket/air_ticket_bloc.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket_details/air_ticket_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/asset/asset_bloc.dart';
import 'package:talent_link/src/presentation/blocs/asset_details/asset_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/attachment/attachment_bloc.dart';
import 'package:talent_link/src/presentation/blocs/attachment_details/attachment_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/attendance_history/attendance_history_bloc.dart';
import 'package:talent_link/src/presentation/blocs/business_trip/business_trip_bloc.dart';
import 'package:talent_link/src/presentation/blocs/contact/contact_bloc.dart';
import 'package:talent_link/src/presentation/blocs/contact_details/contact_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/education/education_bloc.dart';
import 'package:talent_link/src/presentation/blocs/education_details/education_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:talent_link/src/presentation/blocs/half_day_details/half_day_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/half_day_leave/half_day_leave_bloc.dart';
import 'package:talent_link/src/presentation/blocs/home/home_bloc.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment/indemnity_encashment_bloc.dart';
import 'package:talent_link/src/presentation/blocs/indemnity_encashment_details/idemnity_encashment_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave/leave_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave_details/leave_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave_encashment/leave_encashment_bloc.dart';
import 'package:talent_link/src/presentation/blocs/leave_encashment_details/leave_encashment_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/loan_details/loan_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/loans/loans_bloc.dart';
import 'package:talent_link/src/presentation/blocs/login/login_bloc.dart';
import 'package:talent_link/src/presentation/blocs/main/main_cubit.dart';
import 'package:talent_link/src/presentation/blocs/more/more_bloc.dart';
import 'package:talent_link/src/presentation/blocs/my_request_filter/my_request_filter_bloc.dart';
import 'package:talent_link/src/presentation/blocs/my_requests/my_requests_bloc.dart';
import 'package:talent_link/src/presentation/blocs/my_team_attendance/my_team_attendance_bloc.dart';
import 'package:talent_link/src/presentation/blocs/my_team_attendance_filter/my_team_attendance_filter_bloc.dart';
import 'package:talent_link/src/presentation/blocs/my_team_requests/my_team_requests_bloc.dart';
import 'package:talent_link/src/presentation/blocs/my_team_requests_filter/my_team_requests_filter_bloc.dart';
import 'package:talent_link/src/presentation/blocs/notification/notifications_bloc.dart';
import 'package:talent_link/src/presentation/blocs/other_request/other_request_bloc.dart';
import 'package:talent_link/src/presentation/blocs/other_request_details/other_request_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_bloc.dart';
import 'package:talent_link/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:talent_link/src/presentation/blocs/request/request_bloc.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty/resume_duty_bloc.dart';
import 'package:talent_link/src/presentation/blocs/resume_duty_details/resume_duty_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/short_leave/short_leave_bloc.dart';
import 'package:talent_link/src/presentation/blocs/short_leave_details/short_leave_details_bloc.dart';
import 'package:talent_link/src/presentation/blocs/terms_conditions/terms_conditions_bloc.dart';
import 'package:talent_link/src/presentation/blocs/timeline/timeline_bloc.dart';
import 'package:talent_link/src/presentation/blocs/update_profile/update_profile_bloc.dart';
import 'data_layer_injector.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<RequestBloc>(() => RequestBloc(
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<LeaveBloc>(() => LeaveBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));
  injector.registerFactory<ShortLeaveBloc>(() => ShortLeaveBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));
  injector.registerFactory<LeaveEncashmentBloc>(() => LeaveEncashmentBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));
  injector.registerFactory<IndemnityEncashmentBloc>(() =>
      IndemnityEncashmentBloc(
          injector(),
          injector(),
          injector(),
          injector(),
          injector(),
          injector(),
          injector(),
          injector(),
          injector(),
          injector()));
  injector.registerFactory<LoansBloc>(() => LoansBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ResumeDutyBloc>(() => ResumeDutyBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));
  injector.registerFactory<HalfDayLeaveBloc>(() => HalfDayLeaveBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));

  injector
      .registerFactory<BusinessTripBloc>(() => BusinessTripBloc(injector()));
  injector.registerFactory<AirTicketBloc>(() => AirTicketBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<PayslipBloc>(
      () => PayslipBloc(injector(), injector(), injector()));
  injector.registerFactory<NotificationsBloc>(() => NotificationsBloc(
        injector(),
      ));
  injector.registerFactory<OtherRequestBloc>(() => OtherRequestBloc(
      injector(), injector(), injector(), injector(), injector(), injector()));
  injector.registerFactory<ProfileBloc>(() => ProfileBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<LoginBloc>(() => LoginBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));

  injector.registerFactory<ForgotPasswordBloc>(
      () => ForgotPasswordBloc(injector(), injector()));
  injector.registerFactory<HomeBloc>(() => HomeBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<AssetBloc>(() => AssetBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<AttendanceHistoryBloc>(
      () => AttendanceHistoryBloc(injector(), injector()));

  injector.registerFactory<MoreBloc>(() => MoreBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector()));
  injector.registerFactory<MyRequestsBloc>(() => MyRequestsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<MyRequestFilterBloc>(
      () => MyRequestFilterBloc(injector()));
  injector.registerFactory<MainCubit>(() => MainCubit(injector(), injector()));

  injector.registerFactory<UpdateProfileBloc>(
      () => UpdateProfileBloc(injector(), injector(), injector()));
  injector.registerFactory<ContactBloc>(() => ContactBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<AddressBloc>(() => AddressBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<MyTeamRequestsBloc>(
      () => MyTeamRequestsBloc(injector(), injector(), injector(), injector()));

  injector.registerFactory<MyTeamRequestsFilterBloc>(
      () => MyTeamRequestsFilterBloc(injector()));

  injector.registerFactory<MyTeamAttendanceBloc>(() => MyTeamAttendanceBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<MyTeamAttendanceFilterBloc>(
      () => MyTeamAttendanceFilterBloc(
            injector(),
          ));

  injector.registerFactory<AttachmentBloc>(() => AttachmentBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<TimelineBloc>(() => TimelineBloc(injector()));
  injector.registerFactory<HalfDayDetailsBloc>(
      () => HalfDayDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<IndemnityEncashmentDetailsBloc>(
      () => IndemnityEncashmentDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<ResumeDutyDetailsBloc>(
      () => ResumeDutyDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<LoanDetailsBloc>(
      () => LoanDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<LeaveDetailsBloc>(
      () => LeaveDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<OtherRequestDetailsBloc>(
      () => OtherRequestDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<AirTicketDetailsBloc>(
      () => AirTicketDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<LeaveEncashmentDetailsBloc>(
      () => LeaveEncashmentDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<ShortLeaveDetailsBloc>(
      () => ShortLeaveDetailsBloc(injector(), injector(), injector()));
  injector.registerFactory<EducationBloc>(() => EducationBloc(
      injector(), injector(), injector(), injector(), injector(), injector()));
  injector.registerFactory<TermsConditionsBloc>(
      () => TermsConditionsBloc(injector()));
  injector.registerFactory<AboutUsBloc>(() => AboutUsBloc(injector()));
  injector.registerFactory<EducationDetailsBloc>(() => EducationDetailsBloc(
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<AttachmentDetailsBloc>(() => AttachmentDetailsBloc(
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<AssetDetailsBloc>(() => AssetDetailsBloc(
      getAssetDetailsUseCase: injector(),
      approveRequestUseCase: injector(),
      rejectRequestUseCase: injector()));
  injector.registerFactory<AddressDetailsBloc>(() => AddressDetailsBloc(
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<ContactDetailsBloc>(() => ContactDetailsBloc(
    injector(),
    injector(),
    injector(),
  ));
}
