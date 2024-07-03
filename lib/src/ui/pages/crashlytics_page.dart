import 'package:auto_route/auto_route.dart';
import 'package:coree/src/crash_testing/crash.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CrashlyticsPage extends StatelessWidget {
  const CrashlyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Crashlytics Page',
          ),
          TextButton(onPressed: crashlyticsTestFunction, child: Text('Throw a test crash!')),
        ],
      ),
    );
  }
}
