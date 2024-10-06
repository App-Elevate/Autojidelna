import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:autojidelna/src/ui/widgets/more/account_overview_card.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    final Uzivatel user = context.read<AccountProvider>().uzivatel;

    bool firstName = user.jmeno != null && user.jmeno!.trim().isNotEmpty;
    bool lastName = user.prijmeni != null && user.prijmeni!.trim().isNotEmpty;
    bool category = user.kategorie != null && user.kategorie!.trim().isNotEmpty;
    bool bankAccount = user.ucetProPlatby != null && user.ucetProPlatby!.trim().isNotEmpty;
    bool varSymbol = user.varSymbol != null && user.varSymbol!.trim().isNotEmpty;
    bool specSymbol = user.specSymbol != null && user.specSymbol!.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.account),
        actions: [_appBarLogoutButton(context)],
      ),
      body: ListView(
        children: [
          const CustomDivider(height: 30),
          const AccountOverviewCard(),
          const CustomDivider(height: 38),
          if ((firstName && lastName) || category) SectionTitle(lang.personalInfo),
          if (firstName && lastName)
            ListTile(
              title: Text('${user.jmeno!} ${user.prijmeni!}'),
              subtitle: Text(lang.name),
            ),
          if (lastName)
            ListTile(
              title: Text(user.kategorie!),
              subtitle: Text(lang.category),
            ),
          if (bankAccount || varSymbol || specSymbol) SectionTitle(lang.paymentInfo),
          if (bankAccount)
            ListTile(
              title: Text(user.ucetProPlatby!),
              subtitle: Text(lang.paymentAccountNumber),
            ),
          if (varSymbol)
            ListTile(
              title: Text(user.varSymbol!),
              subtitle: Text(lang.variableSymbol),
            ),
          if (specSymbol)
            ListTile(
              title: Text(user.specSymbol!),
              subtitle: Text(lang.specificSymbol),
            ),
        ],
      ),
    );
  }

  Padding _appBarLogoutButton(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: null /* TODO: () => configuredDialog(context, builder: (BuildContext context) => logoutDialog(context))*/,
        icon: Icon(Icons.logout),
      ),
    );
  }
}
