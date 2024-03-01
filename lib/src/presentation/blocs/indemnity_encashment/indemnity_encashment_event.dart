part of 'indemnity_encashment_bloc.dart';

@immutable
abstract class IndemnityEncashmentEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class IndemnityEncashmentBackEvent extends IndemnityEncashmentEvent {}

class IndemnityEncashmentOpenPaymentMethodBottomSheetEvent
    extends IndemnityEncashmentEvent {}

class IndemnityEncashmentValidationRemarksEvent
    extends IndemnityEncashmentEvent {
  final String value;

  final bool isMandatory;

  IndemnityEncashmentValidationRemarksEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentDeleteFileEvent extends IndemnityEncashmentEvent {
  final String value;
  final bool isMandatory;

  IndemnityEncashmentDeleteFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenUploadFileEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenUploadFileEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentValidationRequestedDaysEvent
    extends IndemnityEncashmentEvent {
  final String value;
  final int maximDays;

  IndemnityEncashmentValidationRequestedDaysEvent({
    required this.value,
    required this.maximDays,
  });
}

class IndemnityEncashmentValidationPaymentMonthEvent
    extends IndemnityEncashmentEvent {
  final String value;

  IndemnityEncashmentValidationPaymentMonthEvent({
    required this.value,
  });
}

class IndemnityEncashmentValidationPaymentMethodEvent
    extends IndemnityEncashmentEvent {
  final String value;
  final bool isVisiblePaymentMethod;

  IndemnityEncashmentValidationPaymentMethodEvent({
    required this.value,
    required this.isVisiblePaymentMethod,
  });
}

class IndemnityEncashmentValidationRequestedDateEvent
    extends IndemnityEncashmentEvent {
  final String value;

  IndemnityEncashmentValidationRequestedDateEvent({
    required this.value,
  });
}

class IndemnityEncashmentSelectFileEvent extends IndemnityEncashmentEvent {
  final String value;
  final bool isMandatory;

  IndemnityEncashmentSelectFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentSelectPaymentMethodEvent
    extends IndemnityEncashmentEvent {
  final RequestPaymentMethod value;

  IndemnityEncashmentSelectPaymentMethodEvent({
    required this.value,
  });
}

class IndemnityEncashmentOpenCameraEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenCameraEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenGalleryEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenGalleryEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentOpenFileEvent extends IndemnityEncashmentEvent {
  final bool isMandatory;

  IndemnityEncashmentOpenFileEvent({
    required this.isMandatory,
  });
}

class IndemnityEncashmentSubmitEvent extends IndemnityEncashmentEvent {
  final String requestedDate;
  final String paymentMonth;
  final List<AllFieldsMandatory> allFieldsMandatory;
  final String file;
  final IndemnityEncashmentController indemnityEncashmentController;
  final int maximDays;
  final bool isVisiblePaymentMethod;
  final int paymentMethodId ;
  final int isByPayroll;

  IndemnityEncashmentSubmitEvent({
    required this.indemnityEncashmentController,
    required this.paymentMonth,
    required this.requestedDate,
    required this.allFieldsMandatory,
    required this.file,
    required this.maximDays,
    required this.isVisiblePaymentMethod,
    required this.paymentMethodId,
    required this.isByPayroll,
  });
}

class IndemnityEncashmentValidationFileEvent extends IndemnityEncashmentEvent {
  final String value;
  final bool isMandatory;

  IndemnityEncashmentValidationFileEvent({
    required this.value,
    required this.isMandatory,
  });
}

class IndemnityEncashmentGetPaymentMethodEvent
    extends IndemnityEncashmentEvent {}

class GetIndemnityEmployeeEvent extends IndemnityEncashmentEvent {}

class GetIndemnityAllFieldsMandatory extends IndemnityEncashmentEvent {
  final int requestTypeId;
  final int requestData;

  GetIndemnityAllFieldsMandatory({
    required this.requestTypeId,
    required this.requestData,
  });
}

class IndemnityEncashmentShowPaymentMethodTextFieldEvent
    extends IndemnityEncashmentEvent {
  final SingleSelectionModel singleSelectionModel;

  IndemnityEncashmentShowPaymentMethodTextFieldEvent(
      {required this.singleSelectionModel});
}
