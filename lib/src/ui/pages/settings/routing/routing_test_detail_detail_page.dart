import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingTestDetailDetail extends StatelessWidget {
  const RoutingTestDetailDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.routingTestDetailDetail),
      ),
      body: Center(
        child: Column(
          children: [
            Text(lang.routingTestDetailDetailText),
            ElevatedButton(
              onPressed: () async => await context.router.navigate(const CrashlyticsPage()),
              child: Text(lang.goBack),
            ),
          ],
        ),
      ),
    );
  }
}
