import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppleSecretPage extends StatelessWidget {
  const AppleSecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appleSecret),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(l10n.appleSecretContent),
          ],
        ),
      ),
    );
  }
}
