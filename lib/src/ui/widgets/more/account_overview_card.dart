import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/configured_bottom_sheet.dart';
import 'package:autojidelna/src/ui/widgets/lined_card.dart';
import 'package:autojidelna/src/ui/widgets/switch_account_panel.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountOverviewCard extends StatelessWidget {
  const AccountOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Selector<UserProvider, Uzivatel?>(
      selector: (_, p1) => p1.user?.data,
      builder: (context, user, ___) {
        return LinedCard(
          title: user?.uzivatelskeJmeno ?? '',
          footer: lang.changeAccount,
          onPressed: () => configuredBottomSheet(context, builder: (context) => const SwitchAccountPanel()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.account_circle, size: 75),
              const VerticalDivider(color: Colors.transparent),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(lang.credit(user?.kredit ?? 0), style: AppThemes.textTheme.titleMedium),
                  if (user != null && user.kategorie != null) Text(user.kategorie!),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
