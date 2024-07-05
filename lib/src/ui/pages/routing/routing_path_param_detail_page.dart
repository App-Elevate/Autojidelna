import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingPathParamDetailPage extends StatelessWidget {
  const RoutingPathParamDetailPage({super.key, @PathParam() required this.filmid});
  final String filmid;

  @override
  Widget build(BuildContext context) {
    final int? filmId = int.tryParse(filmid);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Param Detail Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is a routing param detail page.'),
            const Text('It is used to test routing with parameters.'),
            Text('Film ID: $filmId'),
          ],
        ),
      ),
    );
  }
}
