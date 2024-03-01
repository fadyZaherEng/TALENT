// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get choseFile {
    return Intl.message(
      'Choose File',
      name: 'choseFile',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Payslip`
  String get payslip {
    return Intl.message(
      'Payslip',
      name: 'payslip',
      desc: '',
      args: [],
    );
  }

  /// `Short Leave Type Name`
  String get shortLeaveTypeName {
    return Intl.message(
      'Short Leave Type Name',
      name: 'shortLeaveTypeName',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get leave {
    return Intl.message(
      'Leave',
      name: 'leave',
      desc: '',
      args: [],
    );
  }

  /// `Select...`
  String get select {
    return Intl.message(
      'Select...',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payroll`
  String get payroll {
    return Intl.message(
      'Payroll',
      name: 'payroll',
      desc: '',
      args: [],
    );
  }

  /// `Settlement`
  String get settlement {
    return Intl.message(
      'Settlement',
      name: 'settlement',
      desc: '',
      args: [],
    );
  }

  /// `Contact No`
  String get contactNo {
    return Intl.message(
      'Contact No',
      name: 'contactNo',
      desc: '',
      args: [],
    );
  }

  /// `Expected Resuming Date`
  String get expectedResumingDate {
    return Intl.message(
      'Expected Resuming Date',
      name: 'expectedResumingDate',
      desc: '',
      args: [],
    );
  }

  /// `Address During Leave`
  String get addressDuringLeave {
    return Intl.message(
      'Address During Leave',
      name: 'addressDuringLeave',
      desc: '',
      args: [],
    );
  }

  /// `Alternative Employee`
  String get alternativeEmployee {
    return Intl.message(
      'Alternative Employee',
      name: 'alternativeEmployee',
      desc: '',
      args: [],
    );
  }

  /// `By Current Balance`
  String get byCurrentBalance {
    return Intl.message(
      'By Current Balance',
      name: 'byCurrentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance`
  String get currentBalance {
    return Intl.message(
      'Current Balance',
      name: 'currentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Yearly Balance`
  String get yearlyBalance {
    return Intl.message(
      'Yearly Balance',
      name: 'yearlyBalance',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Balance`
  String get remainingBalance {
    return Intl.message(
      'Remaining Balance',
      name: 'remainingBalance',
      desc: '',
      args: [],
    );
  }

  /// `Leave Days`
  String get leaveDays {
    return Intl.message(
      'Leave Days',
      name: 'leaveDays',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Leave Reasons`
  String get leaveReasons {
    return Intl.message(
      'Leave Reasons',
      name: 'leaveReasons',
      desc: '',
      args: [],
    );
  }

  /// `Remarks`
  String get remarks {
    return Intl.message(
      'Remarks',
      name: 'remarks',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `You should have camera permission`
  String get youShouldHaveCameraPermission {
    return Intl.message(
      'You should have camera permission',
      name: 'youShouldHaveCameraPermission',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this file?`
  String get areYouSureYouWantToDeleteThisFile {
    return Intl.message(
      'Are you sure you want to delete this file?',
      name: 'areYouSureYouWantToDeleteThisFile',
      desc: '',
      args: [],
    );
  }

  /// `You should have storage permission`
  String get youShouldHaveStoragePermission {
    return Intl.message(
      'You should have storage permission',
      name: 'youShouldHaveStoragePermission',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Short Leave`
  String get shortLeave {
    return Intl.message(
      'Short Leave',
      name: 'shortLeave',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get startTime {
    return Intl.message(
      'Start Time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get endTime {
    return Intl.message(
      'End Time',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `End Number Of Minutes`
  String get endNumberOfMinutes {
    return Intl.message(
      'End Number Of Minutes',
      name: 'endNumberOfMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Reference Name`
  String get referenceName {
    return Intl.message(
      'Reference Name',
      name: 'referenceName',
      desc: '',
      args: [],
    );
  }

  /// `Leave Encashment`
  String get leaveEncashment {
    return Intl.message(
      'Leave Encashment',
      name: 'leaveEncashment',
      desc: '',
      args: [],
    );
  }

  /// `Requested Date`
  String get requestedDate {
    return Intl.message(
      'Requested Date',
      name: 'requestedDate',
      desc: '',
      args: [],
    );
  }

  /// `Requested Days`
  String get requestedDays {
    return Intl.message(
      'Requested Days',
      name: 'requestedDays',
      desc: '',
      args: [],
    );
  }

  /// `Indemnity Encashment`
  String get indemnityEncashment {
    return Intl.message(
      'Indemnity Encashment',
      name: 'indemnityEncashment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Month`
  String get paymentMonth {
    return Intl.message(
      'Payment Month',
      name: 'paymentMonth',
      desc: '',
      args: [],
    );
  }

  /// `maximum days`
  String get maximumDays {
    return Intl.message(
      'maximum days',
      name: 'maximumDays',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Days Is 80`
  String get maximumDaysIs80 {
    return Intl.message(
      'Maximum Days Is 80',
      name: 'maximumDaysIs80',
      desc: '',
      args: [],
    );
  }

  /// `loans`
  String get loans {
    return Intl.message(
      'loans',
      name: 'loans',
      desc: '',
      args: [],
    );
  }

  /// `Loan Requested Date`
  String get loanRequestedDate {
    return Intl.message(
      'Loan Requested Date',
      name: 'loanRequestedDate',
      desc: '',
      args: [],
    );
  }

  /// `Loan Start Date`
  String get loanStartDate {
    return Intl.message(
      'Loan Start Date',
      name: 'loanStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Loan Requested Amount`
  String get loanRequestedAmount {
    return Intl.message(
      'Loan Requested Amount',
      name: 'loanRequestedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Profit Rate`
  String get profitRate {
    return Intl.message(
      'Profit Rate',
      name: 'profitRate',
      desc: '',
      args: [],
    );
  }

  /// `Loan Total Amount`
  String get loanTotalAmount {
    return Intl.message(
      'Loan Total Amount',
      name: 'loanTotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Installments`
  String get installments {
    return Intl.message(
      'Installments',
      name: 'installments',
      desc: '',
      args: [],
    );
  }

  /// `Half Day Leave`
  String get halfDayLeave {
    return Intl.message(
      'Half Day Leave',
      name: 'halfDayLeave',
      desc: '',
      args: [],
    );
  }

  /// `Half Leave Type`
  String get halfLeaveType {
    return Intl.message(
      'Half Leave Type',
      name: 'halfLeaveType',
      desc: '',
      args: [],
    );
  }

  /// `Half Leave Date`
  String get halfLeaveDate {
    return Intl.message(
      'Half Leave Date',
      name: 'halfLeaveDate',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Minutes`
  String get numberOfMinutes {
    return Intl.message(
      'Number Of Minutes',
      name: 'numberOfMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Resume Duty`
  String get resumeDuty {
    return Intl.message(
      'Resume Duty',
      name: 'resumeDuty',
      desc: '',
      args: [],
    );
  }

  /// `Reference Type`
  String get referenceType {
    return Intl.message(
      'Reference Type',
      name: 'referenceType',
      desc: '',
      args: [],
    );
  }

  /// `Reference Data`
  String get referenceData {
    return Intl.message(
      'Reference Data',
      name: 'referenceData',
      desc: '',
      args: [],
    );
  }

  /// `Actual Resume Duty Date`
  String get actualResumeDutyDate {
    return Intl.message(
      'Actual Resume Duty Date',
      name: 'actualResumeDutyDate',
      desc: '',
      args: [],
    );
  }

  /// `Business Trip`
  String get businessTrip {
    return Intl.message(
      'Business Trip',
      name: 'businessTrip',
      desc: '',
      args: [],
    );
  }

  /// `Business Trip Type`
  String get businessTripType {
    return Intl.message(
      'Business Trip Type',
      name: 'businessTripType',
      desc: '',
      args: [],
    );
  }

  /// `Departure Date`
  String get departureDate {
    return Intl.message(
      'Departure Date',
      name: 'departureDate',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get returnDate {
    return Intl.message(
      'Return Date',
      name: 'returnDate',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Expected Resume Duty Date`
  String get expectedResumeDutyDate {
    return Intl.message(
      'Expected Resume Duty Date',
      name: 'expectedResumeDutyDate',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Flight Date`
  String get flightDate {
    return Intl.message(
      'Flight Date',
      name: 'flightDate',
      desc: '',
      args: [],
    );
  }

  /// `Visa Amount`
  String get visaAmount {
    return Intl.message(
      'Visa Amount',
      name: 'visaAmount',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Amount`
  String get ticketAmount {
    return Intl.message(
      'Ticket Amount',
      name: 'ticketAmount',
      desc: '',
      args: [],
    );
  }

  /// `Per Diem Amount`
  String get perDiemAmount {
    return Intl.message(
      'Per Diem Amount',
      name: 'perDiemAmount',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Hotel Amount`
  String get hotelAmount {
    return Intl.message(
      'Hotel Amount',
      name: 'hotelAmount',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get destination {
    return Intl.message(
      'Destination',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Trip Purpose`
  String get tripPurpose {
    return Intl.message(
      'Trip Purpose',
      name: 'tripPurpose',
      desc: '',
      args: [],
    );
  }

  /// `Air Ticket`
  String get airTicket {
    return Intl.message(
      'Air Ticket',
      name: 'airTicket',
      desc: '',
      args: [],
    );
  }

  /// `Air Ticket Due Month`
  String get airTicketDueMonth {
    return Intl.message(
      'Air Ticket Due Month',
      name: 'airTicketDueMonth',
      desc: '',
      args: [],
    );
  }

  /// `Air Ticket Due Year`
  String get airTicketDueYear {
    return Intl.message(
      'Air Ticket Due Year',
      name: 'airTicketDueYear',
      desc: '',
      args: [],
    );
  }

  /// `Other Request`
  String get otherRequest {
    return Intl.message(
      'Other Request',
      name: 'otherRequest',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `By Installment Amount`
  String get byInstallmentAmount {
    return Intl.message(
      'By Installment Amount',
      name: 'byInstallmentAmount',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Days Is`
  String get maximumDaysIs {
    return Intl.message(
      'Maximum Days Is',
      name: 'maximumDaysIs',
      desc: '',
      args: [],
    );
  }

  /// `Visa Required`
  String get visaRequired {
    return Intl.message(
      'Visa Required',
      name: 'visaRequired',
      desc: '',
      args: [],
    );
  }

  /// `Your Salary`
  String get yourSalary {
    return Intl.message(
      'Your Salary',
      name: 'yourSalary',
      desc: '',
      args: [],
    );
  }

  /// `PaySlip`
  String get paySlip {
    return Intl.message(
      'PaySlip',
      name: 'paySlip',
      desc: '',
      args: [],
    );
  }

  /// `Additions`
  String get additions {
    return Intl.message(
      'Additions',
      name: 'additions',
      desc: '',
      args: [],
    );
  }

  /// `Housing Allowance`
  String get housingAllowance {
    return Intl.message(
      'Housing Allowance',
      name: 'housingAllowance',
      desc: '',
      args: [],
    );
  }

  /// `Deducted`
  String get deducted {
    return Intl.message(
      'Deducted',
      name: 'deducted',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to discard the changes?`
  String get areYouSureYouWantToDiscardTheChanges {
    return Intl.message(
      'Are you sure you want to discard the changes?',
      name: 'areYouSureYouWantToDiscardTheChanges',
      desc: '',
      args: [],
    );
  }

  /// `Employer No:`
  String get employerNo {
    return Intl.message(
      'Employer No:',
      name: 'employerNo',
      desc: '',
      args: [],
    );
  }

  /// `Employer Name:`
  String get employerName {
    return Intl.message(
      'Employer Name:',
      name: 'employerName',
      desc: '',
      args: [],
    );
  }

  /// `Company `
  String get company {
    return Intl.message(
      'Company ',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Nationality:`
  String get nationality {
    return Intl.message(
      'Nationality:',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Birth Day:`
  String get birthDay {
    return Intl.message(
      'Birth Day:',
      name: 'birthDay',
      desc: '',
      args: [],
    );
  }

  /// `Civil ID:`
  String get civilId {
    return Intl.message(
      'Civil ID:',
      name: 'civilId',
      desc: '',
      args: [],
    );
  }

  /// `Position:`
  String get position {
    return Intl.message(
      'Position:',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Grade / Level:`
  String get gradeLevel {
    return Intl.message(
      'Grade / Level:',
      name: 'gradeLevel',
      desc: '',
      args: [],
    );
  }

  /// `Direct Manager:`
  String get directManager {
    return Intl.message(
      'Direct Manager:',
      name: 'directManager',
      desc: '',
      args: [],
    );
  }

  /// `Joining Date:`
  String get joiningDate {
    return Intl.message(
      'Joining Date:',
      name: 'joiningDate',
      desc: '',
      args: [],
    );
  }

  /// `Residency Issue Date:`
  String get residencyIssueDate {
    return Intl.message(
      'Residency Issue Date:',
      name: 'residencyIssueDate',
      desc: '',
      args: [],
    );
  }

  /// `Residency Expire Date:`
  String get residencyExpireDate {
    return Intl.message(
      'Residency Expire Date:',
      name: 'residencyExpireDate',
      desc: '',
      args: [],
    );
  }

  /// `Basic Salary:`
  String get basicSalary {
    return Intl.message(
      'Basic Salary:',
      name: 'basicSalary',
      desc: '',
      args: [],
    );
  }

  /// `Allowances:`
  String get allowances {
    return Intl.message(
      'Allowances:',
      name: 'allowances',
      desc: '',
      args: [],
    );
  }

  /// `Gross Salary:`
  String get grossSalary {
    return Intl.message(
      'Gross Salary:',
      name: 'grossSalary',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Reference Contact No`
  String get referenceContactNo {
    return Intl.message(
      'Reference Contact No',
      name: 'referenceContactNo',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `to continue`
  String get toContinue {
    return Intl.message(
      'to continue',
      name: 'toContinue',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enterYourEmailAddress {
    return Intl.message(
      'Enter your email address',
      name: 'enterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `associated with your account`
  String get associatedWithYourAccount {
    return Intl.message(
      'associated with your account',
      name: 'associatedWithYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation Email`
  String get confirmationEmail {
    return Intl.message(
      'Confirmation Email',
      name: 'confirmationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Back To Login`
  String get backToLogin {
    return Intl.message(
      'Back To Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email`
  String get pleaseCheckYourEmail {
    return Intl.message(
      'Please check your email',
      name: 'pleaseCheckYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email address is required`
  String get emailAddressIsRequired {
    return Intl.message(
      'Email address is required',
      name: 'emailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address. : example@example.com`
  String get pleaseEnterAValidEmailAddressForExample {
    return Intl.message(
      'Please enter a valid email address. : example@example.com',
      name: 'pleaseEnterAValidEmailAddressForExample',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the app?`
  String get areYouSureYouWantToExitTheApp {
    return Intl.message(
      'Are you sure you want to exit the app?',
      name: 'areYouSureYouWantToExitTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Back?`
  String get areYouSureYouWantToBack {
    return Intl.message(
      'Are you sure you want to Back?',
      name: 'areYouSureYouWantToBack',
      desc: '',
      args: [],
    );
  }

  /// `Attendance History`
  String get attendanceHistory {
    return Intl.message(
      'Attendance History',
      name: 'attendanceHistory',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Check In`
  String get checkIn {
    return Intl.message(
      'Check In',
      name: 'checkIn',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message(
      'Check Out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `Work hours`
  String get workHours {
    return Intl.message(
      'Work hours',
      name: 'workHours',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `You have already checked in`
  String get youHaveAlreadyCheckedIn {
    return Intl.message(
      'You have already checked in',
      name: 'youHaveAlreadyCheckedIn',
      desc: '',
      args: [],
    );
  }

  /// `You have already checked out`
  String get youHaveAlreadyCheckedOut {
    return Intl.message(
      'You have already checked out',
      name: 'youHaveAlreadyCheckedOut',
      desc: '',
      args: [],
    );
  }

  /// `You have not checked in yet`
  String get youHaveNotCheckedInYet {
    return Intl.message(
      'You have not checked in yet',
      name: 'youHaveNotCheckedInYet',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message(
      'Timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Create Date`
  String get createDate {
    return Intl.message(
      'Create Date',
      name: 'createDate',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Asset`
  String get asset {
    return Intl.message(
      'Asset',
      name: 'asset',
      desc: '',
      args: [],
    );
  }

  /// `Asset Type`
  String get assetType {
    return Intl.message(
      'Asset Type',
      name: 'assetType',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `My requests`
  String get myRequests {
    return Intl.message(
      'My requests',
      name: 'myRequests',
      desc: '',
      args: [],
    );
  }

  /// `My team requests`
  String get myTeamRequests {
    return Intl.message(
      'My team requests',
      name: 'myTeamRequests',
      desc: '',
      args: [],
    );
  }

  /// `My Team Attendance`
  String get myTeamAttendance {
    return Intl.message(
      'My Team Attendance',
      name: 'myTeamAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get on {
    return Intl.message(
      'On',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get building {
    return Intl.message(
      'Building',
      name: 'building',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get addressDetails {
    return Intl.message(
      'Address Details',
      name: 'addressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Flat`
  String get flat {
    return Intl.message(
      'Flat',
      name: 'flat',
      desc: '',
      args: [],
    );
  }

  /// `عربي`
  String get arabic {
    return Intl.message(
      'عربي',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Contact Type`
  String get contactType {
    return Intl.message(
      'Contact Type',
      name: 'contactType',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Failed To Get Current Location`
  String get failedToGetCurrentLocation {
    return Intl.message(
      'Failed To Get Current Location',
      name: 'failedToGetCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled. Please enable the services`
  String get locationDialogTitle {
    return Intl.message(
      'Location services are disabled. Please enable the services',
      name: 'locationDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Working Hr's`
  String get workHour {
    return Intl.message(
      'Working Hr\'s',
      name: 'workHour',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get present {
    return Intl.message(
      'Present',
      name: 'present',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want cancel request?`
  String get areYouSureYouWantCancelRequest {
    return Intl.message(
      'Are you sure you want cancel request?',
      name: 'areYouSureYouWantCancelRequest',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get employee {
    return Intl.message(
      'Employee',
      name: 'employee',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get attachment {
    return Intl.message(
      'Attachment',
      name: 'attachment',
      desc: '',
      args: [],
    );
  }

  /// `Attachment Type`
  String get attachmentType {
    return Intl.message(
      'Attachment Type',
      name: 'attachmentType',
      desc: '',
      args: [],
    );
  }

  /// `Document No`
  String get documentNo {
    return Intl.message(
      'Document No',
      name: 'documentNo',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Qualification Type`
  String get qualificationType {
    return Intl.message(
      'Qualification Type',
      name: 'qualificationType',
      desc: '',
      args: [],
    );
  }

  /// `Qualification Place Name`
  String get qualificationPlaceName {
    return Intl.message(
      'Qualification Place Name',
      name: 'qualificationPlaceName',
      desc: '',
      args: [],
    );
  }

  /// `Issue Date`
  String get issueDate {
    return Intl.message(
      'Issue Date',
      name: 'issueDate',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message(
      'Expiry Date',
      name: 'expiryDate',
      desc: '',
      args: [],
    );
  }

  /// `No Requests`
  String get noRequests {
    return Intl.message(
      'No Requests',
      name: 'noRequests',
      desc: '',
      args: [],
    );
  }

  /// `Current Step`
  String get currentStep {
    return Intl.message(
      'Current Step',
      name: 'currentStep',
      desc: '',
      args: [],
    );
  }

  /// `Action By`
  String get actionBy {
    return Intl.message(
      'Action By',
      name: 'actionBy',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `No Timeline`
  String get noTimeline {
    return Intl.message(
      'No Timeline',
      name: 'noTimeline',
      desc: '',
      args: [],
    );
  }

  /// `No Team Attendance`
  String get noTeamAttendance {
    return Intl.message(
      'No Team Attendance',
      name: 'noTeamAttendance',
      desc: '',
      args: [],
    );
  }

  /// `No History`
  String get noHistory {
    return Intl.message(
      'No History',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `Notifications is Empty`
  String get emptyNotification {
    return Intl.message(
      'Notifications is Empty',
      name: 'emptyNotification',
      desc: '',
      args: [],
    );
  }

  /// `KWD`
  String get KWD {
    return Intl.message(
      'KWD',
      name: 'KWD',
      desc: '',
      args: [],
    );
  }

  /// `Can't be Empty`
  String get cantBeEmpty {
    return Intl.message(
      'Can\'t be Empty',
      name: 'cantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Not valid`
  String get notValid {
    return Intl.message(
      'Not valid',
      name: 'notValid',
      desc: '',
      args: [],
    );
  }

  /// `Please select company first`
  String get pleaseSelectCompanyFirst {
    return Intl.message(
      'Please select company first',
      name: 'pleaseSelectCompanyFirst',
      desc: '',
      args: [],
    );
  }

  /// `Date not valid`
  String get dateNotValid {
    return Intl.message(
      'Date not valid',
      name: 'dateNotValid',
      desc: '',
      args: [],
    );
  }

  /// `No Image Selected`
  String get noImageSelected {
    return Intl.message(
      'No Image Selected',
      name: 'noImageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Request Type`
  String get requestType {
    return Intl.message(
      'Request Type',
      name: 'requestType',
      desc: '',
      args: [],
    );
  }

  /// `Expected Resume Duty`
  String get expectedResumeDuty {
    return Intl.message(
      'Expected Resume Duty',
      name: 'expectedResumeDuty',
      desc: '',
      args: [],
    );
  }

  /// `Allowances Amount`
  String get allowancesAmount {
    return Intl.message(
      'Allowances Amount',
      name: 'allowancesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message(
      'Approve',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Short Leave Date`
  String get shortLeaveDate {
    return Intl.message(
      'Short Leave Date',
      name: 'shortLeaveDate',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Status`
  String get transactionStatusName {
    return Intl.message(
      'Transaction Status',
      name: 'transactionStatusName',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Original Amount`
  String get ticketOriginalAmount {
    return Intl.message(
      'Ticket Original Amount',
      name: 'ticketOriginalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Start Month`
  String get paymentStartMonth {
    return Intl.message(
      'Payment Start Month',
      name: 'paymentStartMonth',
      desc: '',
      args: [],
    );
  }

  /// `Payment Start Year`
  String get paymentStartYear {
    return Intl.message(
      'Payment Start Year',
      name: 'paymentStartYear',
      desc: '',
      args: [],
    );
  }

  /// `Salary Deduction Percentage`
  String get salaryDeductionPercentage {
    return Intl.message(
      'Salary Deduction Percentage',
      name: 'salaryDeductionPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Leave Start Date`
  String get leaveStartDate {
    return Intl.message(
      'Leave Start Date',
      name: 'leaveStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Leave End Date`
  String get leaveEndDate {
    return Intl.message(
      'Leave End Date',
      name: 'leaveEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Total Resumed Days`
  String get totalResumedDays {
    return Intl.message(
      'Total Resumed Days',
      name: 'totalResumedDays',
      desc: '',
      args: [],
    );
  }

  /// `currency Code`
  String get currencyCode {
    return Intl.message(
      'currency Code',
      name: 'currencyCode',
      desc: '',
      args: [],
    );
  }

  /// `Indemnity Service Days`
  String get indemnityServiceDays {
    return Intl.message(
      'Indemnity Service Days',
      name: 'indemnityServiceDays',
      desc: '',
      args: [],
    );
  }

  /// `Indemnity Days`
  String get indemnityDays {
    return Intl.message(
      'Indemnity Days',
      name: 'indemnityDays',
      desc: '',
      args: [],
    );
  }

  /// `Indemnity Amount`
  String get indemnityAmount {
    return Intl.message(
      'Indemnity Amount',
      name: 'indemnityAmount',
      desc: '',
      args: [],
    );
  }

  /// `Half Day Leave Type Name`
  String get halfDayLeaveTypeName {
    return Intl.message(
      'Half Day Leave Type Name',
      name: 'halfDayLeaveTypeName',
      desc: '',
      args: [],
    );
  }

  /// `Encashment Leave Type Name`
  String get encashmentLeaveTypeName {
    return Intl.message(
      'Encashment Leave Type Name',
      name: 'encashmentLeaveTypeName',
      desc: '',
      args: [],
    );
  }

  /// `Indemnity Encashment Name`
  String get indemnityEncashmentName {
    return Intl.message(
      'Indemnity Encashment Name',
      name: 'indemnityEncashmentName',
      desc: '',
      args: [],
    );
  }

  /// `Leave Type Name`
  String get leaveTypeName {
    return Intl.message(
      'Leave Type Name',
      name: 'leaveTypeName',
      desc: '',
      args: [],
    );
  }

  /// `Resume Duty Type Name`
  String get resumeDutyTypeName {
    return Intl.message(
      'Resume Duty Type Name',
      name: 'resumeDutyTypeName',
      desc: '',
      args: [],
    );
  }

  /// `Other Request Name`
  String get otherRequestName {
    return Intl.message(
      'Other Request Name',
      name: 'otherRequestName',
      desc: '',
      args: [],
    );
  }

  /// `Loan Type Name`
  String get loanTypeName {
    return Intl.message(
      'Loan Type Name',
      name: 'loanTypeName',
      desc: '',
      args: [],
    );
  }

  /// `Qualification Type Name`
  String get qualificationTypeName {
    return Intl.message(
      'Qualification Type Name',
      name: 'qualificationTypeName',
      desc: '',
      args: [],
    );
  }

  /// `Country Name`
  String get countryName {
    return Intl.message(
      'Country Name',
      name: 'countryName',
      desc: '',
      args: [],
    );
  }

  /// `Open File`
  String get openFile {
    return Intl.message(
      'Open File',
      name: 'openFile',
      desc: '',
      args: [],
    );
  }

  /// `Attachment Type Name`
  String get attachmentTypeName {
    return Intl.message(
      'Attachment Type Name',
      name: 'attachmentTypeName',
      desc: '',
      args: [],
    );
  }

  /// `File is Empty`
  String get fileIsEmpty {
    return Intl.message(
      'File is Empty',
      name: 'fileIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Must Be More Than Zero`
  String get mustBeMoreThanZero {
    return Intl.message(
      'Must Be More Than Zero',
      name: 'mustBeMoreThanZero',
      desc: '',
      args: [],
    );
  }

  /// `No News Yet`
  String get noNewsYet {
    return Intl.message(
      'No News Yet',
      name: 'noNewsYet',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message(
      'Remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Remaining of`
  String get remainingOf {
    return Intl.message(
      'Remaining of',
      name: 'remainingOf',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `The Vacation Balance`
  String get theVacationBalance {
    return Intl.message(
      'The Vacation Balance',
      name: 'theVacationBalance',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `End of the year`
  String get endOfTheYear {
    return Intl.message(
      'End of the year',
      name: 'endOfTheYear',
      desc: '',
      args: [],
    );
  }

  /// `Last Updates`
  String get lastUpdates {
    return Intl.message(
      'Last Updates',
      name: 'lastUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Quick Requests`
  String get quickRequests {
    return Intl.message(
      'Quick Requests',
      name: 'quickRequests',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Vacation`
  String get vacation {
    return Intl.message(
      'Vacation',
      name: 'vacation',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want reject?`
  String get areYouSureYouWantReject {
    return Intl.message(
      'Are you sure you want reject?',
      name: 'areYouSureYouWantReject',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want Approve?`
  String get areYouSureYouWantApprove {
    return Intl.message(
      'Are you sure you want Approve?',
      name: 'areYouSureYouWantApprove',
      desc: '',
      args: [],
    );
  }

  /// `No problem found`
  String get noProblemFound {
    return Intl.message(
      'No problem found',
      name: 'noProblemFound',
      desc: '',
      args: [],
    );
  }

  /// `No requests found`
  String get noRequestsFound {
    return Intl.message(
      'No requests found',
      name: 'noRequestsFound',
      desc: '',
      args: [],
    );
  }

  /// `You should have photos permission`
  String get youShouldHavePhotosPermission {
    return Intl.message(
      'You should have photos permission',
      name: 'youShouldHavePhotosPermission',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Asset Details`
  String get assetDetails {
    return Intl.message(
      'Asset Details',
      name: 'assetDetails',
      desc: '',
      args: [],
    );
  }

  /// `Area Name`
  String get areaName {
    return Intl.message(
      'Area Name',
      name: 'areaName',
      desc: '',
      args: [],
    );
  }

  /// `Building Number`
  String get buildingNumber {
    return Intl.message(
      'Building Number',
      name: 'buildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address Name`
  String get addressName {
    return Intl.message(
      'Address Name',
      name: 'addressName',
      desc: '',
      args: [],
    );
  }

  /// `Contact Name`
  String get contactName {
    return Intl.message(
      'Contact Name',
      name: 'contactName',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contactNumber {
    return Intl.message(
      'Contact Number',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
