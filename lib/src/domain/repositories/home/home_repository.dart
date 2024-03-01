import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/home/model/remote_get_gross_salary_and_currency.dart';
import 'package:talent_link/src/domain/entities/home/home_data.dart';
import 'package:talent_link/src/domain/entities/home/last_update_request.dart';
import 'package:talent_link/src/domain/entities/home/news.dart';
import 'package:talent_link/src/domain/entities/home/policies.dart';
import 'package:talent_link/src/domain/entities/home/punch.dart';

abstract class HomeRepository {
  Future<DataState<List<News>>> getNewsList();

  Future<DataState<Policies>> getPolicies({required int employeeId});

  Future<DataState<LastUpdateRequests>> getLastRequestsFroDashboard();

  Future<DataState<HomeData>> getHomeDataForDashBoard();

  Future<DataState<Punch>> insertPunch({
    required String punchTypeSystemCode,
    required String fingerPrint,
    required String latitude,
    required String longitude,
  });

  Future<DataState<RemoteGetGrossSalaryAndCurrency>>
      getGrossSalaryAndCurrency();
}
