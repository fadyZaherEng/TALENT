part of 'education_bloc.dart';

@immutable
abstract class EducationState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class EducationInitialState extends EducationState {}

//check if enter data filling
class EducationDataFillingSuccessState extends EducationState {}

class EducationDataFillingErrorState extends EducationState {}

class EducationLoadingState extends EducationState {}

class EducationBackState extends EducationState {}

class EducationOpenQualificationTypeBottomSheetState extends EducationState {}

class EducationValidationQualificationTypeValidState extends EducationState {
  final RequestType qualificationType;

  EducationValidationQualificationTypeValidState(
      {required this.qualificationType});
}

class EducationValidationQualificationTypeNotValidState extends EducationState {
  final String validationMessage;

  EducationValidationQualificationTypeNotValidState({
    required this.validationMessage,
  });
}

class EducationValidationQualificationPlaceNameValidState
    extends EducationState {}

class EducationValidationQualificationPlaceNameNotValidState
    extends EducationState {
  final String validationMessage;

  EducationValidationQualificationPlaceNameNotValidState({
    required this.validationMessage,
  });
}

class EducationOpenCountryBottomSheetState extends EducationState {}

class EducationValidationCountryValidState extends EducationState {
  final Country country;

  EducationValidationCountryValidState({required this.country});
}

class EducationValidationCountryNotValidState extends EducationState {
  final String validationMessage;

  EducationValidationCountryNotValidState({required this.validationMessage});
}

class EducationValidationIssueDateNotValidState extends EducationState {
  final String validationMessage;

  EducationValidationIssueDateNotValidState({
    required this.validationMessage,
  });
}

class EducationValidationIssueDateValidState extends EducationState {}

class EducationValidationExpiryDateNotValidState extends EducationState {
  final String validationState;

  EducationValidationExpiryDateNotValidState({
    required this.validationState,
  });
}

class EducationValidationExpiryDateValidState extends EducationState {}

class EducationOpenFileBottomSheetState extends EducationState {}

class EducationDeleteFileState extends EducationState {
  final String file;

  EducationDeleteFileState({
    required this.file,
  });
}

class EducationOpenCameraState extends EducationState {}

class EducationOpenGalleryState extends EducationState {}

class EducationOpenFileState extends EducationState {}

class EducationSelectFileState extends EducationState {
  final String filePath;

  EducationSelectFileState({required this.filePath});
}

class GetQualificationTypeSuccessState extends EducationState {
  final List<RequestType> qualificationTypes;

  GetQualificationTypeSuccessState({required this.qualificationTypes});
}

class GetQualificationTypeErrorState extends EducationState {
  final String errorMessage;

  GetQualificationTypeErrorState({required this.errorMessage});
}

class GetCountriesSuccessState extends EducationState {
  final List<Country> countries;

  GetCountriesSuccessState({
    required this.countries,
  });
}

class GetCountriesErrorState extends EducationState {
  final String errorMessage;

  GetCountriesErrorState({required this.errorMessage});
}

class EducationSubmitSuccessState extends EducationState {
  final String successMessage;

  EducationSubmitSuccessState({
    required this.successMessage,
  });
}

class EducationSubmitErrorState extends EducationState {
  final String errorMessage;

  EducationSubmitErrorState({
    required this.errorMessage,
  });
}
