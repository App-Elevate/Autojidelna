import 'dart:async';

import 'package:coree/src/_conf/hive.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/_global/is_online.dart';
import 'package:coree/src/_global/remote_config.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.dart';
import 'package:coree/src/logic/deep_link_transformer_logic.dart';
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

  @override
  void initState() {
    initLocale();
    super.initState();
  }

  void initLocale() {
    if (Texts.supportedLocales.contains(App.initLocale)) {
      if (_locale == null) unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, App.initLocale.languageCode));
      _locale ??= App.initLocale;
    } else {
      if (_locale == null) unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, AppLocalizationsX.defaultLocale.languageCode));
      _locale ??= AppLocalizationsX.defaultLocale;
    }
    AppLocalizationsX.translate = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, locale?.languageCode));
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
