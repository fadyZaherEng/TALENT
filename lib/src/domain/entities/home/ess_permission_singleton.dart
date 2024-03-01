import 'package:talent_link/src/domain/entities/request/request.dart';

class EssPermissionSingleTon {
  static final EssPermissionSingleTon _essPermissionSingleTon =
      EssPermissionSingleTon._internal();

  factory EssPermissionSingleTon() {
    return _essPermissionSingleTon;
  }

  EssPermissionSingleTon._internal();

  static List<Request> _requests = [];

  static void setEssPermission(List<Request> requestList) => _requests = requestList;

  static List<Request> get getEssPermission => _requests;
}
