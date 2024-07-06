import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:coree/src/crash_testing/crash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
        ],
      ),
    );
  }
}
