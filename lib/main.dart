// Purpose: Main file of the app, contains the main function and the main widget of the app as well as the loading screen on startup

import 'package:autojidelna/local_imports.dart';

// Foundation for kDebugMode
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';

// Toast for exiting the app
import 'package:fluttertoast/fluttertoast.dart';

import 'package:package_info_plus/package_info_plus.dart';

// Notifications
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:background_fetch/background_fetch.dart';

void main() async {
  // Ensure that the app is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Awesome notifications initialization
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String? lastVersion = await loggedInCanteen.readData(Prefs.lastVersion);

  // Removing the already set notifications if we updated versions
  if (lastVersion != version) {
    // Set the new version
    loggedInCanteen.saveData(Prefs.lastVersion, version);

    // PREFS ID CHANGES
    await loggedInCanteen.readData(OldPrefs.theme).then((value) {
      if (value != null) {
        loggedInCanteen.saveData(Prefs.theme, value);
        loggedInCanteen.removeData(OldPrefs.theme);
      }
    });
    await loggedInCanteen.readData(OldPrefs.disableAnalytics).then((value) {
      if (value != null) {
        loggedInCanteen.saveData(Prefs.disableAnalytics, value);
        loggedInCanteen.removeData(OldPrefs.disableAnalytics);
      }
    });

    try {
      LoginDataAutojidelna loginData = await loggedInCanteen.getLoginDataFromSecureStorage();
      for (LoggedInUser uzivatel in loginData.users) {
        List<String> prefs = [
          Prefs.dailyFoodInfo,
          Prefs.foodNotifTime,
          Prefs.kreditNotifications,
          Prefs.lastJidloDneCheck,
          Prefs.lastNotificationCheck,
          Prefs.nemateObjednanoNotifications
        ];
        for (String pref in prefs) {
          await loggedInCanteen.readData(pref + uzivatel.username).then((value) {
            if (value != null) {
              loggedInCanteen.saveData('$pref${uzivatel.username}_${uzivatel.url}', value);
              loggedInCanteen.removeData(pref + uzivatel.username);
            }
          });
        }
        AwesomeNotifications().removeChannel('${NotificationIds.kreditChannel}${uzivatel.username}_${uzivatel.url}');
        await AwesomeNotifications().removeChannel('${NotificationIds.objednanoChannel}${uzivatel.username}_${uzivatel.url}');
      }
    } catch (e) {
      //do nothing
    }
    await AwesomeNotifications().dispose();
  }

  // Initialize the notifications
  initAwesome();

  // Setting listeners for when the app is running and notification button is clicked
  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod);

  // Detecting if the app was opened from a notification and handling it if it was
  ReceivedAction? receivedAction = await AwesomeNotifications().getInitialNotificationAction(removeFromActionEvents: false);
  await NotificationController.handleNotificationAction(receivedAction);

  // Initializing the background fetch
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

  // Check if user has opped out of analytics

  String? analyticsDisabled = await loggedInCanteen.readData(Prefs.disableAnalytics);

  // Know if this release is debug and disable analytics if it is
  if (kDebugMode) {
    analyticsDisabled = '1';
  }

  // Initializing firebase if analytics are not disabled
  if (analyticsDisabled != '1') {
    analyticsEnabledGlobally = true;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Setting up crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    analytics = FirebaseAnalytics.instance;
  }

  // Loading settings from preferences
  skipWeekends = await loggedInCanteen.isPrefTrue(Prefs.skipWeekends);

  // Skipping to next monday if we are currently on saturday or sunday
  // If not initializing normally
  if (skipWeekends) {
    DateTime initialDate = DateTime.now();
    while (initialDate.weekday == 6 || initialDate.weekday == 7) {
      initialDate = initialDate.add(const Duration(days: 1));
    }
    int index = initialDate.difference(minimalDate).inDays;
    pageviewController = PageController(initialPage: index);
    dateListener = ValueNotifier<DateTime>(convertIndexToDatetime(index));
  } else {
    pageviewController = PageController(initialPage: DateTime.now().difference(minimalDate).inDays);
    dateListener = ValueNotifier<DateTime>(convertIndexToDatetime(DateTime.now().difference(minimalDate).inDays));
  }

  runApp(const MyApp()); // Create an instance of MyApp and pass it to runApp.
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

// ValueNotifier for the back button

class _MyAppState extends State<MyApp> {
  // Key for the navigator
  final GlobalKey<NavigatorState> _myAppKey = GlobalKey<NavigatorState>();

  // root widget of the app
  late Widget homeWidget;

  ValueNotifier<bool> canExit = ValueNotifier<bool>(false);

  // Handling the back button on android being pressed.
  Future<bool> _backPressed(GlobalKey<NavigatorState> yourKey) async {
    if (SwitchAccountVisible().isVisible()) {
      SwitchAccountVisible().setVisible(false);
      return Future<bool>.value(false);
    }
    // Checks if current Navigator still has screens on the stack.
    // And doesn't exit the app if it does
    if (yourKey.currentState!.canPop()) {
      yourKey.currentState!.pop();
      // 'maybePop' method handles the decision of 'pop' to another WillPopScope if they exist.
      // If no other WillPopScope exists, it returns true
      return Future<bool>.value(false);
    }
    // If the current Navigator doesn't have any screens on the stack, it exits the app or shows a toast
    // setting the value to true so that the user can press the back button again and it exits this time
    canExit.value = true;
    // 5 second timer for the user to press the back button again.
    // After it expires the timer resets and user has to press back button twice again
    Future.delayed(const Duration(seconds: 5), () => canExit.value = false);
    Fluttertoast.showToast(
        msg: Texts.toastsExit.i18n(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
    return Future<bool>.value(true);
  }

  // function for replacing the route stack and setting a new widget
  void setHomeWidget(Widget widget) {
    Navigator.of(_myAppKey.currentContext!).popUntil((route) => route.isFirst);
    setState(() {
      homeWidget = widget;
    });
  }

  @override
  void initState() {
    setHomeWidgetPublic = setHomeWidget;
    // Only after at least the action method is set, the notification events are delivered
    homeWidget = LoggingInWidget(setHomeWidget: setHomeWidget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Setting the theme
    return FutureBuilder(
      future: loggedInCanteen.readListData(Prefs.theme),
      initialData: ThemeMode.system,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<String> themeSettings;
          if (snapshot.data == null) {
            loggedInCanteen.saveListData(Prefs.theme, ["0", "0", "0"]);
            themeSettings = ["0", "0", "0"];
          } else {
            themeSettings = snapshot.data as List<String>;
          }
          ThemeMode themeMode;
          ThemeStyle themeStyle;
          bool pureBlack;

          // Migration from v1.2.8 and lower
          loggedInCanteen.readData("ThemeMode").then((value) {
            if (value != null && value != "") {
              themeSettings[0] = value;
              loggedInCanteen.removeData("ThemeMode");
            }
          });

          switch (themeSettings[0]) {
            case "2":
              themeMode = ThemeMode.dark;
              break;
            case "1":
              themeMode = ThemeMode.light;
              break;
            default:
              themeMode = ThemeMode.system;
          }
          switch (themeSettings[1]) {
            case "5":
              themeStyle = ThemeStyle.crimsonEarth;
              break;
            case "4":
              themeStyle = ThemeStyle.evergreenSlate;
              break;
            case "3":
              themeStyle = ThemeStyle.rustOlive;
              break;
            case "2":
              themeStyle = ThemeStyle.blueMauve;
              break;
            case "1":
              themeStyle = ThemeStyle.plumBrown;
              break;
            default:
              themeStyle = ThemeStyle.defaultStyle;
          }
          pureBlack = themeSettings[2] == "1";
          NotifyTheme().setTheme(NotifyTheme().themeNotifier.value.copyWith(themeMode: themeMode, themeStyle: themeStyle, pureBlack: pureBlack));
        }

        LocalJsonLocalization.delegate.directories = ['assets/lang'];

        return ValueListenableBuilder(
          valueListenable: NotifyTheme().themeNotifier,
          builder: (context, themeSettings, child) {
            bool pureBlack = themeSettings.pureBlack;
            return MaterialApp(
              localizationsDelegates: [
                // delegate from flutter_localization
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,

                // delegate from localization package.
                //json-file
                LocalJsonLocalization.delegate,
                //or map
                MapLocalization.delegate,
              ],
              supportedLocales: const [
                Locale('cs', 'CZ'),
                //Locale('en', 'US'),
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                if (supportedLocales.contains(locale)) {
                  return locale;
                }
                // default language
                return const Locale('cs', 'CZ');
              },
              navigatorKey: MyApp.navigatorKey,
              debugShowCheckedModeBanner: false,
              //debugShowMaterialGrid: true,
              theme: Themes.getTheme(themeSettings.themeStyle),
              darkTheme: Themes.getTheme(themeSettings.themeStyle, isPureBlack: pureBlack),
              themeMode: themeSettings.themeMode,
              home: child,
            );
          },
          child: _pop(),
        );
      },
    );
  }

  ValueListenableBuilder _pop() {
    return ValueListenableBuilder(
      valueListenable: canExit,
      builder: (context, value, child) {
        return PopScope(
          canPop: value,
          onPopInvoked: (_) async {
            await _backPressed(_myAppKey);
          },
          child: child!,
        );
      },
      child: Navigator(
        key: _myAppKey,
        pages: [
          MaterialPage(child: homeWidget),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}

class LoggingInWidget extends StatelessWidget {
  const LoggingInWidget({
    super.key,
    required this.setHomeWidget,
    this.pageIndex = -1,
  });
  // index aktualniho dne - pro refresh button v pravo nahoře
  final int pageIndex;

  final Function(Widget widget) setHomeWidget;

  @override
  Widget build(BuildContext context) {
    // získání dat z secure storage a následné přihlášení
    return FutureBuilder(
      future: loggedInCanteen.runWithSafety(loggedInCanteen.loginFromStorage()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          if (snapshot.error == ConnectionErrors.noLogin) {
            return LoginScreen(setHomeWidget: setHomeWidget);
          }
        } else if (snapshot.connectionState == ConnectionState.done) {
          // setting the initial date
          if (pageIndex != -1) {
            Future.delayed(Duration.zero, () => changeDateTillSuccess(pageIndex));
          } else {
            setCurrentDate();
          }
          // routing to main app screen (jidelnicek)
          return MainAppScreen(setHomeWidget: setHomeWidget);
        }
        return Container(
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
