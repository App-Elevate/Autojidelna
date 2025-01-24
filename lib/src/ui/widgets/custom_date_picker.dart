// This is the custom date picker used in the main app screen (jidelna.dart)

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/dishes_of_the_day_provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/change_date.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/logic/string_extension.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:canteenlib/canteenlib.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

showCustomDatePicker(BuildContext context) {
  String locale = Localizations.localeOf(context).toLanguageTag();
  DateTime currentDate = convertIndexToDatetime(context.read<DishesOfTheDay>().dayIndex);
  ValueNotifier<DateTime> focusedDateNotifier = ValueNotifier<DateTime>(currentDate);
  bool bigMarkersEnabled = context.read<Settings>().bigCalendarMarkers;
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  List<DateTime> orderedFoodDays = [];
  List<DateTime> availableFoodDays = [];

  configuredDialog(
    context,
    builder: (context) => Dialog(
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
            valueListenable: focusedDateNotifier,
            builder: (context, value, ___) {
              return TableCalendar(
                locale: locale,
                sixWeekMonthsEnforced: true,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: AppThemes.textTheme.headlineSmall!,
                  decoration: BoxDecoration(color: colorScheme.onSurface.withOpacity(0.1)),
                ),
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  markersMaxCount: 3,
                  todayTextStyle: AppThemes.textTheme.titleMedium!.copyWith(color: colorScheme.primary),
                  todayDecoration: BoxDecoration(border: Border.all(color: colorScheme.primary), shape: BoxShape.circle),
                  markerSizeScale: bigMarkersEnabled ? 0 : 0.3,
                  markerDecoration: BoxDecoration(color: colorScheme.secondary, shape: BoxShape.circle),
                  selectedTextStyle: AppThemes.textTheme.titleMedium!.copyWith(color: colorScheme.onInverseSurface),
                  selectedDecoration: BoxDecoration(color: colorScheme.primary, shape: BoxShape.circle),
                  defaultTextStyle: AppThemes.textTheme.titleMedium!,
                  defaultDecoration: const BoxDecoration(shape: BoxShape.circle),
                ),
                rowHeight: 45,
                daysOfWeekHeight: 25,
                focusedDay: value,
                currentDay: DateTime.now(),
                firstDay: minimalDate,
                lastDay: maximalDate,
                selectedDayPredicate: (day) => isSameDay(value, day),
                onDaySelected: (selectedDay, __) {
                  focusedDateNotifier.value = selectedDay;
                },
                eventLoader: (day) {
                  DateTime date = DateTime(day.year, day.month, day.day);
                  Jidelnicek? menu = context.read<DishesOfTheDay>().getMenu(convertDateTimeToIndex(date));

                  if (menu == null) return [];

                  for (Jidlo dish in menu.jidla) {
                    if (dish.objednano) {
                      orderedFoodDays.add(date);
                      return orderedFoodDays;
                    } else if (dish.lzeObjednat || dish.naBurze) {
                      availableFoodDays.add(date);
                      return availableFoodDays;
                    }
                  }

                  return [];
                },
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (context, day) => _headerTitle(locale, day, context),
                  selectedBuilder: (context, date, ___) => _cellTemplate(context, date, state: CellState.selected),
                  todayBuilder: (context, date, ___) => _cellTemplate(context, date, state: CellState.today),
                  defaultBuilder: bigMarkersEnabled
                      ? (context, date, ___) {
                          DateTime day = DateTime(date.year, date.month, date.day);
                          if (orderedFoodDays.contains(day)) return _cellTemplate(context, date, state: CellState.ordered);
                          if (availableFoodDays.contains(day)) return _cellTemplate(context, date, state: CellState.available);
                          return null;
                        }
                      : null,
                ),
              );
            },
          ),
          const Divider(height: 0),
          _actionButtons(context, focusedDateNotifier),
        ],
      ),
    ),
  );
}

Center _headerTitle(String locale, DateTime day, BuildContext context) {
  return Center(
    child: Text(
      DateFormat(DateFormat.YEAR_MONTH, locale).format(day).capitalize(),
      style: AppThemes.textTheme.headlineSmall!,
    ),
  );
}

Center _cellTemplate(BuildContext context, DateTime date, {CellState? state}) {
  final ColorScheme colorScheme = Theme.of(context).colorScheme;
  final TextStyle textStyle = AppThemes.textTheme.titleMedium!;
  double size = 40;
  Color color = Colors.transparent;
  Color textColor = colorScheme.onInverseSurface;
  Border? border;

  switch (state) {
    case CellState.today:
      textColor = colorScheme.onSurface;
      border = Border.all(color: colorScheme.onSurface, width: 2);
      break;
    case CellState.selected:
      color = colorScheme.onSurface;
      break;
    case CellState.ordered:
      size = 35;
      color = colorScheme.primary;
      break;
    case CellState.available:
      size = 35;
      color = colorScheme.secondary;
      break;
    default:
  }

  return Center(
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color, border: border, shape: BoxShape.circle),
      child: Center(
        child: Text(
          date.day.toString(),
          textAlign: TextAlign.center,
          style: textStyle.copyWith(color: textColor),
        ),
      ),
    ),
  );
}

Row _actionButtons(BuildContext context, ValueNotifier<DateTime> focusedDateNotifier) {
  final Texts lang = context.l10n;

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () => context.router.popUntil((route) => route.isFirst),
        child: Text(lang.cancel),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          changeDate(context, focusedDateNotifier.value);
        },
        child: Text(lang.ok),
      ),
      const SizedBox(width: 10),
    ],
  );
}
