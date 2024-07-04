import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/package_info.dart';
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
      body: const Center(
        child: Text('This is a routing test detail page.'),
      ),
    );
  }
}
