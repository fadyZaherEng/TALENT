part of 'update_profile_bloc.dart';

@immutable
abstract class UpdateProfileEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class UpdateProfileBackEvent extends UpdateProfileEvent {}

class GetUpdateProfileListEvent extends UpdateProfileEvent {
  final int userTypeId;

  GetUpdateProfileListEvent({this.userTypeId = 1});
}

class NavigateToUpdateProfileScreensEvent extends UpdateProfileEvent{
  final Request request ;
  NavigateToUpdateProfileScreensEvent({required this.request});
}