import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/package_info.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
            Text(Alocale.routingParamDetailPageDetail.getString(context)),
            ElevatedButton(
              onPressed: () async => context.router.push((const RoutingTestDetailDetail())),
              child: Text(Alocale.routingGoToDetailDetail.getString(context)),
            ),
          ],
        ),
      ),
    );
  }
}
