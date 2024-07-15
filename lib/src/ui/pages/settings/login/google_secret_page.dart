import 'package:auto_route/auto_route.dart';
import 'package:coree/src/lang/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

@RoutePage()
class GoogleSecretPage extends StatelessWidget {
  const GoogleSecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Alocale.secretGoogle.getString(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(Alocale.secretGoogleContent.getString(context)),
          ],
        ),
      ),
    );
  }
}
