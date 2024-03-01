import 'package:talent_link/src/domain/entities/request/request_type.dart';

class MyRequestFilter {
  List<RequestType>? requests;
  DateTime? fromRequestedDate;
  DateTime? toRequestedDate;
  DateTime? fromCreatedDate;
  DateTime? toCreatedDate;
  List<RequestType>? status;
  String? fromRequestedDateErrorMessage;
  String? toRequestedDateErrorMessage;
  String? fromCreatedDateErrorMessage;
  String? toCreatedDateErrorMessage;

  MyRequestFilter({
    this.requests,
    this.fromRequestedDate,
    this.toCreatedDate,
    this.fromCreatedDate,
    this.toRequestedDate,
    this.status,
    this.fromCreatedDateErrorMessage,
    this.fromRequestedDateErrorMessage,
    this.toCreatedDateErrorMessage,
    this.toRequestedDateErrorMessage,
  });

  MyRequestFilter copy() {
    return MyRequestFilter(
      requests: requests
              ?.map((e) =>
                  RequestType(id: e.id, name: e.name, isSelected: e.isSelected))
              .toList() ??
          [],
      fromRequestedDate: fromRequestedDate,
      toRequestedDate: toRequestedDate,
      fromCreatedDate: fromCreatedDate,
      toCreatedDate: toCreatedDate,
      status: status
              ?.map((e) =>
          RequestType(id: e.id, name: e.name, isSelected: e.isSelected))
              .toList() ??
          [],
      fromRequestedDateErrorMessage: fromRequestedDateErrorMessage,
      toRequestedDateErrorMessage: toRequestedDateErrorMessage,
      fromCreatedDateErrorMessage: fromCreatedDateErrorMessage,
      toCreatedDateErrorMessage: toCreatedDateErrorMessage,
    );
  }
}
