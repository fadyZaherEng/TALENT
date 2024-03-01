part of 'education_details_bloc.dart';

@immutable
abstract class EducationDetailsState {}

class EducationDetailsInitialState extends EducationDetailsState {}

class EducationDetailsLoadingState extends EducationDetailsState {}

class EducationDetailsSuccessState extends EducationDetailsState {
  final EducationDetails educationDetails;

  EducationDetailsSuccessState({required this.educationDetails});
}

class EducationDetailsErrorState extends EducationDetailsState {
  final String errorMessage;

  EducationDetailsErrorState({required this.errorMessage});
}

class EducationDetailsApproveSuccessState extends EducationDetailsState {
  final DataSuccess dataSuccess;

  EducationDetailsApproveSuccessState({required this.dataSuccess});
}

class EducationDetailsApproveErrorState extends EducationDetailsState {
  final String errorMessage;

  EducationDetailsApproveErrorState({required this.errorMessage});
}

class EducationDetailsRejectSuccessState extends EducationDetailsState {
  final DataSuccess dataSuccess;



  EducationDetailsRejectSuccessState({required this.dataSuccess});

}

class EducationDetailsRejectErrorState extends EducationDetailsState {
  final String errorMessage;

  EducationDetailsRejectErrorState({required this.errorMessage});
}
