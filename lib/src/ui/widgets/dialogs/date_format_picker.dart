import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/get_correct_date_string.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_alert_dialog.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateFormatPickerListTile extends StatelessWidget {
  const DateFormatPickerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return Selector<Settings, ({DateFormatOptions read})>(
      selector: (_, p1) => (read: p1.dateFormat),
      builder: (context, dateFormat, child) => ListTile(
        title: Text(lang.dateFormat),
        subtitle: Text(getCorrectDateString(dateFormat.read, inSettings: true)),
        onTap: () => configuredDialog(context, builder: (context) => const DateFormatPicker()),
      ),
    );
  }
}

class DateFormatPicker extends StatelessWidget {
  const DateFormatPicker({super.key});
  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    return ConfiguredAlertDialog(
      title: lang.dateFormat,
      content: Selector<Settings, ({DateFormatOptions read, Function(DateFormatOptions) set})>(
        selector: (_, p1) => (read: p1.dateFormat, set: p1.setDateFormat),
        builder: (context, dateFormat, child) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: DateFormatOptions.values
                .map(
                  (format) => ListTile(
                    minVerticalPadding: 0,
                    visualDensity: const VisualDensity(vertical: -4),
                    title: Text(getCorrectDateString(format, inSettings: true)),
                    titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                    trailing: dateFormat.read == format ? const Icon(Icons.check) : null,
                    onTap: () {
                      dateFormat.set(format);
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
