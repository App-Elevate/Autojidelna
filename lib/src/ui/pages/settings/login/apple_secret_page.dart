import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppleSecretPage extends StatelessWidget {
  const AppleSecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple Secret Page'),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text('Flutter + Apple = ❤️'),
          ],
        ),
      ),
    );
  }
}
