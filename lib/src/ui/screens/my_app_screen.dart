import 'package:auto_route/auto_route.dart';
import 'package:coree/src/ui/pages/my_app_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainAppScreen extends StatelessWidget {
  const MainAppScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(
      title: 'Flutter Demo Home Page',
    );
  }
}
