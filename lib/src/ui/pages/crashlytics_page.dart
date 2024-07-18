import 'package:auto_route/auto_route.dart';
import 'package:coree/src/crash_testing/crash.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class CrashlyticsPage extends StatelessWidget {
  const CrashlyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(l10n.crashlyticsPage),
          TextButton(onPressed: crashlyticsTestFunction, child: Text(l10n.crashlyticsTestCrash)),
          TextButton(
            onPressed: () async {
              if (await Permission.location.request() == PermissionStatus.granted) {
                debugPrint('Permission granted');
              } else {
                debugPrint('Permission denied');
              }
            },
            child: const Text('Get Location test'),
          ),
        ],
      ),
    );
  }
}
