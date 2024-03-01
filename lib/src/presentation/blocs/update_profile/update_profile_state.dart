part of 'update_profile_bloc.dart';

@immutable
abstract class UpdateProfileState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class UpdateProfileInitialState extends UpdateProfileState {}

class UpdateProfileSkeletonState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {
  final List<Request> requests;

  UpdateProfileSuccessState({
    required this.requests,
  });
}
class UpdateProfileErrorState extends UpdateProfileState{
  final String errorMassage;
  UpdateProfileErrorState({required this.errorMassage});
}


class UpdateProfileBackState extends UpdateProfileState {}

class NavigateToAddressScreenState extends UpdateProfileState {}
class NavigateToContactScreenState extends UpdateProfileState {}
class NavigateToAttachmentScreenState extends UpdateProfileState {}
class NavigateToAssetScreenState extends UpdateProfileState {}
class NavigateToEducationScreenState extends UpdateProfileState {}
