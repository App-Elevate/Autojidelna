import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_conf/hive.dart';
import 'package:coree/src/_conf/messaging.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/_global/providers/is_online.dart';
import 'package:coree/src/_global/providers/remote_config.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.dart';
import 'package:coree/src/logic/deep_link_transformer_logic.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  Locale? _locale;

  bool isRouteValid(String routeName) {
    final uri = Uri.parse(routeName);
    final baseRoute = uri.path;
    final routes = _appRouter.routes;
    return routes.any((route) {
      // Convert the route pattern to a regex pattern
      final regexPattern = RegExp('^${route.path.replaceAllMapped(RegExp(r':\w+'), (match) => r'[^/]+')}\$');
      return regexPattern.hasMatch(baseRoute);
    });
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data[MessagingConf.dataPushRoute] != null && isRouteValid(message.data[MessagingConf.dataPushRoute]!)) {
      final routeName = message.data[MessagingConf.dataPushRoute]!;
      final uri = Uri.parse(routeName);
      final route = uri.path + (uri.hasQuery ? '?${uri.query}' : '');
      unawaited(
        context.router.pushNamed(route),
      );
    }
  }

  @override
  void initState() {
    initLocale();
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    super.initState();
  }

  void initLocale() {
    if (Texts.supportedLocales.contains(App.currentLocale)) {
      if (_locale == null) unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, App.currentLocale.languageCode));
      _locale ??= App.currentLocale;
    } else {
      if (_locale == null) unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, App.defaultLocale.languageCode));
      _locale ??= App.defaultLocale;
    }
    App.translate = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    locale ??= App.defaultLocale;
    unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, locale.languageCode));
    App.currentLocale = locale;
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: Texts.supportedLocales,
      localizationsDelegates: Texts.localizationsDelegates,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        includePrefixMatches: true,
        deepLinkTransformer: (uri) async => deepLinkTransformer(uri),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => IsOnline(), lazy: false),
          ChangeNotifierProvider(create: (context) => Rmc(), lazy: false),
        ],
        child: const MyApp(),
      ),
    );
  }
}
