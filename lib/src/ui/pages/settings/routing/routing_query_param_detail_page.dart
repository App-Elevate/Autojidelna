import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_lang/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
        title: Text(Alocale.routingParamDetailPageDetail.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(Alocale.routingParamDetailPageDetail1.getString(context)),
            Text(Alocale.routingParamDetailPageDetail2.getString(context)),
            Text(context.formatString(Alocale.routingParamDetailPageDetail3, [filmid])),
          ],
        ),
      ),
    );
  }
}
