import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/scroll_view_column.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ConveniencePage extends StatelessWidget {
  const ConveniencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(lang.convenience)),
      body: ScrollViewColumn(
        children: [
          SectionTitle(lang.convenience),
          // skip weekends
          Selector<Settings, ({bool read, Function(bool) set})>(
            selector: (_, p1) => (read: p1.getSkipWeekends, set: p1.setSkipWeekends),
            builder: (context, skipWeekends, child) => SwitchListTile(
              title: Text(lang.skipWeekends),
              value: skipWeekends.read,
              onChanged: skipWeekends.set,
            ),
          ),
          // big calendar markers
          Selector<Settings, ({bool read, Function(bool) set})>(
            selector: (_, p1) => (read: p1.bigCalendarMarkers, set: p1.setCalendarMarkers),
            builder: (context, bigCalendarMarkers, child) => SwitchListTile(
              title: Text(lang.calendarBigMarkers),
              value: bigCalendarMarkers.read,
              onChanged: bigCalendarMarkers.set,
            ),
          ),
          SectionTitle(lang.experimental),
          // list UI
          Selector<Settings, ({bool read, Function(bool) set})>(
            selector: (_, p1) => (read: p1.isListUi, set: p1.setListUi),
            builder: (context, listUi, child) => SwitchListTile(
              title: Text(lang.listUi),
              value: listUi.read,
              onChanged: listUi.set,
            ),
          ),
        ],
      ),
    );
  }
}
