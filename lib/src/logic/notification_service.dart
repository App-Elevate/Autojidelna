import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  void removeNotifications(SafeAccount account) async {
    AwesomeNotifications().removeChannel(NotificationIds.dnesniJidloChannel(account));
    AwesomeNotifications().removeChannel(NotificationIds.objednanoChannel(account));
    AwesomeNotifications().removeChannel(NotificationIds.kreditChannel(account));
  }

  Future<bool> initAwesome() async {
    List<SafeAccount> limitedAccounts = await AuthService().getLimitedAccounts();

    // Generate notification channel groups
    List<NotificationChannelGroup> notificationChannelGroups = [
      ...limitedAccounts.expand((account) => _createNotificationChannelGroups(account)),
      NotificationChannelGroup(
        channelGroupKey: NotificationIds.channelGroupElse,
        channelGroupName: NotificationsTexts.notificationOther,
      ),
    ];

    // Generate notification channels
    List<NotificationChannel> notificationChannels = [
      ...limitedAccounts.expand((account) => _createNotificationChannels(account)),
      NotificationChannel(
        channelGroupKey: NotificationIds.channelGroupElse,
        channelKey: NotificationIds.channelElse,
        channelName: NotificationsTexts.notificationOther,
        channelDescription: NotificationsTexts.notificationOtherDescription,
        importance: NotificationImportance.Min,
        playSound: false,
      ),
    ];

    return await AwesomeNotifications().initialize(
      null, // Use default app icon
      notificationChannels,
      channelGroups: notificationChannelGroups,
      debug: false,
    );
  }

  List<NotificationChannelGroup> _createNotificationChannelGroups(SafeAccount account) {
    return [_createChannelGroup(NotificationIds.channelGroup(account), NotificationsTexts.notificationsFor(account.username))];
  }

  List<NotificationChannel> _createNotificationChannels(SafeAccount account) {
    return [
      _createChannel(
        NotificationIds.channelGroup(account),
        NotificationIds.dnesniJidloChannel(account),
        NotificationsTexts.jidloChannelName,
        NotificationsTexts.jidloChannelDescription(account.username),
      ),
      _createChannel(
        NotificationIds.channelGroup(account),
        NotificationIds.kreditChannel(account),
        NotificationsTexts.dochazejiciKreditChannelName,
        NotificationsTexts.dochazejiciKreditChannelDescription(account.username),
      ),
      _createChannel(
        NotificationIds.channelGroup(account),
        NotificationIds.objednanoChannel(account),
        NotificationsTexts.objednanoChannelName,
        NotificationsTexts.objednanoChannelDescription(account.username),
      ),
    ];
  }

  NotificationChannelGroup _createChannelGroup(String key, String name) {
    return NotificationChannelGroup(channelGroupKey: key, channelGroupName: name);
  }

  NotificationChannel _createChannel(String groupKey, String key, String name, String description) {
    return NotificationChannel(
      channelShowBadge: true,
      channelGroupKey: groupKey,
      channelKey: key,
      channelName: name,
      channelDescription: description,
      defaultColor: const Color(0xFF9D50DD),
      ledColor: Colors.white,
    );
  }
}
