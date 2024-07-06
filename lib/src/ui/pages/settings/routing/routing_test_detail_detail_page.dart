import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class RoutingTestDetailDetail extends StatelessWidget {
  const RoutingTestDetailDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.routingTestDetailDetail.getString(context)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Alocale.routingTestDetailDetailText.getString(context)),
            ElevatedButton(
              onPressed: () async => await context.router.navigate(const CrashlyticsPage()),
              child: Text(Alocale.goBack.getString(context)),
            ),
          ],
        ),
      ),
    );
  }
}
