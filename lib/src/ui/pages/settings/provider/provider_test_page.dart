import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/remote_config.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProviderTestPage extends StatelessWidget {
  const ProviderTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.providerTestPage.getString(context)),
      ),
      body: Center(
        child: Consumer<Rmc>(
          builder: (context, Rmc rmc, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(rmc.values[Rmc.authorMessage]),
                Text(rmc.values[Rmc.json].toString()),
                Text(rmc.values[Rmc.boolTrue].toString()),
                Text(rmc.values[Rmc.doubleNum].toString()),
                Text(rmc.values[Rmc.integer].toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
