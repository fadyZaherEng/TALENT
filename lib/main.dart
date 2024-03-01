import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/config/theme/app_theme.dart';
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
import 'src/di/injector.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RequestBloc>(create: (context) => injector()),
          BlocProvider<LeaveBloc>(create: (context) => injector()),
          BlocProvider<ShortLeaveBloc>(create: (context) => injector()),
          BlocProvider<LeaveEncashmentBloc>(create: (context) => injector()),
          BlocProvider<IndemnityEncashmentBloc>(
              create: (context) => injector()),
          BlocProvider<LoansBloc>(create: (context) => injector()),
          BlocProvider<ResumeDutyBloc>(create: (context) => injector()),
          BlocProvider<HalfDayLeaveBloc>(create: (context) => injector()),
          BlocProvider<BusinessTripBloc>(create: (context) => injector()),
          BlocProvider<AirTicketBloc>(create: (context) => injector()),
          BlocProvider<OtherRequestBloc>(create: (context) => injector()),
          BlocProvider<ProfileBloc>(create: (context) => injector()),
          BlocProvider<PayslipBloc>(create: (context) => injector()),
          BlocProvider<NotificationsBloc>(create: (context) => injector()),
          BlocProvider<LoginBloc>(create: (context) => injector()),
          BlocProvider<ForgotPasswordBloc>(create: (context) => injector()),
          BlocProvider<HomeBloc>(create: (context) => injector()),
          BlocProvider<AssetBloc>(create: (context) => injector()),
          BlocProvider<AttendanceHistoryBloc>(create: (context) => injector()),
          BlocProvider<MoreBloc>(create: (context) => injector()),
          BlocProvider<MyRequestsBloc>(create: (context) => injector()),
          BlocProvider<MyRequestFilterBloc>(create: (context) => injector()),
          BlocProvider<MainCubit>(create: (context) => injector()),
          BlocProvider<UpdateProfileBloc>(create: (context) => injector()),
          BlocProvider<ContactBloc>(create: (context) => injector()),
          BlocProvider<AddressBloc>(create: (context) => injector()),
          BlocProvider<MyTeamAttendanceBloc>(create: (context) => injector()),
          BlocProvider<MyTeamRequestsBloc>(create: (context) => injector()),
          BlocProvider<MyTeamRequestsFilterBloc>(
              create: (context) => injector()),
          BlocProvider<MyTeamAttendanceFilterBloc>(
              create: (context) => injector()),
          BlocProvider<MyTeamAttendanceFilterBloc>(
              create: (context) => injector()),
          BlocProvider<AttachmentBloc>(create: (context) => injector()),
          BlocProvider<EducationBloc>(create: (context) => injector()),
          BlocProvider<TimelineBloc>(create: (context) => injector()),
          BlocProvider<OtherRequestDetailsBloc>(
              create: (context) => injector()),
          BlocProvider<AirTicketDetailsBloc>(create: (context) => injector()),
          BlocProvider<LeaveEncashmentDetailsBloc>(
              create: (context) => injector()),
          BlocProvider<ShortLeaveDetailsBloc>(create: (context) => injector()),
          BlocProvider<LoanDetailsBloc>(create: (context) => injector()),
          BlocProvider<ResumeDutyDetailsBloc>(create: (context) => injector()),
          BlocProvider<LeaveDetailsBloc>(create: (context) => injector()),
          BlocProvider<IndemnityEncashmentDetailsBloc>(
              create: (context) => injector()),
          BlocProvider<HalfDayDetailsBloc>(create: (context) => injector()),
          BlocProvider<TermsConditionsBloc>(create: (context) => injector()),
          BlocProvider<AboutUsBloc>(create: (context) => injector()),
          BlocProvider<EducationDetailsBloc>(create: (context) => injector()),
          BlocProvider<AttachmentDetailsBloc>(create: (context) => injector()),
          BlocProvider<AssetDetailsBloc>(create: (context) => injector()),
          BlocProvider<ContactDetailsBloc>(create: (context) => injector()),
          BlocProvider<AddressDetailsBloc>(create: (context) => injector()),
        ],
        child: BlocBuilder<MainCubit, Locale>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              title: 'TalentLink HR',
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.splash,
              theme: AppTheme(state.languageCode).light,
              locale: state,
            );
          },
        ));
  }
}
