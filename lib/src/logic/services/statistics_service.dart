import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:hive/hive.dart';

class StatisticsService {
  void addStatistic(StatisticType type) async {
    Box box = Hive.box(Boxes.statistics);

    switch (type) {
      //default case
      case StatisticType.order:
        int pocetStatistiky = box.get(HiveKeys.statistikaObjednavka, defaultValue: 0);
        pocetStatistiky++;
        if (analyticsEnabledGlobally && analytics != null) analytics!.logEvent(name: 'objednavka', parameters: {'pocet': pocetStatistiky});

        box.put(HiveKeys.statistikaObjednavka, pocetStatistiky);
        break;
      case StatisticType.auto:
        int pocetStatistiky = box.get(HiveKeys.statistikaAuto, defaultValue: 0);
        pocetStatistiky++;
        box.put(HiveKeys.statistikaAuto, pocetStatistiky);
        break;
      case StatisticType.burzaCatcher:
        int pocetStatistiky = box.get(HiveKeys.statistikaBurzaCatcher, defaultValue: 0);
        pocetStatistiky++;
        box.put(HiveKeys.statistikaBurzaCatcher, pocetStatistiky);
        break;
    }
  }
}

enum StatisticType {
  order,
  auto,
  burzaCatcher,
}
