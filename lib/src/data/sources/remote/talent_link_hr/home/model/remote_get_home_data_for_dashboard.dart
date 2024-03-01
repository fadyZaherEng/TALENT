import 'package:json_annotation/json_annotation.dart';

import 'package:talent_link/src/domain/entities/home/home_data.dart';

part 'remote_get_home_data_for_dashboard.g.dart';

@JsonSerializable()
class RemoteGetDataForDashBoard {
  @JsonKey(name: 'checkInTime')
  final String? checkInTime;
  @JsonKey(name: 'checkOutTime')
  final String? checkOutTime;
  @JsonKey(name: 'shiftTime')
  final String? shiftTime;
  @JsonKey(name: 'currentBalance')
  final double? currentBalance;
  @JsonKey(name: 'remainingCurrentBalance')
  final int? remainingCurrentBalance;
  @JsonKey(name: 'yearlyBalance')
  final double? yearlyBalance;
  @JsonKey(name: 'remainingYearlyBalance')
  final int? remainingYearlyBalance;
  @JsonKey(name: 'remainingWorkHours')
  final int? remainingWorkHours;
  @JsonKey(name: 'notificationCount')
  final int? notificationCount;
  RemoteGetDataForDashBoard({
    this.checkInTime,
    this.checkOutTime,
    this.shiftTime,
    this.currentBalance,
    this.remainingCurrentBalance,
    this.yearlyBalance,
    this.remainingYearlyBalance,
    this.remainingWorkHours,
    this.notificationCount,
  });

  factory RemoteGetDataForDashBoard.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetDataForDashBoardFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetDataForDashBoardToJson(this);




}

extension RemoteGetDataForDashBoardExtension
on RemoteGetDataForDashBoard {
  HomeData mapToDomain() {
    return HomeData(
      checkOutTime:checkOutTime??'',
      checkInTime: checkInTime??"",
      currentBalance: currentBalance??0,
      remainingCurrentBalance: remainingCurrentBalance??0,
      remainingWorkHours:remainingWorkHours??0,
      remainingYearlyBalance: remainingYearlyBalance??0,
      shiftTime: shiftTime?? '',
      yearlyBalance: yearlyBalance??0 ,
      notificationCount: notificationCount.toString() ?? '' ,
    );
  }
}
