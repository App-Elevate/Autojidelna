import 'package:auto_route/auto_route.dart';
import 'package:coree/src/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingTestDetailDetail extends StatelessWidget {
  const RoutingTestDetailDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Test Detail Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('This is a routing test detail detail page.'),
            ElevatedButton(
              onPressed: () async {
                await context.router.navigate(const CrashlyticsPage());
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
