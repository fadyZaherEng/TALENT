import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/searchbale/searchbale_model.dart';
import 'package:talent_link/src/domain/entities/timeline/timeline.dart';
import 'package:talent_link/src/presentation/screens/about_us/about_us_screen.dart';
import 'package:talent_link/src/presentation/screens/address/address_screen.dart';
import 'package:talent_link/src/presentation/screens/address_details/address_details_screen.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/air_ticket_screen.dart';
import 'package:talent_link/src/presentation/screens/air_ticket_details/air_ticket_details_screen.dart';
import 'package:talent_link/src/presentation/screens/asset/asset_screen.dart';
import 'package:talent_link/src/presentation/screens/asset_details/asset_details_screen.dart';
import 'package:talent_link/src/presentation/screens/attachment/attachment_screen.dart';
import 'package:talent_link/src/presentation/screens/attachment_details/attachment_details_screen.dart';
import 'package:talent_link/src/presentation/screens/attendance_history/attendance_history_screen.dart';
import 'package:talent_link/src/presentation/screens/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:talent_link/src/presentation/screens/business_trip/business_trip_screen.dart';
import 'package:talent_link/src/presentation/screens/confirmation_email/confirmation_email_screen.dart';
import 'package:talent_link/src/presentation/screens/contact/contact_screen.dart';
import 'package:talent_link/src/presentation/screens/contact_details/contact_details_screen.dart';
import 'package:talent_link/src/presentation/screens/education/education_screen.dart';
import 'package:talent_link/src/presentation/screens/education_details/education_details_screen.dart';
import 'package:talent_link/src/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:talent_link/src/presentation/screens/half_day_details/half_day_details_screen.dart';
import 'package:talent_link/src/presentation/screens/half_day_leave/half_day_leave_screen.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment/indemnity_encashment_screen.dart';
import 'package:talent_link/src/presentation/screens/indemnity_encashment_details/indemnity_encashment_details_screen.dart';
import 'package:talent_link/src/presentation/screens/leave/leave_screen.dart';
import 'package:talent_link/src/presentation/screens/leave_details/leave_details_screen.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment/leave_encashment_screen.dart';
import 'package:talent_link/src/presentation/screens/leave_encashment_details/leave_encashment_details_screen.dart';
import 'package:talent_link/src/presentation/screens/loan_details/loan_details_screen.dart';
import 'package:talent_link/src/presentation/screens/loans_screen/loans_screen.dart';
import 'package:talent_link/src/presentation/screens/login/login_screen.dart';
import 'package:talent_link/src/presentation/screens/more/more_screen.dart';
import 'package:talent_link/src/presentation/screens/my_requests/my_requests_screen.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/my_team_attendance_screen.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/my_team_requests_screen.dart';
import 'package:talent_link/src/presentation/screens/notifications/notifications_screen.dart';
import 'package:talent_link/src/presentation/screens/other_request/other_request_screen.dart';
import 'package:talent_link/src/presentation/screens/other_request_details/other_request_details_screen.dart';
import 'package:talent_link/src/presentation/screens/request_details_short_leave/short_leave_details_screen.dart';
import 'package:talent_link/src/presentation/screens/resume_duty/resume_duty_screen.dart';
import 'package:talent_link/src/presentation/screens/resume_duty_details/resume_duty_details_screen.dart';
import 'package:talent_link/src/presentation/screens/searchbale/searchbale_screen.dart';
import 'package:talent_link/src/presentation/screens/short_leave/short_leave_screen.dart';
import 'package:talent_link/src/presentation/screens/splash/splash_screen.dart';
import 'package:talent_link/src/presentation/screens/terms_conditions/terms_conditions_screen.dart';
import 'package:talent_link/src/presentation/screens/timeline/timeline_screen.dart';
import 'package:talent_link/src/presentation/screens/update_profile/update_profile_screen.dart';

class Routes {
  static const String main = "/main";
  static const String leave = "/leave";
  static const String shortLeave = "/shortLeave";
  static const String leaveEncashment = "/leaveEncashment";
  static const String indemnityEncashment = "/indemnityEncashment";
  static const String loans = "/loans";
  static const String resumeDuty = "/resumeDuty";
  static const String halfDayLeave = "/halfDayLeave";
  static const String businessTrip = "/businessTrip";
  static const String airTicket = "/airTicket";
  static const String otherRequest = "/otherRequest";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String notifications = "/notificationsBloc";
  static const String forgetPassword = "/forgetPassword";
  static const String confirmationEmail = "/confirmationEmail";
  static const String notification = "/notification";
  static const String asset = "/asset";
  static const String attendanceHistory = "/attendanceHistory";
  static const String more = "/more";
  static const String myRequests = "/myRequests";
  static const String updateProfile = "/updateProfile";
  static const String contact = "/contact";
  static const String address = "/address";
  static const String myTeamAttendance = "/myTeamAttendance";
  static const String myTeamRequests = "/myTeamRequests";
  static const String searchable = "/searchable";
  static const String attachment = "/attachment";
  static const String education = "/education";
  static const String timeline = "/timeline";
  static const String shortLeaveDetails = "/shortLeaveDetails";
  static const String otherRequestDetails = "/otherRequestDetails";
  static const String airTicketDetails = "/airTicketDetails";
  static const String leaveEncashmentDetails = "/leaveEncashmentDetails";
  static const String leaveDetails = "/leaveDetails";
  static const String loanDetails = "/loanDetails";
  static const String resumeDutyDetails = "/resumeDutyDetails";
  static const String indemnityEncashmentDetails =
      "/indemnityEncashmentDetails";
  static const String halfDayLeaveDetails = "/halfDayLeaveDetails";
  static const String termsConditions = "/termsConditions";
  static const String aboutUs = "/aboutUs";
  static const String educationDetails = "/educationDetails";
  static const String attachmentDetails = "/attachmentDetails";
  static const String assetDetails = "/assetDetails";
  static const String addressDetails = "/addressDetails";
  static const String contactDetails = "/contactDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.main:
        return _materialRoute(
            BottomNavigationBarScreen(index: routeSettings.arguments as int));
      case Routes.leave:
        return _materialRoute(const LeaveScreen());
      case Routes.shortLeave:
        return _materialRoute(const ShortLeaveScreen());
      case Routes.leaveEncashment:
        return _materialRoute(const LeaveEncashmentScreen());
      case Routes.indemnityEncashment:
        return _materialRoute(const IndemnityEncashmentScreen());
      case Routes.loans:
        return _materialRoute(const LoansScreen());
      case Routes.resumeDuty:
        return _materialRoute(const ResumeDutyScreen());
      case Routes.halfDayLeave:
        return _materialRoute(const HalfDayLeaveScreen());
      case Routes.businessTrip:
        return _materialRoute(const BusinessTripScreen());
      case Routes.airTicket:
        return _materialRoute(const AirTicketScreen());
      case Routes.otherRequest:
        return _materialRoute(const OtherRequestScreen());
      case Routes.splash:
        return _materialRoute(const SplashScreen());
      case Routes.notifications:
        return _materialRoute(const NotificationsScreen());
      case Routes.login:
        return _materialRoute(const LoginScreen());
      case Routes.forgetPassword:
        return _materialRoute(const ForgotPasswordScreen());
      case Routes.confirmationEmail:
        return _materialRoute(const ConfirmationEmailScreen());
      case Routes.notification:
        return _materialRoute(const NotificationsScreen());
      case Routes.asset:
        return _materialRoute(const AssetScreen());
      case Routes.attendanceHistory:
        return _materialRoute(const AttendanceHistoryScreen());
      case Routes.more:
        return _materialRoute(const MoreScreen());
      case Routes.myRequests:
        return _materialRoute(const MyRequestsScreen());
      case Routes.updateProfile:
        return _materialRoute(const UpdateProfileScreen());
      case Routes.contact:
        return _materialRoute(const ContactScreen());
      case Routes.address:
        return _materialRoute(const AddressScreen());
      case Routes.myTeamAttendance:
        return _materialRoute(const MyTeamAttendanceScreen());

      case Routes.myTeamRequests:
        return _materialRoute(const MyTeamRequestsScreen());
      case Routes.searchable:
        SearchableModel searchableItemModel =
            routeSettings.arguments as SearchableModel;
        return _materialRoute(
            SearchableScreen(searchableItemModel: searchableItemModel));
      case Routes.attachment:
        return _materialRoute(const AttachmentScreen());
      case Routes.education:
        return _materialRoute(const EducationScreen());
      case Routes.timeline:
        return _materialRoute(
            TimelineScreen(timeline: routeSettings.arguments as Timeline));

      case Routes.shortLeaveDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(ShortLeaveDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));

      case Routes.airTicketDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(AirTicketDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.leaveEncashmentDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(LeaveEncashmentDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.otherRequestDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(OtherRequestDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.leaveDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(LeaveDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.loanDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(LoanDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.resumeDutyDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(ResumeDutyDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.indemnityEncashmentDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(IndemnityEncashmentDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.halfDayLeaveDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(HalfDayDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.assetDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(AssetDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.termsConditions:
        return _materialRoute(const TermsConditionsScreen());
      case Routes.aboutUs:
        return _materialRoute(const AboutUsScreen());
      case Routes.educationDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(EducationDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.attachmentDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(AttachmentDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.addressDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(AddressDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));
      case Routes.contactDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(ContactDetailsScreen(
          transactionId: arg["transactionId"],
          isFromMyRequest: arg['isFromMyRequest'],
          referenceId: arg['referenceId'],
        ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: const Center(
          child: Text("Not found"),
        ),
      ),
    );
  }
}
