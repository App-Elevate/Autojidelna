import 'package:auto_route/auto_route.dart';
import 'package:coree/src/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingParamPage extends StatelessWidget {
  const RoutingParamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Param Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is a routing param page.'),
            const Text('It is used to test routing with parameters.'),
            Form(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Query param Film ID'),
                onFieldSubmitted: (String value) async => context.router.push(RoutingQueryParamDetailPage(filmid: int.tryParse(value))),
              ),
            ),
            Form(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Path param Film ID'),
                onFieldSubmitted: (String value) async => context.router.push(RoutingPathParamDetailPage(filmid: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
