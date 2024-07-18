import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingParamPage extends StatelessWidget {
  const RoutingParamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.routingParamPage),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(lang.routingParamPageDetail),
            Text(lang.routingParamPageDetail2),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: lang.routingParamQueryFilmId),
                onFieldSubmitted: (String value) async => context.router.push(RoutingQueryParamDetailPage(filmid: int.tryParse(value))),
              ),
            ),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: lang.routingParamFilmId),
                onFieldSubmitted: (String value) async => context.router.push(RoutingPathParamDetailPage(filmid: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
