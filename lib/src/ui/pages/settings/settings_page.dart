import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/is_online.dart';
import 'package:coree/src/lang/l10n_context_extension.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:coree/src/ui/widgets/account_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.routingTestPage),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(l10n.routingTestPageDetail),
            Text(l10n.routingTestPageDetail1),
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingTestDetailPage()),
              child: Text(l10n.routingGoToDetailPage),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingParamPage()),
              child: Text(l10n.routingGoToParamDetailPage),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const LocalizationsPage()),
              child: Text(l10n.language),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const ProviderTestPage()),
              child: Text(l10n.remoteConfig),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(LoginPage()),
              child: Text(l10n.login),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const SecretPage()),
              child: Text(l10n.secret),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const GoogleSecretPage()),
              child: Text(l10n.secretGoogle),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const AppleSecretPage()),
              child: Text(l10n.appleSecret),
            ),
            Consumer<IsOnline>(
              builder: (context, IsOnline isOnline, child) {
                return Text(
                  isOnline.isOnline ? l10n.connectedToTheInternet : l10n.disconnectedFromTheInternet,
                );
              },
            ),
            Consumer<IsOnline>(
              builder: (context, IsOnline isOnline, child) {
                return Text(
                  isOnline.isOnlineLocal ? l10n.connectedToANetwork : l10n.disconnectedFromANetwork,
                );
              },
            ),
            const AccountStatusWidget(),
          ],
        ),
      ),
    );
  }
}
