import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_routing/app_router.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/ordering.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_alert_dialog.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void burzaAlertDialog(BuildContext context, Jidlo updatedDish, StavJidla stav) {
  if (stav != StavJidla.objednanoPouzeNaBurzu || Hive.box(Boxes.appState).get(HiveKeys.hideBurzaAlertDialog, defaultValue: false)) {
    pressed(context, updatedDish, stav);
    return;
  }

  final Texts lang = context.l10n;
  ValueNotifier<bool> checkbox = ValueNotifier<bool>(false);

  return configuredDialog(
    context,
    builder: (context) => ConfiguredAlertDialog(
      title: getObedText(context, updatedDish, stav),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(lang.burzaAlertDialogContent),
          ),
          const SizedBox(height: 2),
          ValueListenableBuilder(
            valueListenable: checkbox,
            builder: (_, value, ___) => CheckboxListTile(
              value: value,
              onChanged: (data) async {
                checkbox.value = data!; // Checkbox isn't tristate so it's save
                Hive.box(Boxes.appState).put(HiveKeys.hideBurzaAlertDialog, data);
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(lang.dontShowAgain, style: Theme.of(context).listTileTheme.subtitleTextStyle),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
            visualDensity: const VisualDensity(vertical: -4),
            padding: const EdgeInsets.only(right: 16),
          ),
          onPressed: () {
            BuildContext? ctx = App.getIt<AppRouter>().navigatorKey.currentContext;
            if (ctx != null) pressed(context, updatedDish, stav);
            Navigator.pop(context);
          },
          child: Text(getObedText(context, updatedDish, stav)),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}
