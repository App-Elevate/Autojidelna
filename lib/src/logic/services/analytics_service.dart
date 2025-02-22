import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:hive/hive.dart';

// TODO
class AnalyticsService {
  void addStatistic(StatisticType type) async {
    Box box = Hive.box(Boxes.analytics);

    switch (type) {
      //default case
      case StatisticType.order:
        int pocetStatistiky = box.get(HiveKeys.analytics.statistikaObjednavka, defaultValue: 0);
        pocetStatistiky++;
        if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: 'objednavka', parameters: {'pocet': pocetStatistiky});

        box.put(HiveKeys.analytics.statistikaObjednavka, pocetStatistiky);
        break;
      case StatisticType.auto:
        int pocetStatistiky = box.get(HiveKeys.analytics.statistikaAuto, defaultValue: 0);
        pocetStatistiky++;
        box.put(HiveKeys.analytics.statistikaAuto, pocetStatistiky);
        break;
      case StatisticType.burzaCatcher:
        int pocetStatistiky = box.get(HiveKeys.analytics.statistikaBurzaCatcher, defaultValue: 0);
        pocetStatistiky++;
        box.put(HiveKeys.analytics.statistikaBurzaCatcher, pocetStatistiky);
        break;
    }
  }
}

enum StatisticType {
  order,
  auto,
  burzaCatcher,
}
