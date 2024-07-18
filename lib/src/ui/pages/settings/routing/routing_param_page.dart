import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingParamPage extends StatelessWidget {
  const RoutingParamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.routingParamPage),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(l10n.routingParamPageDetail),
            Text(l10n.routingParamPageDetail2),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: l10n.routingParamQueryFilmId),
                onFieldSubmitted: (String value) async => context.router.push(RoutingQueryParamDetailPage(filmid: int.tryParse(value))),
              ),
            ),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: l10n.routingParamFilmId),
                onFieldSubmitted: (String value) async => context.router.push(RoutingPathParamDetailPage(filmid: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
