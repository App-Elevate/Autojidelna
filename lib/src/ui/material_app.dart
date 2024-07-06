import 'package:coree/src/_routing/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'APPE Coree',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        includePrefixMatches: true,
        deepLinkTransformer: (uri) async {
          if (uri.path == '/' && uri.fragment.isNotEmpty) {
            return uri.replace(path: uri.path.replaceFirst('/', uri.fragment));
          }
          return uri;
        },
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
