import 'dart:async';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/analytics.provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/_global/providers/theme.provider.dart';
import 'package:autojidelna/src/_sentry/sentry.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/logic/services/auth_service.dart';
import 'package:autojidelna/src/logic/deep_link_transformer_logic.dart';
import 'package:autojidelna/src/logic/services/canteen_service.dart';
import 'package:autojidelna/src/types/app_context.dart';
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
  Locale? _locale;

  @override
  void initState() {
    initLocale();
    super.initState();
  }

  void initLocale() {
    if (Texts.supportedLocales.contains(App.currentLocale)) {
      if (_locale == null) unawaited(Hive.box(Boxes.appState).put(HiveKeys.appState.locale, App.currentLocale.languageCode));
      _locale ??= App.currentLocale;
    } else {
      if (_locale == null) unawaited(Hive.box(Boxes.appState).put(HiveKeys.appState.locale, App.defaultLocale.languageCode));
      _locale ??= App.defaultLocale;
      if (_locale == null) App.currentLocale = App.defaultLocale;
    }
    App.translate = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    locale ??= App.defaultLocale;
    unawaited(Hive.box(Boxes.appState).put(HiveKeys.appState.locale, locale.languageCode));
    App.currentLocale = locale;
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = App.getIt<AppRouter>();
    return Consumer<ThemeProvider>(
      builder: (context, theme, ___) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: theme.themeMode,
          theme: AppThemes.theme(theme.colorSchemeLight(theme.themeStyle)),
          darkTheme: AppThemes.theme(theme.colorSchemeDark(theme.themeStyle), amoledMode: theme.amoledMode),
          locale: _locale,
          supportedLocales: Texts.supportedLocales,
          localizationsDelegates: Texts.localizationsDelegates,
          routerConfig: appRouter.config(
            includePrefixMatches: true,
            navigatorObservers: () => [SentryNavigatorObserver(), SentryTabObserver()],
            deepLinkTransformer: (uri) async => deepLinkTransformer(uri),
            placeholder: (context) {
              App.getIt<AppContext>().setContext(context);
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            },
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
        ChangeNotifierProvider(create: (_) => UserProvider(AuthService())),
        ChangeNotifierProvider(create: (_) => CanteenProvider(CanteenService())),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AnalyticsProvider()),
        ChangeNotifierProvider(create: (_) => Settings()),
      ],
      child: const MyApp(),
    );
  }
}
