import 'package:autojidelna/src/_conf/errors.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/account/account.dart';
import 'package:autojidelna/src/ui/widgets/divider_with_text.dart';
import 'package:autojidelna/src/ui/widgets/login/canteen_url_picker.dart';
import 'package:autojidelna/src/ui/widgets/login/custom_url_field.dart';
import 'package:autojidelna/src/types/onboarding_step.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CanteenUrlOnboarding extends StatelessWidget implements OnboardingStep {
  const CanteenUrlOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const CustomUrlField(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DividerWithText(text: 'nebo'),
          ),
          ConstrainedBox(constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .4), child: const CanteenUrlPicker()),
        ],
      ),
    );
  }

  @override
  Future<bool> onNextPage(BuildContext context) async {
    if (!context.read<LoginProvider>().urlForm.currentState!.validate()) {
      context.read<LoginProvider>().loggingIn = false;
      return false;
    }
    context.read<LoginProvider>().loggingIn = true;
    bool value = true;
    try {
      await context.read<UserProvider>().login(Account(username: '', password: '', url: context.read<LoginProvider>().urlController.text));
    } catch (e) {
      switch (e) {
        case AuthErrors.wrongUrl:
          value = false;
          break;
        case AuthErrors.noInternetConnection:
          if (await showInternetConnectionSnackBar() && context.mounted) onNextPage(context);
          break;
        case AuthErrors.connectionFailed:
          if (context.mounted) showErrorSnackBar(SnackBarAuthErrors.connectionFailed(context.l10n));
          break;
        default:
      }
    }
    if (context.mounted) context.read<LoginProvider>().loggingIn = false;
    return value;
  }

  @override
  String buttonText(BuildContext context) => context.l10n.next;

  @override
  String description(BuildContext context) => context.l10n.loginSubtitle;
}
