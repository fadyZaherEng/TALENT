part of 'short_leave_bloc.dart';

@immutable
abstract class ShortLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ShortLeaveBackEvent extends ShortLeaveEvent {}

class OpenTypeBottomSheetEvent extends ShortLeaveEvent {}

class SelectShortLeaveTypeEvent extends ShortLeaveEvent {
  final RequestType shortLeaveType;

  SelectShortLeaveTypeEvent({
    required this.shortLeaveType,
  });
}

class OpenUploadFileBottomSheetEvent extends ShortLeaveEvent {
  final bool isMandatory;

  OpenUploadFileBottomSheetEvent({required this.isMandatory});
}

class ShortLeaveOpenCameraEvent extends ShortLeaveEvent {
  final bool isMandatory;

  ShortLeaveOpenCameraEvent({required this.isMandatory});
}

class ShortLeaveOpenGalleryEvent extends ShortLeaveEvent {
  final bool isMandatory;

  ShortLeaveOpenGalleryEvent({required this.isMandatory});
}

class ShortLeaveOpenFileEvent extends ShortLeaveEvent {
  final bool isMandatory;

  ShortLeaveOpenFileEvent({required this.isMandatory});
}

class ShortLeaveSelectFileEvent extends ShortLeaveEvent {
  final String filePath;
  final bool isMandatory;

  ShortLeaveSelectFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ShortLeaveDeleteFileEvent extends ShortLeaveEvent {
  final String filePath;
  final bool isMandatory;

  ShortLeaveDeleteFileEvent({
    required this.filePath,
    required this.isMandatory,
  });
}

class ShortLeaveSubmitEvent extends ShortLeaveEvent {
  final String date;
  final String startTime;
  final String endTime;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final String file;
  final ShortLeaveController shortLeaveController;
  final int typeId;

  ShortLeaveSubmitEvent({
    required this.shortLeaveController,
    required this.allFieldsMandatory,
    required this.file,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.typeId,
  });
}

class ValidateShortLeaveTypeEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveTypeEvent({
    required this.value,
  });
}

class ValidateShortLeaveDateEvent extends ShortLeaveEvent {
  final String value;

  ValidateShortLeaveDateEvent({
    required this.value,
  });
}

class ValidateShortLeaveStartTimeEvent extends ShortLeaveEvent {
  final String startTime;
  final String endTime;

  ValidateShortLeaveStartTimeEvent({
    required this.startTime,
    required this.endTime,
  });
}

class ValidateShortLeaveEndTimeEvent extends ShortLeaveEvent {
  final String endTime;
  final String startTime;

  ValidateShortLeaveEndTimeEvent({
    required this.endTime,
    required this.startTime,
  });
}


class ValidateShortLeaveReferenceNameEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveReferenceNameEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveReferenceContactNoEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveReferenceContactNoEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveReasonsEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveReasonsEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveRemarksEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveFileEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class GetShortLeaveTypesEvent extends ShortLeaveEvent {}

class GetAllFieldsMandatoryEvent extends ShortLeaveEvent {
  final int requestTypeId;
  final int requestData;

  GetAllFieldsMandatoryEvent({
    required this.requestData,
    required this.requestTypeId,
  });
}

class InsertShortLeaveEvent extends ShortLeaveEvent {
  final String date;
  final String startTime;
  final String endTime;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final String file;
  final ShortLeaveController shortLeaveController;
  final int typeId;

  InsertShortLeaveEvent({
    required this.shortLeaveController,
    required this.allFieldsMandatory,
    required this.file,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.typeId,
  });
}

class ValidateShortLeaveRemainingBalanceEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveRemainingBalanceEvent({
    required this.value,
    required this.isMandatory,
  });
}

class ValidateShortLeaveCurrentBalanceEvent extends ShortLeaveEvent {
  final String value;
  final bool isMandatory;

  ValidateShortLeaveCurrentBalanceEvent({
    required this.value,
    required this.isMandatory,
  });
}

class CalculateInCaseShortLeaveEvent extends ShortLeaveEvent {
  final ShortLeaveContentValue calculateInCaseShortLeave;

  CalculateInCaseShortLeaveEvent({
    required this.calculateInCaseShortLeave,
  });
}
