import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/get_correct_date_string.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/ui/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final int dayIndex = context.select<DishesOfTheDay, int>((prov) => prov.dayIndex);

    return SizedBox(
      height: 37.5,
      child: MaterialButton(
        textColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).colorScheme.onSurfaceVariant, width: 1.75),
        ),
        onPressed: () => showCustomDatePicker(context, convertIndexToDatetime(dayIndex)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_month_outlined),
            const SizedBox(width: 8),
            Selector<Settings, DateFormatOptions>(
              selector: (_, p1) => p1.dateFormat,
              builder: (context, dateFormat, _) {
                String day =
                    DateFormat(DateFormat.ABBR_WEEKDAY, Localizations.localeOf(context).toLanguageTag()).format(convertIndexToDatetime(dayIndex));
                String date = getCorrectDateString(dateFormat, date: convertIndexToDatetime(dayIndex));
                return Text('$day - $date');
              },
            ),
          ],
        ),
      ),
    );
  }
}
