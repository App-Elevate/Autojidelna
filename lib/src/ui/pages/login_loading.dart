import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/logic/canteenwrapper.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginLoading extends StatefulWidget {
  const LoginLoading({super.key});

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading> {
  void login() async {
    try {
      await loggedInCanteen.loginFromStorage();
    } catch (e) {
      if (mounted) context.router.replaceAll([const LoginPage()]);
      return;
    }
    if (mounted) context.router.replaceAll([const RouterPage()]);
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
