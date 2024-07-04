import 'package:auto_route/auto_route.dart';
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
      body: const Center(
        child: Text('This is a routing test detail detail page.'),
      ),
    );
  }
}
