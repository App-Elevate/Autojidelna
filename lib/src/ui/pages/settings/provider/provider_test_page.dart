import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProviderTestPage extends StatelessWidget {
  const ProviderTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Rmc>(
              builder: (context, Rmc rmc, child) {
                return Text(rmc.values[Rmc.authorMessage]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
