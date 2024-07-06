import 'dart:async';

import 'package:coree/src/_global/package_info.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:coree/src/_routing/app_router.dart';
import 'package:coree/src/logic/deep_link_transformer_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
    //final deviceLocale = PlatformDispatcher.instance.locale.languageCode;
    _locale = App.localization.currentLocale;
    unawaited(
      App.localization.init(
        mapLocales: [
          const MapLocale('en', Alocale.en),
          const MapLocale('cs', Alocale.cs),
        ],
        initLanguageCode: _locale?.languageCode ?? 'en',
      ),
    );
    App.localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: App.localization.supportedLocales,
      localizationsDelegates: App.localization.localizationsDelegates,
      locale: _locale,
      title: 'APPE Coree',
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
