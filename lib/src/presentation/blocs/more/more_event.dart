part of 'more_bloc.dart';

@immutable
abstract class MoreEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MoreNavigateToUpdateProfileScreenEvent extends MoreEvent {}

class MoreNavigateToMyRequestsScreenEvent extends MoreEvent {}

class MoreNavigateToMyTeamRequestsScreenEvent extends MoreEvent {}

class MoreNavigateToAttendanceHistoryScreenEvent extends MoreEvent {}

class MoreNavigateToMyTeamAttendanceScreenEvent extends MoreEvent {}

class MoreNavigateToTermsConditionsScreenEvent extends MoreEvent {}

class MoreNavigateToAboutUsScreenEvent extends MoreEvent {}

class MoreNotificationsToggleEvent extends MoreEvent {
  final bool value;

  MoreNotificationsToggleEvent({required this.value});
}

class MoreSwitchLanguageEvent extends MoreEvent {
  final bool value;

  MoreSwitchLanguageEvent({
    required this.value,
  });
}

class MoreGetLanguageEvent extends MoreEvent {}

class MoreGetNotificationStatusEvent extends MoreEvent {}

class MoreLogoutEvent extends MoreEvent {}

class MoreBackEvent extends MoreEvent {}

class MoreTeamRequestAndAttendanceVisibilityEvent extends MoreEvent {}
