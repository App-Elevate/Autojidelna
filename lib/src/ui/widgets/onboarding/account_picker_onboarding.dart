import 'package:autojidelna/src/_conf/errors.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/show_snack_bar.dart';
import 'package:autojidelna/src/types/errors.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:autojidelna/src/types/onboarding_step.dart';
import 'package:autojidelna/src/ui/widgets/snackbars/show_internet_connection_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPickerOnboarding extends StatelessWidget implements OnboardingStep {
  const AccountPickerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    List<SafeAccount> accounts = context.read<UserProvider>().loggedInAccounts;

    WidgetsBinding.instance.addPostFrameCallback((_) => context.read<LoginProvider>().setPickedAccount(accounts.first));

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .4),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                SafeAccount account = accounts[index];

                return ListTile(
                  title: Text(account.username),
                  subtitle: Text(account.url),
                  trailing: context.watch<LoginProvider>().pickedAccount == account ? const Icon(Icons.check) : null,
                  onTap: context.read<LoginProvider>().loggingIn ? null : () => context.read<LoginProvider>().setPickedAccount(account),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<bool> onNextPage(BuildContext context) async {
    if (context.read<LoginProvider>().pickedAccount == null) return false;
    context.read<LoginProvider>().loggingIn = true;

    try {
      await context.read<UserProvider>().changeUser(context.read<LoginProvider>().pickedAccount!);
      if (context.mounted) await context.read<UserProvider>().loadUser();
    } catch (e) {
      if (!context.mounted) return false;
      final Texts lang = context.l10n;
      switch (e) {
        case AuthErrors.accountNotSelected:
          showErrorSnackBar(SnackBarAuthErrors.accountNotFound(lang));
          break;
        case AuthErrors.connectionFailed:
          showErrorSnackBar(SnackBarAuthErrors.connectionFailed(lang));
          break;
        case AuthErrors.noInternetConnection:
          if (await showInternetConnectionSnackBar() && context.mounted) return await onNextPage(context);
          break;
        case AuthErrors.wrongCredentials:
          showErrorSnackBar(SnackBarAuthErrors.wrongCredentials(lang));
          break;
        case AuthErrors.wrongUrl:
          showErrorSnackBar(SnackBarAuthErrors.wrongUrl(lang));
          break;
        default:
      }
      if (context.mounted) context.read<LoginProvider>().loggingIn = false;
      return false;
    }
    if (context.mounted) context.read<LoginProvider>().loggingIn = false;

    return true;
  }

  @override
  String buttonText(BuildContext context) => context.l10n.login;

  @override
  String description(BuildContext context) => context.l10n.loginSubtitle;
}
