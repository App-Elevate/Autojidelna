import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/theme.provider.dart';
import 'package:autojidelna/src/_sentry/sentry.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/logic/deep_link_transformer_logic.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
    if (Texts.supportedLocales.contains(App.currentLocale)) {
      if (_locale == null) unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, App.currentLocale.languageCode));
      _locale ??= App.currentLocale;
    } else {
      if (_locale == null) unawaited(Hive.box(Boxes.settings).put(HiveKeys.locale, App.defaultLocale.languageCode));
      _locale ??= App.defaultLocale;
      if (_locale == null) App.currentLocale = App.defaultLocale;
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
    return Consumer<ThemeProvider>(
      builder: (context, theme, ___) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: theme.themeMode,
          theme: AppThemes.theme.copyWith(colorScheme: theme.colorScheme),
          darkTheme: AppThemes.theme.copyWith(colorScheme: theme.colorScheme),
          locale: _locale,
          supportedLocales: Texts.supportedLocales,
          localizationsDelegates: Texts.localizationsDelegates,
          routerConfig: _appRouter.config(
            includePrefixMatches: true,
            navigatorObservers: () => [SentryNavigatorObserver(), SentryTabObserver()],
            deepLinkTransformer: (uri) async => deepLinkTransformer(uri),
          ),
        );
      },
    );
  }
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: App.remoteConfigProvider),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    );
  }
}
