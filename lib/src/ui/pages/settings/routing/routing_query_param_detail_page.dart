import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
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
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.routingParamDetailPageDetail),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(lang.routingParamDetailPageDetail1),
            Text(lang.routingParamDetailPageDetail2),
            Text(lang.routingParamDetailPageDetail3(filmid.toString())),
          ],
        ),
      ),
    );
  }
}
