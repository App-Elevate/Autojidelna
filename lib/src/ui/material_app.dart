import 'package:coree/src/_global/is_online.dart';
import 'package:coree/src/_global/remote_config.dart';
import 'package:coree/src/_global/translate.dart';
import 'package:coree/src/_routing/app_router.dart';
import 'package:coree/src/lang/output/texts.dart';
import 'package:coree/src/logic/deep_link_transformer_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      supportedLocales: Texts.supportedLocales,
      localizationsDelegates: Texts.localizationsDelegates,
      locale: context.watch<Translate>().currentLocale,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(
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
          ChangeNotifierProvider(create: (context) => Translate(), lazy: false),
          ChangeNotifierProvider(create: (context) => IsOnline(), lazy: false),
          ChangeNotifierProvider(create: (context) => Rmc(), lazy: false),
        ],
        child: const MyApp(),
      ),
    );
  }
}
