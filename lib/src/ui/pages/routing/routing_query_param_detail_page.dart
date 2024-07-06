import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingQueryParamDetailPage extends StatelessWidget {
  const RoutingQueryParamDetailPage({
    super.key,
    @QueryParam('key') this.filmid,
  });

  final int? filmid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Param Detail Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is a routing param detail page.'),
            const Text('It is used to test routing with parameters.'),
            Text('Film ID: $filmid'),
          ],
        ),
      ),
    );
  }
}