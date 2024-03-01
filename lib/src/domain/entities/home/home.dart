import 'package:talent_link/src/domain/entities/home/home_data.dart';
import 'package:talent_link/src/domain/entities/home/last_update_request.dart';
import 'package:talent_link/src/domain/entities/home/news.dart';
import 'package:talent_link/src/domain/entities/home/policies.dart';

class Home {
  String userName;
  List<News> news;
  Policies policies;
 LastUpdateRequests? lastUpdateRequests;
 HomeData? homeData;

  Home({
    this.userName = "",
    this.news = const [],
    this.policies = const Policies(notificationCount: 0, resetTime: ''),
    this.lastUpdateRequests,
    this.homeData,
  });
}
