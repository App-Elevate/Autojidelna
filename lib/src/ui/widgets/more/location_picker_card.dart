import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/providers/account.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_alert_dialog.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:autojidelna/src/ui/widgets/lined_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// TODO: IMPLEMENT
class LocationPickerCard extends StatefulWidget {
  const LocationPickerCard({super.key});

  @override
  State<LocationPickerCard> createState() => _LocationPickerCardState();
}

class _LocationPickerCardState extends State<LocationPickerCard> {
  int selectedLocation = 1;

  void updatePicked(int i) => setState(() {
        selectedLocation = i;
      });

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return Selector<AccountProvider, Map<int, String>>(
      selector: (_, p1) => p1.locations,
      builder: (context, locations, ___) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            LinedCard(
              smallButton: false,
              title: lang.location,
              footer: locations.length > 1 ? lang.pickLocation : null,
              footerTextAlign: TextAlign.end,
              onPressed: locations.length < 2 ? null : () => pickerDialog(context, locations),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(locations[selectedLocation + 1] ?? locations[1] ?? ''),
              ),
            ),
            if (locations.isEmpty) lockedCover(context),
          ],
        );
      },
    );
  }

  void pickerDialog(BuildContext context, Map<int, String> locations) {
    final Texts lang = context.l10n;
    configuredDialog(
      context,
      builder: (context) => ConfiguredAlertDialog(
        title: lang.pickLocation,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            locations.length,
            (i) => ListTile(
              visualDensity: VisualDensity.compact,
              title: Text(
                locations[i + 1]!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: selectedLocation == i ? const Icon(Icons.check) : null,
              onTap: () async {
                updatePicked(i);
                // loggedInCanteen.zmenitVydejnu(i + 1);
                Navigator.of(context).popUntil((route) => route.isFirst);
                AccountProvider account = context.read<AccountProvider>();
                Hive.box(Boxes.appState).put(HiveKeys.location(account.uzivatel.uzivatelskeJmeno ?? '', account.url ?? ''), i);
              },
            ),
          ),
        ),
      ),
    );
  }

  Positioned lockedCover(BuildContext context) {
    return Positioned.fill(
      child: Container(
        margin: AppThemes.horizontalMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onInverseSurface.withOpacity(.9),
          border: Border.all(color: Theme.of(context).dividerTheme.color!),
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.lock_outline_rounded),
      ),
    );
  }
}
