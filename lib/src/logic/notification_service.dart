import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  void removeNotifications(Account account) async {
    AwesomeNotifications().removeChannel(NotificationIds.dnesniJidloChannel(account.username, account.url));
    AwesomeNotifications().removeChannel(NotificationIds.objednanoChannel(account.username, account.url));
    AwesomeNotifications().removeChannel(NotificationIds.kreditChannel(account.username, account.url));
  }
}
