import 'package:talent_link/src/di/data_layer_injector.dart';
import 'package:talent_link/src/domain/usecase/address/address_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/address/insert_address_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/air_ticket_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/calculate_in_case_air_ticket_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/get_air_ticket_by_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/get_dependent_use_case.dart';
import 'package:talent_link/src/domain/usecase/air_ticket/insert_air_ticket_use_case.dart';
import 'package:talent_link/src/domain/usecase/all_fields_mandatory/get_all_fields_mandatory_use_case.dart';
import 'package:talent_link/src/domain/usecase/area/get_area_use_case.dart';
import 'package:talent_link/src/domain/usecase/asset/asset_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/asset/get_asset_type_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/asset/insert_asset_use_case.dart';
import 'package:talent_link/src/domain/usecase/attachment_details/get_attachment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/attachmnet/attachment_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/attachmnet/get_attachment_type_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/attachmnet/insert_attachment_use_case.dart';
import 'package:talent_link/src/domain/usecase/attendance_history/get_attendance_history_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/forgot_password/forgot_password_email_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/forgot_password/forgot_password_send_email_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/email_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_finger_print_number_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_number_of_digits_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_type_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/get_user_name_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/login_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/password_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_basic_salary_amount_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_finger_print_number_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_number_of_digits_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_subscriber_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_total_allowance_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_name_use_case.dart';
import 'package:talent_link/src/domain/usecase/authentication/login/save_user_type_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/business_trip/business_trip_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/contact/contact_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/contact/get_contact_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/contact/insert_contact_use_case.dart';
import 'package:talent_link/src/domain/usecase/countries/get_countries_and_cities_use_case.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_operating_system_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/get_device_serial_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_app_version_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_operating_system_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_serial_usecase.dart';
import 'package:talent_link/src/domain/usecase/device_information/save_device_type_usecase.dart';
import 'package:talent_link/src/domain/usecase/education/education_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/education/insert_education_use_case.dart';
import 'package:talent_link/src/domain/usecase/education_details/get_education_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/firebase_notification/get_firebase_notfication_token_usecase.dart';
import 'package:talent_link/src/domain/usecase/firebase_notification/save_firebase_notification_token_usecase.dart';
import 'package:talent_link/src/domain/usecase/get_subscribe_info/get_subscribe_info_use_case.dart';
import 'package:talent_link/src/domain/usecase/get_time_line/get_time_line_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/calculate_in_case_half_day_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/get_half_day_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/half_day_leave_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/half_day_leave/insert_half_day_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_check_in_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_check_out_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_currency_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_gross_salary_and_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_gross_salary_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_home_data_for_dashboard_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_last_requests_for_dashboard_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_news_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_policies_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/get_work_hours_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/insert_punch_from_dashboard_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/navigate_to_quick_access_requests_screen_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_check_in_day_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_check_in_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_check_out_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_currency_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_currency_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_gross_salary_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_reset_time_use_case.dart';
import 'package:talent_link/src/domain/usecase/home/save_work_hours_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/calculate_in_case_indemnity_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/get_indemnity_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/indemnity_encashment_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/indemnity_encashment/insert_indemnity_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/calculate_in_case_new_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/get_alternative_employee_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/get_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/insert_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave/leave_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/calculate_in_case_leave_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/get_employee_policy_profile_leave_encashment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/get_leave_encashment_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/insert_leave_encashment_use_case.dart';
import 'package:talent_link/src/domain/usecase/leave_encashment/leave_encashmen_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/calculate_in_case_loan_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/get_loan_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/insert_loan_use_case.dart';
import 'package:talent_link/src/domain/usecase/loans/loans_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_notification_status_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/get_user_type_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/remove_checkin_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/remove_checkout_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/remove_day_reset_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/save_language_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/save_notification_status_use_case.dart';
import 'package:talent_link/src/domain/usecase/more/update_notification_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/cancel_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_address_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_air_ticket_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_all_requests_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_asset_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_business_trip_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_contact_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_employee_requests_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_half_day_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_indemnity_encashment_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_leave_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_leave_encashment_details.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_loan_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_other_request_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_resume_duty_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_short_leave_details_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/get_transaction_status_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_requests/my_requests_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_attendance_history/get_my_team_attendance_history_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_attendance_history/get_my_team_attendance_statistics_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_attendance_history/my_team_attendance_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/approve_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/my_team_request_filter_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/my_team_request/reject_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/notifications/get_notifications_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/get_other_request_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/insert_other_request_use_case.dart';
import 'package:talent_link/src/domain/usecase/other_request/other_request_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/payment_method/get_payment_method_use_case.dart';
import 'package:talent_link/src/domain/usecase/payslip/get_employee_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/payslip/payslip_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/get_company_id_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/get_employee_Id_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/get_employee_profile_use_case.dart';
import 'package:talent_link/src/domain/usecase/profile/profile_insert_attachment_use_case.dart';
import 'package:talent_link/src/domain/usecase/qualification/qualification_use_case.dart';
import 'package:talent_link/src/domain/usecase/request/navigate_to_requests_details_screen_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_ess_permission_use_case.dart';
import 'package:talent_link/src/domain/usecase/requests/get_requests_list_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/calculate_in_case_resume_duty_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_data_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/get_resume_duty_reference_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/insert_resume_duty_use_case.dart';
import 'package:talent_link/src/domain/usecase/resume_duty/resume_duty_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/calculate_in_case_short_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/get_short_leave_types_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/insert_short_leave_use_case.dart';
import 'package:talent_link/src/domain/usecase/short_leave/short_leave_validation_use_case.dart';
import 'package:talent_link/src/domain/usecase/update_profile/navigate_to_update_profile_details_screens_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<NavigateToRequestsDetailsScreenUseCase>(
      () => NavigateToRequestsDetailsScreenUseCase());
  injector
      .registerFactory<LeaveValidationUseCase>(() => LeaveValidationUseCase());
  injector.registerFactory<ShortLeaveValidationUseCase>(
      () => ShortLeaveValidationUseCase());
  injector.registerFactory<LeaveEncashmentValidationUseCase>(
      () => LeaveEncashmentValidationUseCase());
  injector.registerFactory<IndemnityEncashmentValidationUseCase>(
      () => IndemnityEncashmentValidationUseCase());
  injector
      .registerFactory<LoansValidationUseCase>(() => LoansValidationUseCase());
  injector.registerFactory<HalfDayLeaveValidationUseCase>(
      () => HalfDayLeaveValidationUseCase());
  injector.registerFactory<ResumeDutyValidationUseCase>(
      () => ResumeDutyValidationUseCase());
  injector.registerFactory<BusinessTripValidationUseCase>(
      () => BusinessTripValidationUseCase());
  injector.registerFactory<AirTicketValidationUseCase>(
      () => AirTicketValidationUseCase());
  injector.registerFactory<OtherRequestValidationUseCase>(
      () => OtherRequestValidationUseCase());
  injector.registerFactory<GetDeviceOperatingSystemUseCase>(
      () => GetDeviceOperatingSystemUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetDeviceSerialUseCase>(
      () => GetDeviceSerialUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetFirebaseNotificationTokenUseCase>(
      () => GetFirebaseNotificationTokenUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveAppVersionUseCase>(
      () => SaveAppVersionUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveDeviceOperatingSystemUseCase>(
      () => SaveDeviceOperatingSystemUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveDeviceSerialUseCase>(
      () => SaveDeviceSerialUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveDeviceTypeUseCase>(
      () => SaveDeviceTypeUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveFirebaseNotificationTokenUseCase>(() =>
      SaveFirebaseNotificationTokenUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetLeaveTypesUseCase>(
      () => GetLeaveTypesUseCase(injector()));
  injector.registerFactory<InsertLeaveUseCase>(
      () => InsertLeaveUseCase(injector()));
  injector.registerFactory<GetLeaveEncashmentTypesUseCase>(
      () => GetLeaveEncashmentTypesUseCase(injector()));
  injector.registerFactory<GetShortLeaveTypesUseCase>(
      () => GetShortLeaveTypesUseCase(injector()));
  injector.registerFactory<GetPaymentMethodUseCase>(
      () => GetPaymentMethodUseCase(injector()));
  injector.registerFactory<GetLoanTypesUseCase>(
      () => GetLoanTypesUseCase(injector()));
  injector.registerFactory<GetHalfDayTypesUseCase>(
      () => GetHalfDayTypesUseCase(injector()));
  injector.registerFactory<GetResumeDutyReferenceTypesUseCase>(
      () => GetResumeDutyReferenceTypesUseCase(injector()));
  injector.registerFactory<GetOtherRequestTypesUseCase>(
      () => GetOtherRequestTypesUseCase(injector()));
  injector.registerFactory<GetAlternativeEmployeeUseCase>(
      () => GetAlternativeEmployeeUseCase(injector()));
  injector.registerFactory<GetResumeDutyReferenceDataUseCase>(
      () => GetResumeDutyReferenceDataUseCase(injector()));
  injector.registerFactory<InsertLeaveEncashmentUseCase>(
      () => InsertLeaveEncashmentUseCase(injector()));
  injector
      .registerFactory<InsertLoanUseCase>(() => InsertLoanUseCase(injector()));
  injector.registerFactory<GetAllFieldsMandatoryUseCase>(
      () => GetAllFieldsMandatoryUseCase(injector()));
  injector.registerFactory<PayslipUseCase>(() => PayslipUseCase(injector()));
  injector.registerFactory<GetEmployeeIdUseCase>(
      () => GetEmployeeIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<CalculateInCaseLoanUseCase>(
      () => CalculateInCaseLoanUseCase(injector()));
  injector.registerFactory<
          GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase>(
      () => GetEmployeePolicyProfileLeaveEncashmentDetailsUseCase(injector()));
  injector.registerFactory<GetEssPermissionUseCase>(
      () => GetEssPermissionUseCase(injector()));
  injector.registerFactory<CalculateInCaseNewLeaveUseCase>(
      () => CalculateInCaseNewLeaveUseCase(injector()));
  injector.registerFactory<CalculateInCaseShortLeaveUseCase>(
      () => CalculateInCaseShortLeaveUseCase(injector()));
  injector.registerFactory<CalculateInCaseLeaveEncashmentUseCase>(
      () => CalculateInCaseLeaveEncashmentUseCase(injector()));
  injector.registerFactory<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(injector()));
  injector.registerFactory<InsertAirTicketUseCase>(
      () => InsertAirTicketUseCase(injector()));
  injector.registerFactory<InsertOtherRequestUseCase>(
      () => InsertOtherRequestUseCase(injector()));
  injector.registerFactory<InsertHalfDayLeaveUseCase>(
      () => InsertHalfDayLeaveUseCase(injector()));
  injector.registerFactory<InsertIndemnityEncashmentUseCase>(
      () => InsertIndemnityEncashmentUseCase(injector()));
  injector.registerFactory<InsertShortLeaveUseCase>(
      () => InsertShortLeaveUseCase(injector()));
  injector.registerFactory<LoginUseCase>(() => LoginUseCase(injector()));
  injector
      .registerFactory<EmailValidationUseCase>(() => EmailValidationUseCase());
  injector.registerFactory<PasswordValidationUseCase>(
      () => PasswordValidationUseCase());
  injector.registerFactory<SaveUserIdUseCase>(
      () => SaveUserIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveCompanyIdUseCase>(
      () => SaveCompanyIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveSubscriberIdUseCase>(
      () => SaveSubscriberIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveUserNameUseCase>(
      () => SaveUserNameUseCase(sharedPreferences: injector()));
  injector.registerFactory<ForgotPasswordEmailValidationUseCase>(
      () => ForgotPasswordEmailValidationUseCase());
  injector.registerFactory<ForgotPasswordSendEmailUseCase>(
      () => ForgotPasswordSendEmailUseCase(injector()));
  injector.registerFactory<GetNewsListUseCase>(
      () => GetNewsListUseCase(injector()));
  injector.registerFactory<GetPoliciesUseCase>(
      () => GetPoliciesUseCase(injector()));
  injector.registerFactory<SaveFingerPrintNumberUseCase>(
      () => SaveFingerPrintNumberUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetFingerPrintNumberUseCase>(
      () => GetFingerPrintNumberUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveEmployeeIdUseCase>(
      () => SaveEmployeeIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetUserNameUseCase>(
      () => GetUserNameUseCase(sharedPreferences: injector()));
  injector.registerFactory<InsertPunchFromDashboardUseCase>(
      () => InsertPunchFromDashboardUseCase(injector()));
  injector.registerFactory<SaveWorkHoursUseCase>(
      () => SaveWorkHoursUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetWorkHoursUseCase>(
      () => GetWorkHoursUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveCheckInUseCase>(
      () => SaveCheckInUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetCheckInUseCase>(
      () => GetCheckInUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveCheckOutUseCase>(
      () => SaveCheckOutUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetCheckOutUseCase>(
      () => GetCheckOutUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveResetTimeUseCase>(
      () => SaveResetTimeUseCase(sharedPreferences: injector()));
  injector.registerFactory<UpdateNotificationUseCase>(
      () => UpdateNotificationUseCase(injector()));
  injector.registerFactory<GetSubscribeInfoUseCase>(
      () => GetSubscribeInfoUseCase(injector()));
  injector.registerFactory<GetAttendanceHistoryUseCase>(
      () => GetAttendanceHistoryUseCase(injector()));
  injector.registerFactory<GetMyTeamAttendanceHistoryUseCase>(
      () => GetMyTeamAttendanceHistoryUseCase(injector()));
  injector.registerFactory<GetMyTeamAttendanceStatisticsUseCase>(
      () => GetMyTeamAttendanceStatisticsUseCase(injector()));
  injector.registerFactory<GetTimeLineUseCase>(
      () => GetTimeLineUseCase(injector()));
  injector.registerFactory<SaveCheckInDayUseCase>(
      () => SaveCheckInDayUseCase(injector()));
  injector.registerFactory<GetNotificationStatusUseCase>(
      () => GetNotificationStatusUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetLanguageUseCase>(
      () => GetLanguageUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveLanguageUseCase>(
      () => SaveLanguageUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveNotificationStatusUseCase>(
      () => SaveNotificationStatusUseCase(sharedPreferences: injector()));
  injector.registerFactory<SaveUserTypeIdUseCase>(
      () => SaveUserTypeIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetUserTypeIdUseCase>(
      () => GetUserTypeIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<QualificationUseCase>(
      () => QualificationUseCase(injector()));
  injector
      .registerFactory<GetRequestsListUseCase>(() => GetRequestsListUseCase());
  injector.registerFactory<NavigateToUpdateProfileDetailsScreensUseCase>(
      () => NavigateToUpdateProfileDetailsScreensUseCase());
  injector
      .registerFactory<AssetValidationUseCase>(() => AssetValidationUseCase());
  injector.registerFactory<GetAssetTypeListUseCase>(
      () => GetAssetTypeListUseCase(injector()));
  injector.registerFactory<ContactValidationUseCase>(
      () => ContactValidationUseCase());
  injector.registerFactory<GetContactTypesUseCase>(
      () => GetContactTypesUseCase(injector()));
  injector.registerFactory<AddressValidationUseCase>(
      () => AddressValidationUseCase());
  injector.registerFactory<GetAreaUseCase>(() => GetAreaUseCase(injector()));
  injector.registerFactory<MyRequestsValidationUseCase>(
      () => MyRequestsValidationUseCase());
  injector.registerFactory<InsertResumeDutyUseCase>(
      () => InsertResumeDutyUseCase(injector()));
  injector.registerFactory<GetMyTeamRequestUseCase>(
      () => GetMyTeamRequestUseCase(injector()));
  injector.registerFactory<GetCompaniesAndEmployeesListUseCase>(
      () => GetCompaniesAndEmployeesListUseCase(injector()));
  injector.registerFactory<GetAirTicketDetailsUseCase>(
      () => GetAirTicketDetailsUseCase(injector()));
  injector.registerFactory<GetBusinessTripDetailsUseCase>(
      () => GetBusinessTripDetailsUseCase(injector()));
  injector.registerFactory<GetIndemnityEncashmentDetailsUseCase>(
      () => GetIndemnityEncashmentDetailsUseCase(injector()));
  injector.registerFactory<GetOtherRequestDetailsUseCase>(
      () => GetOtherRequestDetailsUseCase(injector()));
  injector.registerFactory<GetResumeDutyDetailsUseCase>(
      () => GetResumeDutyDetailsUseCase(injector()));
  injector.registerFactory<GetEmployeeRequestsUseCase>(
      () => GetEmployeeRequestsUseCase(injector()));
  injector.registerFactory<GetLeaveDetailsUseCase>(
      () => GetLeaveDetailsUseCase(injector()));
  injector.registerFactory<GetLeaveEncashmentDetailsUseCase>(
      () => GetLeaveEncashmentDetailsUseCase(injector()));
  injector.registerFactory<GetLoanDetailsUseCase>(
      () => GetLoanDetailsUseCase(injector()));
  injector.registerFactory<GetShortLevelDetailsUseCase>(
      () => GetShortLevelDetailsUseCase(injector()));
  injector.registerFactory<GetCompanyIdUseCase>(
      () => GetCompanyIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetProfileEmployeeIdUseCase>(
      () => GetProfileEmployeeIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetEmployeeProfileUseCase>(
      () => GetEmployeeProfileUseCase(injector()));
  injector.registerFactory<GetPayslipEmployeeIdUseCase>(
      () => GetPayslipEmployeeIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<CancelRequestUseCase>(
      () => CancelRequestUseCase(injector()));
  injector.registerFactory<MyTeamRequestsValidationUseCase>(
      () => MyTeamRequestsValidationUseCase());
  injector.registerFactory<GetAllRequestsListUseCase>(
      () => GetAllRequestsListUseCase(injector()));
  injector.registerFactory<GetTransactionStatusUseCase>(
      () => GetTransactionStatusUseCase(injector()));
  injector.registerFactory<MyTeamAttendanceValidationUseCase>(
      () => MyTeamAttendanceValidationUseCase());
  injector.registerFactory<AttachmentValidationUseCase>(
      () => AttachmentValidationUseCase());
  injector.registerFactory<EducationValidationUseCase>(
      () => EducationValidationUseCase());
  injector.registerFactory<GetCountriesAndCitiesTypesUseCase>(
      () => GetCountriesAndCitiesTypesUseCase(injector()));
  injector.registerFactory<InsertEducationUseCase>(
      () => InsertEducationUseCase(injector()));
  injector.registerFactory<InsertAddressUseCase>(
      () => InsertAddressUseCase(injector()));
  injector.registerFactory<InsertAssetUseCase>(
      () => InsertAssetUseCase(injector()));
  injector.registerFactory<InsertContactUseCase>(
      () => InsertContactUseCase(injector()));
  injector.registerFactory<GetAttachmentTypeListUseCase>(
      () => GetAttachmentTypeListUseCase(injector()));
  injector.registerFactory<InsertAttachmentUseCase>(
      () => InsertAttachmentUseCase(injector()));
  injector.registerFactory<CalculateInCaseHalfDayUseCase>(
      () => CalculateInCaseHalfDayUseCase(injector()));
  injector.registerFactory<CalculateInCaseResumeDutyUseCase>(
      () => CalculateInCaseResumeDutyUseCase(injector()));
  injector.registerFactory<GetProfileCompanyIdUseCase>(
      () => GetProfileCompanyIdUseCase(sharedPreferences: injector()));
  injector.registerFactory<ProfileInsertAttachmentUseCase>(
      () => ProfileInsertAttachmentUseCase(injector()));
  injector.registerFactory<SaveNumberOfDigitsUseCase>(
      () => SaveNumberOfDigitsUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetNumberOfDigitsUseCase>(
      () => GetNumberOfDigitsUseCase(sharedPreferences: injector()));
  injector.registerFactory<GetIndemnityEmployeeUseCase>(
      () => GetIndemnityEmployeeUseCase(injector()));
  injector.registerFactory<CalculateInCaseIndemnityEncashmentUseCase>(
      () => CalculateInCaseIndemnityEncashmentUseCase(injector()));
  injector.registerFactory<GetDependentUseCase>(
      () => GetDependentUseCase(injector()));

  injector
      .registerFactory<GetTypeIdUseCase>(() => GetTypeIdUseCase(injector()));
  injector.registerFactory<GetAirTicketByEmployeeUseCase>(
      () => GetAirTicketByEmployeeUseCase(injector()));
  injector.registerFactory<CalculateInCaseAirTicketUseCase>(
      () => CalculateInCaseAirTicketUseCase(injector()));
  injector.registerFactory<ApproveRequestUseCase>(
      () => ApproveRequestUseCase(injector()));

  injector.registerFactory<RejectRequestUseCase>(
      () => RejectRequestUseCase(injector()));

  injector.registerFactory<GetHalfDayDetailsUseCase>(
      () => GetHalfDayDetailsUseCase(injector()));

  injector.registerFactory<GetBasicSalaryAmountUseCase>(
      () => GetBasicSalaryAmountUseCase(injector()));

  injector.registerFactory<GetTotalAllowanceUseCase>(
      () => GetTotalAllowanceUseCase(injector()));

  injector.registerFactory<SaveBasicSalaryAmountUseCase>(
      () => SaveBasicSalaryAmountUseCase(sharedPreferences: injector()));

  injector.registerFactory<SaveTotalAllowanceUseCase>(
      () => SaveTotalAllowanceUseCase(sharedPreferences: injector()));
  injector.registerFactory<RemoveResetDayUseCase>(
      () => RemoveResetDayUseCase(injector()));

  injector.registerFactory<RemoveCheckInUseCase>(
      () => RemoveCheckInUseCase(injector()));

  injector.registerFactory<RemoveCheckOutUseCase>(
      () => RemoveCheckOutUseCase(injector()));

  injector.registerFactory<NavigateToQuickAccessRequestsScreenUseCase>(
      () => NavigateToQuickAccessRequestsScreenUseCase());

  injector.registerFactory<GetLastRequestsForDashboardUseCase>(
      () => GetLastRequestsForDashboardUseCase(injector()));

  injector.registerFactory<GetHomeDataForDashboardUseCase>(
      () => GetHomeDataForDashboardUseCase(injector()));

  injector.registerFactory<GetGrossSalaryAndCurrencyUseCase>(
      () => GetGrossSalaryAndCurrencyUseCase(injector()));

  injector.registerFactory<SaveCurrencyIdUseCase>(
      () => SaveCurrencyIdUseCase(sharedPreferences: injector()));

  injector.registerFactory<SaveCurrencyUseCase>(
      () => SaveCurrencyUseCase(sharedPreferences: injector()));

  injector.registerFactory<SaveGrossSalaryUseCase>(
      () => SaveGrossSalaryUseCase(sharedPreferences: injector()));

  injector.registerFactory<GetCurrencyIdUseCase>(
      () => GetCurrencyIdUseCase(sharedPreferences: injector()));

  injector.registerFactory<GetCurrencyUseCase>(
      () => GetCurrencyUseCase(sharedPreferences: injector()));

  injector.registerFactory<GetGrossSalaryUseCase>(
      () => GetGrossSalaryUseCase(sharedPreferences: injector()));

  injector.registerFactory<GetEducationDetailsUseCase>(
      () => GetEducationDetailsUseCase(injector()));

  injector.registerFactory<GetAttachmentDetailsUseCase>(
      () => GetAttachmentDetailsUseCase(injector()));
  injector.registerFactory<GetAssetDetailsUseCase>(
      () => GetAssetDetailsUseCase(injector()));

  injector.registerFactory<GetContactDetailsUseCase>(
      () => GetContactDetailsUseCase(injector()));

  injector.registerFactory<GetAddressDetailsUseCase>(
      () => GetAddressDetailsUseCase(injector()));
}
