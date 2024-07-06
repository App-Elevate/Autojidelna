import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class RoutingTestPage extends StatelessWidget {
  const RoutingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.routingTestPage.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(Alocale.routingTestPageDetail.getString(context)),
            Text(Alocale.routingTestPageDetail1.getString(context)),
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingTestDetailPage()),
              child: Text(Alocale.routingGoToDetailPage.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingParamPage()),
              child: Text(Alocale.routingGoToParamDetailPage.getString(context)),
            ),
          ],
        ),
      ),
    );
  }
}
