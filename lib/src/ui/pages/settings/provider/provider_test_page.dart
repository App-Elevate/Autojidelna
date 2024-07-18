import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/providers/remote_config.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProviderTestPage extends StatelessWidget {
  const ProviderTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.providerTestPage),
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
