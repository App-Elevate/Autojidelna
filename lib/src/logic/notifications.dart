// File containing all code for notifications. This includes background fetch and awesome notifications.

import 'package:autojidelna/src/_conf/dates.dart';
import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_conf/notifications.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/lang/supported_locales.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:background_fetch/background_fetch.dart';

import 'package:canteenlib/canteenlib.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// Platform messages are asynchronous, so we initialize in an async method.
Future<void> initPlatformState() async {
  // Configure BackgroundFetch.
  await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 120,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        startOnBoot: true,
        requiredNetworkType: NetworkType.ANY,
      ), (String taskId) async {
    // <-- Event handler
    // This is the fetch-event callback.
    if (kDebugMode) {
      print('[BackgroundFetch] Event received $taskId');
    }
    // IMPORTANT:  You must signal completion of your task or the OS can punish your app
    // for taking too long in the background.
    await doNotifications();
    BackgroundFetch.finish(taskId);
  }, (String taskId) async {
    // <-- Task timeout handler.
    // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
    if (kDebugMode) {
      print('[BackgroundFetch] TASK TIMEOUT taskId: $taskId');
    }
    BackgroundFetch.finish(taskId);
  });

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
}

// [Android-only] This "Headless Task" is run when the Android app is terminated with `enableHeadless: true`
// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    if (kDebugMode) {
      print('[BackgroundFetch] Headless task timed-out: $taskId');
    }
    BackgroundFetch.finish(taskId);
    return;
  }
  if (kDebugMode) {
    print('[BackgroundFetch] Headless event received.');
  }
  await doNotifications();
  BackgroundFetch.finish(taskId);
}

Future<bool> initAwesome() async {
  LoggedAccounts loginData = await loggedInCanteen.getLoginDataFromSecureStorage();
  List<NotificationChannelGroup> notificationChannelGroups = [];
  List<NotificationChannel> notificationChannels = [];
  for (int i = 0; i < loginData.users.length; i++) {
    Account user = loginData.users[i];
    notificationChannelGroups.add(
      NotificationChannelGroup(
        channelGroupKey: NotificationIds.channelGroup(user.username, user.url),
        channelGroupName: NotificationsTexts.notificationsFor(user.username),
      ),
    );
    notificationChannels.add(
      NotificationChannel(
        channelGroupKey: NotificationIds.channelGroup(user.username, user.url),
        channelKey: NotificationIds.dnesniJidloChannel(user.username, user.url),
        channelName: NotificationsTexts.jidloChannelName,
        channelShowBadge: true,
        channelDescription: NotificationsTexts.jidloChannelDescription(user.username),
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    );
    notificationChannels.add(
      NotificationChannel(
        channelGroupKey: NotificationIds.channelGroup(user.username, user.url),
        channelKey: NotificationIds.kreditChannel(user.username, user.url),
        channelName: NotificationsTexts.dochazejiciKreditChannelName,
        channelShowBadge: true,
        channelDescription: NotificationsTexts.dochazejiciKreditChannelDescription(user.username),
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    );
    notificationChannels.add(
      NotificationChannel(
        channelGroupKey: NotificationIds.channelGroup(user.username, user.url),
        channelKey: NotificationIds.objednanoChannel(user.username, user.url),
        channelName: NotificationsTexts.objednanoChannelName,
        channelShowBadge: true,
        channelDescription: NotificationsTexts.objednanoChannelDescription(user.username),
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    );
  }
  notificationChannelGroups.add(
    NotificationChannelGroup(
      channelGroupKey: NotificationIds.channelGroupElse,
      channelGroupName: NotificationsTexts.notificationOther,
    ),
  );
  notificationChannels.add(
    NotificationChannel(
      channelGroupKey: NotificationIds.channelGroupElse,
      channelKey: NotificationIds.channelElse,
      channelName: NotificationsTexts.notificationOther,
      channelDescription: NotificationsTexts.notificationOtherDescription,
      importance: NotificationImportance.Min,
      playSound: false,
    ),
  );
  return await AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,

    notificationChannels,

    channelGroups: notificationChannelGroups,
    // Channel groups are only visual and are not required
    debug: false,
  );
}

Future<void> doNotifications({bool force = false}) async {
  //TODO: add more langueages
  final lang = lookupTexts(Locales.cs);
  LoggedInCanteen loggedInCanteen = LoggedInCanteen();
  LoggedAccounts loginData = await loggedInCanteen.getLoginDataFromSecureStorage();
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 588,
      locked: true,
      channelKey: NotificationIds.channelElse,
      actionType: ActionType.Default,
      title: lang.gettingDataNotifications,
    ),
  );
  // Don't send notifications before 9 and after 22
  for (int i = 0; i < loginData.users.length && !((DateTime.now().hour < 9 || DateTime.now().hour > 22) && !force); i++) {
    //ensuring we only send the notifications once a day
    bool jidloDne = true;
    bool kredit = true;
    bool objednavka = true;
    DateTime now = DateTime.now();
    String nowString = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    TimeOfDay timeOfDay = const TimeOfDay(hour: 11, minute: 0);
    DateTime time = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    int difference = time.difference(now).inMinutes;

    Box box = Hive.box(Boxes.notifications);
    //difference from time of day to now
    box.get(HiveKeys.lastNotificationCheck(loginData.users[i].username, loginData.users[i].url));
    if ((box.get(HiveKeys.lastNotificationCheck(loginData.users[i].username, loginData.users[i].url)) == nowString ||
            box.get(HiveKeys.dailyFoodInfo(loginData.users[i].username, loginData.users[i].url)) != '1' ||
            difference > 120 ||
            difference < -120) &&
        !force) {
      jidloDne = false;
    } else {
      box.put(HiveKeys.lastJidloDneCheck(loginData.users[i].username, loginData.users[i].url), nowString);
    }

    if (box.get(HiveKeys.lastNotificationCheck(loginData.users[i].username, loginData.users[i].url)) == nowString && !force) {
      kredit = false;
      objednavka = false;
    }

    /*
    if (kDebugMode) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: -1,
        channelKey: 'else_channel',
        actionType: ActionType.Default,
        title: 'Notifikace Info',
        body: 'jidloDne: $jidloDne, kredit: $kredit, objednavka: $objednavka',
      ));
    }*/
    if (!jidloDne && !kredit && !objednavka) {
      continue;
    }

    box.put(HiveKeys.lastNotificationCheck(loginData.users[i].username, loginData.users[i].url), nowString);

    try {
      await loggedInCanteen.changeAccount(i, saveToStorage: false);
      if (jidloDne || force) {
        Jidelnicek jidelnicek = await loggedInCanteen.getLunchesForDay(now);
        if (jidelnicek.jidla.isNotEmpty) {
          for (int k = 0; k < jidelnicek.jidla.length; k++) {
            if (!jidelnicek.jidla[k].objednano) {
              continue;
            }
            if (difference > 0) {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1024 - i,
                  channelKey: NotificationIds.dnesniJidloChannel(loginData.users[i].username, loginData.users[i].url),
                  actionType: ActionType.Default,
                  title: NotificationsTexts.jidloChannelName,
                  payload: {
                    NotificationIds.payloadUser: loginData.users[i].username,
                    NotificationIds.payloadIndex: k.toString(),
                    NotificationIds.payloadIndexDne: jidelnicek.den.difference(Dates.minimalDate).inDays.toString(),
                  },
                  body: jidelnicek.jidla[0].nazev,
                ),
                schedule: NotificationCalendar.fromDate(date: time),
              );
              break;
            }
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 1024 - i,
                channelKey: NotificationIds.dnesniJidloChannel(loginData.users[i].username, loginData.users[i].url),
                actionType: ActionType.Default,
                title: NotificationsTexts.jidloChannelName,
                payload: {
                  NotificationIds.payloadUser: loginData.users[i].username,
                  NotificationIds.payloadIndex: k.toString(),
                  NotificationIds.payloadIndexDne: jidelnicek.den.difference(Dates.minimalDate).inDays.toString(),
                },
                body: jidelnicek.jidla[k].kategorizovano?.hlavniJidlo ?? jidelnicek.jidla[k].nazev,
              ),
            );
            break;
          }
        } else if (kDebugMode) {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1024,
              channelKey: NotificationIds.dnesniJidloChannel(loginData.users[i].username, loginData.users[i].url),
              actionType: ActionType.Default,
              title: NotificationsTexts.jidloChannelName,
              payload: {
                NotificationIds.payloadUser: loginData.users[i].username,
              },
              body: lang.noFood,
            ),
          );
        } else {
          AwesomeNotifications().cancel(1024);
        }
      }
      Uzivatel uzivatel = (await loggedInCanteen.canteenData).uzivatel;
      //7 is limit for how many lunches we are gonna search for
      int objednano = 0;
      int cena = 0;
      List<Future<Jidelnicek>> jidelnickyFuture = [];
      for (int i = 0; i < 10; i++) {
        jidelnickyFuture.add(loggedInCanteen.getLunchesForDay(DateTime.now().add(Duration(days: i))));
      }
      await Future.wait(jidelnickyFuture);
      for (int denIndex = 0; denIndex < 10; denIndex++) {
        Jidelnicek jidelnicek = await loggedInCanteen.getLunchesForDay(DateTime.now().add(Duration(days: denIndex)));
        //pokud nalezneme jídlo s cenou
        if (jidelnicek.jidla.isNotEmpty && !(jidelnicek.jidla[0].cena?.isNaN ?? true)) {
          cena += jidelnicek.jidla[0].cena!.toInt();
        }
        if (jidelnicek.jidla.isEmpty) {
          objednano++;
          continue;
        }
        for (int jidloIndex = 0; jidloIndex < jidelnicek.jidla.length; jidloIndex++) {
          if (jidelnicek.jidla[jidloIndex].objednano) {
            objednano++;
          }
        }
      }
      //parse ignore date to DateTime
      String? ignoreDateStr = box.get(HiveKeys.kreditNotifications(loginData.users[i].username, loginData.users[i].url));
      DateTime ignoreDate;
      switch (ignoreDateStr) {
        //not ignored
        case '':
        case null:
          ignoreDate = DateTime.now().subtract(const Duration(days: 2));
          break;
        //ignored forewer
        case '1':
          ignoreDate = DateTime.now().add(const Duration(days: 1));
          break;
        //ignored for a week
        default:
          ignoreDate = DateTime.parse(ignoreDateStr);
          break;
      }
      if (force || (cena != 0 && uzivatel.kredit < cena && kredit && ignoreDate.isBefore(DateTime.now()))) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 512 - i,
            channelKey: NotificationIds.kreditChannel(loginData.users[i].username, loginData.users[i].url),
            actionType: ActionType.Default,
            title: NotificationsTexts.notificationDochaziVamKredit,
            payload: {NotificationIds.payloadUser: loginData.users[i].username},
            body: NotificationsTexts.notificationKreditPro(
              uzivatel.jmeno ?? '',
              uzivatel.prijmeni ?? uzivatel.uzivatelskeJmeno ?? '',
              uzivatel.kredit.toInt(),
            ),
          ),
          actionButtons: [
            NotificationActionButton(
              key: NotificationIds.kreditChannel(loginData.users[i].username, loginData.users[i].url),
              label: NotificationsTexts.notificationZtlumit,
              actionType: ActionType.Default,
              enabled: true,
            ),
          ],
        );
      }
      //pokud chybí aspoň 3 obědy z příštích 10 dní
      //parse ignore date to DateTime
      String? ignoreDateStrObjednano = box.get(HiveKeys.nemateObjednanoNotifications(loginData.users[i].username, loginData.users[i].url));
      DateTime ignoreDateObjednano;
      switch (ignoreDateStrObjednano) {
        //not ignored
        case '':
        case null:
          ignoreDateObjednano = DateTime.now().subtract(const Duration(days: 2));
          break;
        //ignored forewer
        case '1':
          ignoreDateObjednano = DateTime.now().add(const Duration(days: 1));
          break;
        //ignored for a week
        default:
          ignoreDateObjednano = DateTime.parse(ignoreDateStrObjednano);
          break;
      }
      if (force || (objednano <= 7 && objednavka && ignoreDateObjednano.isBefore(DateTime.now()))) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: i,
            channelKey: NotificationIds.objednanoChannel(loginData.users[i].username, loginData.users[i].url),
            actionType: ActionType.Default,
            title: NotificationsTexts.notificationObjednejteSi,
            payload: {NotificationIds.payloadUser: loginData.users[i].username},
            body: NotificationsTexts.notificationObjednejteSiDetail(uzivatel.jmeno ?? '', uzivatel.prijmeni ?? uzivatel.uzivatelskeJmeno ?? ''),
          ),
          actionButtons: [
            NotificationActionButton(
              key: NotificationIds.objednatButton(loginData.users[i].username, loginData.users[i].url),
              label: NotificationsTexts.objednatAction,
              isDangerousOption: false,
              actionType: ActionType.Default,
              enabled: true,
            ),
            NotificationActionButton(
              key: NotificationIds.objednanoChannel(loginData.users[i].username, loginData.users[i].url),
              label: NotificationsTexts.notificationZtlumit,
              actionType: ActionType.Default,
              enabled: true,
            ),
          ],
        );
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 5));
      AwesomeNotifications().cancel(588);
      if (kDebugMode) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 10,
            channelKey: NotificationIds.channelElse,
            actionType: ActionType.Default,
            title: NotificationsTexts.nastalaChyba,
            body: e.toString(),
          ),
        );
      }
    }
  }
  await Future.delayed(const Duration(seconds: 5));
  AwesomeNotifications().cancel(588);
  return;
}

class NotificationController {
  @pragma('vm:entry-point')
  static Future<void> handleNotificationAction(ReceivedAction? receivedAction) async {
    //tlačítka ztlumení a objednání prvního oběda
    if (receivedAction?.buttonKeyPressed != null && receivedAction?.buttonKeyPressed != '') {
      if (receivedAction!.buttonKeyPressed.substring(0, 16) == HiveKeys.onlyNemateObjednanoNotifications) {
        DateTime dateTillIgnore = DateTime.now().add(const Duration(days: 7));
        Hive.box(Boxes.notifications).put(
          receivedAction.buttonKeyPressed,
          '${dateTillIgnore.year}-${dateTillIgnore.month.toString().padLeft(2, '0')}-${dateTillIgnore.day.toString().padLeft(2, '0')}',
        );
      } else if (receivedAction.buttonKeyPressed.substring(0, 14) == HiveKeys.onlykreditNotifications) {
        DateTime dateTillIgnore = DateTime.now().add(const Duration(days: 7));
        Hive.box(Boxes.notifications).put(
          receivedAction.buttonKeyPressed,
          '${dateTillIgnore.year}-${dateTillIgnore.month.toString().padLeft(2, '0')}-${dateTillIgnore.day.toString().padLeft(2, '0')}',
        );
      } else if (receivedAction.buttonKeyPressed.substring(0, 9) == NotificationIds.onlyObjednatButton) {
        String username = receivedAction.buttonKeyPressed.substring(9).split('_')[0];
        LoggedInCanteen tempLoggedInCanteen = LoggedInCanteen();
        if (loggedInCanteen.uzivatel != null && loggedInCanteen.uzivatel?.uzivatelskeJmeno == username) {
          tempLoggedInCanteen = loggedInCanteen;
        }
        await tempLoggedInCanteen.quickOrder(receivedAction.buttonKeyPressed.substring(9).split('_')[0]);
      }
    }
    //přepnutí účtu, když uživatel klikne na notifikaci
    if (receivedAction?.payload?[NotificationIds.payloadUser] != null) {
      LoggedAccounts loginData = await loggedInCanteen.getLoginDataFromSecureStorage();
      for (Account uzivatel in loginData.users) {
        if (uzivatel.username == receivedAction?.payload?[NotificationIds.payloadUser]) {
          await loggedInCanteen.switchAccount(loginData.users.indexOf(uzivatel));
          break;
        }
      }
    }
    /*
    if (receivedAction?.payload?[NotificationIds.payloadIndex] != null) {
      indexJidlaKtereMaBytZobrazeno = int.parse(receivedAction!.payload![NotificationIds.payloadIndex]!);
      indexJidlaCoMaBytZobrazeno = int.parse(receivedAction.payload![NotificationIds.payloadIndexDne]!);
    }
    */
    //TODO: přidat, aby vás to hodilo na jídlo, na které jste klikli
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma('vm:entry-point')
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma('vm:entry-point')
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {}

  /// This method is used to detect when an action button or notification is pressed when the application is open.
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    handleNotificationAction(receivedAction);
  }
}
