import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/app.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingTestDetailPage extends StatelessWidget {
  const RoutingTestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(App.packageInfo.appName),
      ),
      body: Center(
        child: Column(
          children: [
            Text(l10n.routingParamDetailPageDetail),
            ElevatedButton(
              onPressed: () async => context.router.push((const RoutingTestDetailDetail())),
              child: Text(l10n.routingGoToDetailDetail),
            ),
          ],
        ),
      ),
    );
  }
}
