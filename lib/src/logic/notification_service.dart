import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  void removeNotifications(SafeAccount account) async {
    AwesomeNotifications().removeChannel(NotificationIds.dnesniJidloChannel(account));
    AwesomeNotifications().removeChannel(NotificationIds.objednanoChannel(account));
    AwesomeNotifications().removeChannel(NotificationIds.kreditChannel(account));
  }
}
