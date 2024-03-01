part of 'education_bloc.dart';

@immutable
abstract class EducationEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class EducationBackEvent extends EducationEvent {}

class EducationDataFillingEvent extends EducationEvent {
  EducationController educationController;
  String issueDate, expireDate, pathFile;

  EducationDataFillingEvent({
    required this.educationController,
    required this.expireDate,
    required this.issueDate,
    required this.pathFile,
  });
}

class EducationOpenQualificationTypeBottomSheetEvent extends EducationEvent {}

class EducationValidationQualificationTypeEvent extends EducationEvent {
  final RequestType value;

  EducationValidationQualificationTypeEvent({
    required this.value,
  });
}

class EducationValidationQualificationPlaceNameEvent extends EducationEvent {
  final String value;

  EducationValidationQualificationPlaceNameEvent({
    required this.value,
  });
}

class EducationOpenCountryBottomSheetEvent extends EducationEvent {}

class EducationValidationIssueDateEvent extends EducationEvent {
  final String value;

  EducationValidationIssueDateEvent({
    required this.value,
  });
}

class EducationValidationExpiryDateEvent extends EducationEvent {
  final String value;

  EducationValidationExpiryDateEvent({
    required this.value,
  });
}

class EducationOpenFileBottomSheetEvent extends EducationEvent {}

class EducationOpenCameraEvent extends EducationEvent {}

class EducationOpenGalleryEvent extends EducationEvent {}

class EducationOpenFileEvent extends EducationEvent {}

class EducationSelectFileEvent extends EducationEvent {
  final String filePath;

  EducationSelectFileEvent({required this.filePath});
}

class EducationDeleteFileEvent extends EducationEvent {
  final String file;

  EducationDeleteFileEvent({
    required this.file,
  });
}

class EducationSubmitEvent extends EducationEvent {
  final String issueDate;
  final String expiryDate;
  final String file;
  final int qualificationTypeId;
  final int countryId;
  final EducationController educationController;

  EducationSubmitEvent({
    required this.issueDate,
    required this.expiryDate,
    required this.educationController,
    required this.file,
    required this.qualificationTypeId,
    required this.countryId,
  });
}

class GetQualificationTypeEvent extends EducationEvent {}

class GetCountriesEvent extends EducationEvent {}

class EducationValidationCountryEvent extends EducationEvent {
  final Country value;

  EducationValidationCountryEvent({required this.value});
}
