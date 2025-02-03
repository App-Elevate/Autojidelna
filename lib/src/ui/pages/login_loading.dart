import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/logic/auth_service.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginLoading extends StatefulWidget {
  const LoginLoading({super.key});

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading> {
  void login() async {
    try {
      await context.read<UserProvider>().loadUser();
    } catch (e) {
      switch (e) {
        case AuthErrors.noInternetConnection:
          bool value = await showInternetConnectionSnackBar();
          if (value) login();
          break;
        default:
          if (mounted) context.router.replaceAll([const LoginPage()]);
      }
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
