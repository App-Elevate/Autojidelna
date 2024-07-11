import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GoogleSecretPage extends StatelessWidget {
  const GoogleSecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Secret Page'),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text('Flutter + Google = ❤️'),
          ],
        ),
      ),
    );
  }
}
