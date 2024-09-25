import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingPathParamDetailPage extends StatelessWidget {
  const RoutingPathParamDetailPage({super.key, @PathParam() required this.filmid});
  final String filmid;

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    final int? filmId = int.tryParse(filmid);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.routingParamDetailPageDetail),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(lang.routingParamDetailPageDetail1),
            Text(lang.routingParamDetailPageDetail2),
            Text(lang.routingParamDetailPageDetail3(filmId.toString())),
          ],
        ),
      ),
    );
  }
}
