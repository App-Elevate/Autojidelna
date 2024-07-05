import 'package:auto_route/auto_route.dart';
import 'package:coree/src/global/package_info.dart';
import 'package:coree/src/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingTestDetailPage extends StatelessWidget {
  const RoutingTestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(App.packageInfo.appName),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is a routing test detail page.'),
            ElevatedButton(
              onPressed: () async {
                await context.router.push((const RoutingTestDetailDetail()));
              },
              child: const Text('Go to Detail Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
