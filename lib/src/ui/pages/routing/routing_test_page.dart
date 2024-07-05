import 'package:auto_route/auto_route.dart';
import 'package:coree/src/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingTestPage extends StatelessWidget {
  const RoutingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Test Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is a routing test page.'),
            const Text('It is used to test routing.'),
            ElevatedButton(
              onPressed: () async {
                context.router.push(const RoutingTestDetailPage());
              },
              child: const Text('Go to Detail Page'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.router.push(const RoutingParamPage());
              },
              child: const Text('Go to Param Page'),
            ),
          ],
        ),
      ),
    );
  }
}
