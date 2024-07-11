import 'package:auto_route/auto_route.dart';
import 'package:coree/src/_global/is_online.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:coree/src/_routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.routingTestPage.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(Alocale.routingTestPageDetail.getString(context)),
            Text(Alocale.routingTestPageDetail1.getString(context)),
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingTestDetailPage()),
              child: Text(Alocale.routingGoToDetailPage.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const RoutingParamPage()),
              child: Text(Alocale.routingGoToParamDetailPage.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const LocalizationsPage()),
              child: Text(Alocale.language.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const ProviderTestPage()),
              child: Text(Alocale.remoteConfig.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(LoginPage()),
              child: Text(Alocale.login.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const SecretPage()),
              child: Text(Alocale.secret.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const GoogleSecretPage()),
              child: Text(Alocale.secretGoogle.getString(context)),
            ),
            ElevatedButton(
              onPressed: () async => context.router.push(const AppleSecretPage()),
              child: Text(Alocale.appleSecret.getString(context)),
            ),
            Consumer<IsOnline>(
              builder: (context, IsOnline isOnline, child) {
                return Text(
                  isOnline.isOnline ? Alocale.connectedToTheInternet.getString(context) : Alocale.disconnectedFromTheInternet.getString(context),
                );
              },
            ),
            Consumer<IsOnline>(
              builder: (context, IsOnline isOnline, child) {
                return Text(
                  isOnline.isOnlineLocal ? Alocale.connectedToANetwork.getString(context) : Alocale.disconnectedFromANetwork.getString(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
