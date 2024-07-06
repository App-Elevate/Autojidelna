import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class RoutingParamPage extends StatelessWidget {
  const RoutingParamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.routingParamPage.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(Alocale.routingParamPageDetail.getString(context)),
            Text(Alocale.routingParamPageDetail2.getString(context)),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: Alocale.routingParamQueryFilmId.getString(context)),
                onFieldSubmitted: (String value) async => context.router.push(RoutingQueryParamDetailPage(filmid: int.tryParse(value))),
              ),
            ),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: Alocale.routingParamFilmId.getString(context)),
                onFieldSubmitted: (String value) async => context.router.push(RoutingPathParamDetailPage(filmid: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
