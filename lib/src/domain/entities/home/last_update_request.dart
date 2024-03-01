import 'package:talent_link/src/domain/entities/home/last_attendance.dart';
import 'package:talent_link/src/domain/entities/home/last_requests.dart';

class LastUpdateRequests {
  LastAttendance? lastAttendance;
  List<LastRequests>? lastRequests;
  List<LastRequests>? lastVacation;

   LastUpdateRequests({
    this.lastAttendance,
    this.lastRequests,
    this.lastVacation,
  });
}
