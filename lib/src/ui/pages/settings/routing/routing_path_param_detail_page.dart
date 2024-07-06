import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class RoutingPathParamDetailPage extends StatelessWidget {
  const RoutingPathParamDetailPage({super.key, @PathParam() required this.filmid});
  final String filmid;

  @override
  Widget build(BuildContext context) {
    final int? filmId = int.tryParse(filmid);
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.routingParamDetailPageDetail.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(Alocale.routingParamDetailPageDetail1.getString(context)),
            Text(Alocale.routingParamDetailPageDetail2.getString(context)),
            Text(context.formatString(Alocale.routingParamDetailPageDetail3, [filmId])),
          ],
        ),
      ),
    );
  }
}
