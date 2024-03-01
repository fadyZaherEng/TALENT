part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ProfileInitialState extends ProfileState {}

//get profile info
class ProfileGetInfoLoadingState extends ProfileState {}

class ProfileGetInfoSuccessState extends ProfileState {
  ProfileEmployee profileEmployee;

  ProfileGetInfoSuccessState(this.profileEmployee);
}

class ProfileGetInfoErrorState extends ProfileState {
  String errorMSG;

  ProfileGetInfoErrorState({required this.errorMSG});
}

class ProfileChangeImagePopDialogState extends ProfileState {}

class ProfileHideLoadingState extends ProfileState {}

class ProfileShowLoadingState extends ProfileState {}

//change profile image
class ProfileChangeImageLoadingState extends ProfileState {}

class ProfileInsertAttachmentSuccessState extends ProfileState {
  String successMassage;

  ProfileInsertAttachmentSuccessState({required this.successMassage});
}

class ProfileInsertAttachmentErrorState extends ProfileState {
  String errorMassage;

  ProfileInsertAttachmentErrorState({required this.errorMassage});
}

class ProfileChangeImageSuccessState extends ProfileState {
  String? profileImage;

  ProfileChangeImageSuccessState({required this.profileImage});
}

class ProfileChangeImageErrorState extends ProfileState {}
