import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutingPathParamDetailPage extends StatelessWidget {
  const RoutingPathParamDetailPage({super.key, @PathParam() required this.filmid});
  final String filmid;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final int? filmId = int.tryParse(filmid);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.routingParamDetailPageDetail),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(l10n.routingParamDetailPageDetail1),
            Text(l10n.routingParamDetailPageDetail2),
            Text(l10n.routingParamDetailPageDetail3(filmId!)),
          ],
        ),
      ),
    );
  }
}
