part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileInfoEvent extends ProfileEvent {}

class ChangeProfileImageEvent extends ProfileEvent {
  File? file;
  ChangeProfileImageEvent({required this.file});
}

class ProfileChangeImagePopDialogEvent extends ProfileEvent {}
