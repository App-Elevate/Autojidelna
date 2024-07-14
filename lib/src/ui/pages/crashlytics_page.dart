import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:coree/src/crash_testing/crash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class CrashlyticsPage extends StatelessWidget {
  const CrashlyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Alocale.crashlyticsPage.getString(context),
          ),
          TextButton(onPressed: crashlyticsTestFunction, child: Text(Alocale.crashlyticsTestCrash.getString(context))),
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
