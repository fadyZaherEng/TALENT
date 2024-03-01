part of 'more_bloc.dart';

@immutable
abstract class MoreState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MoreInitialState extends MoreState {}

class MoreNavigateToUpdateProfileScreenState extends MoreState {}

class MoreNavigateToMyRequestsScreenState extends MoreState {}

class MoreNavigateToMyTeamRequestsScreenState extends MoreState {}

class MoreNavigateToAttendanceHistoryScreenState extends MoreState {}

class MoreNavigateToMyTeamAttendanceScreenState extends MoreState {}

class MoreNavigateToTermsConditionsScreenState extends MoreState {}

class MoreNavigateToAboutUsScreenState extends MoreState {}

class MoreNotificationsToggleState extends MoreState {
  final bool value;

  MoreNotificationsToggleState({required this.value});
}

class MoreSwitchLanguageState extends MoreState {
  final bool value;

  MoreSwitchLanguageState({required this.value});
}

class MoreLogoutState extends MoreState {}

class MoreBackState extends MoreState {}

class MoreGetLanguageState extends MoreState {
  bool language;

  MoreGetLanguageState({required this.language});
}

class MoreGetNotificationStatusState extends MoreState {
  bool status;
  MoreGetNotificationStatusState({required this.status});
}

class MoreTeamRequestAndAttendanceVisibilityState extends MoreState {
  int userTypeId;
  MoreTeamRequestAndAttendanceVisibilityState({required this.userTypeId});
}
