import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.routingParamDetailPageDetail),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(l10n.routingParamDetailPageDetail1),
            Text(l10n.routingParamDetailPageDetail2),
            Text(context.formatString(l10n.routingParamDetailPageDetail3, [filmid])),
          ],
        ),
      ),
    );
  }
}
