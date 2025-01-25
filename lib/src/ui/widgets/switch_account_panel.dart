import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/_routing/app_router.gr.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchAccountPanel extends StatefulWidget {
  const SwitchAccountPanel({super.key});

  @override
  State<SwitchAccountPanel> createState() => _SwitchAccountPanelState();
}

class _SwitchAccountPanelState extends State<SwitchAccountPanel> {
  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Column(
      children: [
        SectionTitle(lang.accounts),
        Selector<AccountProvider, ({int? id, List<String> usernames})>(
          selector: (_, p1) => (id: p1.loggedInID, usernames: p1.usernames),
          builder: (context, prov, ___) {
            List<Widget> accounts = [];
            for (int i = 0; i < prov.usernames.length; i++) {
              accounts.add(accountRow(context, i, username: prov.usernames[i], currentAccount: i == prov.id));
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

  Widget accountRow(BuildContext context, int id, {String username = '', bool currentAccount = false}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(username, style: currentAccount ? AppThemes.textTheme.titleMedium : null),
          if (currentAccount) const Icon(Icons.check, size: 30),
        ],
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.logout, size: 30, color: Theme.of(context).colorScheme.onSurface),
        onPressed: () async {
          if (currentAccount && context.mounted) {
            /*configuredDialog(
                context,
                builder: (BuildContext context) => logoutDialog(context, currentAccount: currentAccount, id: id),
              );*/
          } else if (context.mounted) {
            // TODO: await loggedInCanteen.logout(id: id);
            setState(() {});
          }
        },
      ),
      onTap: () async {
        if (!currentAccount) {
          // TODO: await loggedInCanteen.switchAccount(id);
          if (context.mounted) {
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoggingInWidget()), (route) => false);
          }
        }
      },
    );
  }
}
