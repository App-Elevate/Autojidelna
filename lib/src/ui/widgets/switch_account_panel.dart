import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/types/freezed/safe_account.dart/safe_account.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:autojidelna/src/ui/widgets/logout_dialog.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchAccountPanel extends StatelessWidget {
  const SwitchAccountPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Column(
      children: [
        SectionTitle(lang.accounts),
        Consumer<UserProvider>(
          builder: (context, prov, ___) {
            if (prov.user == null) return const Flexible(child: SizedBox());

            List<Widget> accounts = [];

            for (int i = 0; i < prov.loggedInAccounts.length; i++) {
              accounts.add(accountRow(context, prov.loggedInAccounts[i]));
            }

            return Flexible(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (_, index) => accounts[index],
              ),
            );
          },
        ),
        const CustomDivider(height: 0, isTransparent: false),
        addAccountButton(context),
      ],
    );
  }

  Widget addAccountButton(BuildContext context) {
    final Texts lang = context.l10n;
    return ListTile(
      leading: const Icon(Icons.add),
      title: Text(lang.addAccount),
      onTap: () async => context.router.navigate(const LoginPage()),
    );
  }

  Widget accountRow(BuildContext context, SafeAccount safeAccount) {
    UserProvider prov = context.read<UserProvider>();
    bool currentAccount = safeAccount == SafeAccount(username: prov.user!.username, url: prov.user!.canteenUrl);

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(safeAccount.username, style: currentAccount ? AppThemes.textTheme.titleMedium : null),
          if (currentAccount) const Icon(Icons.check, size: 30),
        ],
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.logout, size: 30, color: Theme.of(context).colorScheme.onSurface),
        onPressed: () async {
          if (!context.mounted) return;
          if (!currentAccount) {
            prov.logout(safeAccount);
          } else {
            configuredDialog(
              context,
              builder: (BuildContext context) => logoutDialog(context, safeAccount),
            );
          }
        },
      ),
      onTap: () async {
        if (currentAccount) return;
        await prov.changeUser(safeAccount);
        if (context.mounted) context.router.replaceAll([const LoginLoading()]);
      },
    );
  }
}
