part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class NotificationInitialState extends NotificationsState {}

class NotificationSkeletonState extends NotificationsState {}

class GetNotificationsSuccessState extends NotificationsState {
  final List<Notifications> notifications;

  GetNotificationsSuccessState({
    required this.notifications,
  });
}

class GetNotificationsErrorState extends NotificationsState {
  final String errorMessage;

  GetNotificationsErrorState({
    required this.errorMessage,
  });
}

class NotificationsBackState extends NotificationsState {}
