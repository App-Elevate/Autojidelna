// This is the custom date picker used in the main app screen (jidelna.dart)

import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_conf/dates.dart';
import 'package:autojidelna/src/_global/providers/date_picker_provider.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/logic/change_date.dart';
import 'package:autojidelna/src/logic/ordering.dart';
import 'package:autojidelna/src/logic/string_extension.dart';
import 'package:autojidelna/src/types/all.dart';
import 'package:autojidelna/src/types/theme.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/ui/widgets/dialogs/configured_dialog.dart';
import 'package:canteenlib/canteenlib.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

showCustomDatePicker(BuildContext context) {
  String locale = Localizations.localeOf(context).toLanguageTag();

  bool bigMarkersEnabled = context.read<Settings>().bigCalendarMarkers;
  DateTime selectedDate = context.read<CanteenProvider>().selectedDate;

  ColorScheme colorScheme = Theme.of(context).colorScheme;
  final TextStyle defaultTextStyle = AppThemes.textTheme.titleMedium!;
  const BoxDecoration defaultDecoration = BoxDecoration(shape: BoxShape.circle);

  List<DateTime> orderedFoodDays = [];
  List<DateTime> availableFoodDays = [];

  List<dynamic> eventLoader(DateTime day) {
    Jidelnicek? menu = context.read<CanteenProvider>().getCachedMenu(day);

    if (menu == null) return [];
    if (!bigMarkersEnabled) return menu.jidla;

    /// This for loop is used for [defaultBuilder]
    for (Jidlo dish in menu.jidla) {
      if (orderedFoodDays.contains(day) || availableFoodDays.contains(day)) break;
      if (dish.objednano) {
        orderedFoodDays.add(day);
        break;
      }
      if (dish.lzeObjednat || dish.naBurze) {
        availableFoodDays.add(day);
        break;
      }
    }

    return [];
  }

  configuredDialog(
    context,
    builder: (context) => ChangeNotifierProvider(
      create: (_) => DatePickerProvider()
        ..appFocusedDate = selectedDate
        ..userFocusedDate = selectedDate
        ..visibleMonth = selectedDate.month,
      child: Dialog(
        child: Consumer<DatePickerProvider>(
          builder: (context, prov, ___) {
            void onPageChanged(DateTime focusedDay) {
              prov.visibleMonth = focusedDay.month;
              prov.appFocusedDate = focusedDay;
            }

            void onConfirm() {
              Navigator.of(context).pop();
              changeDate(context, prov.userFocusedDate);
            }

            void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
              if (isSameDay(selectedDay, prov.userFocusedDate)) {
                onConfirm();
                return;
              }
              prov.userFocusedDate = selectedDay;
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TableCalendar(
                  locale: locale,
                  sixWeekMonthsEnforced: true,
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronVisible: prov.visibleMonth != Dates.minimalDate.month,
                    rightChevronVisible: prov.visibleMonth != Dates.maximalDate.month,
                    titleTextStyle: AppThemes.textTheme.headlineSmall!,
                    decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest.withAlpha(16)),
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    markersMaxCount: 3,
                    markerSizeScale: 0.3,
                    markerDecoration: defaultDecoration.copyWith(color: colorScheme.secondary),
                    todayTextStyle: defaultTextStyle.copyWith(color: colorScheme.primary),
                    todayDecoration: defaultDecoration.copyWith(border: Border.all(color: colorScheme.primary)),
                    selectedTextStyle: defaultTextStyle.copyWith(color: colorScheme.onInverseSurface),
                    selectedDecoration: defaultDecoration.copyWith(color: colorScheme.primary),
                    defaultTextStyle: defaultTextStyle,
                    defaultDecoration: defaultDecoration,
                  ),
                  rowHeight: 45,
                  daysOfWeekHeight: 25,
                  focusedDay: prov.appFocusedDate,
                  currentDay: DateTime.now(),
                  firstDay: Dates.minimalDate,
                  lastDay: Dates.maximalDate,
                  selectedDayPredicate: (day) => isSameDay(prov.userFocusedDate, day),
                  onDaySelected: onDaySelected,
                  onPageChanged: onPageChanged,
                  eventLoader: eventLoader,
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (context, day) => _headerTitle(locale, day, context),
                    singleMarkerBuilder: !bigMarkersEnabled ? (context, __, dish) => _markerTemplate(context, dish as Jidlo) : null,
                    selectedBuilder: (context, day, ___) => _cellTemplate(context, prov.userFocusedDate, state: CellState.selected),
                    todayBuilder: (context, day, ___) => _cellTemplate(context, day, state: CellState.today),
                    defaultBuilder: (context, day, ___) {
                      if (!bigMarkersEnabled) return null;
                      if (orderedFoodDays.contains(day)) return _cellTemplate(context, day, state: CellState.ordered);
                      if (availableFoodDays.contains(day)) return _cellTemplate(context, day, state: CellState.available);
                      return null;
                    },
                  ),
                ),
                const CustomDivider(height: 0, isTransparent: false),
                _actionButtons(context, onConfirm),
              ],
            );
          },
        ),
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

Widget? _markerTemplate(BuildContext context, Jidlo dish) {
  final ColorScheme colorScheme = Theme.of(context).colorScheme;
  double size = 10;
  final StavJidla stavJidla = getStavJidla(context, dish);
  final bool ordered = getPrimaryState(stavJidla);

  if (!isButtonEnabled(stavJidla) && !ordered) return const SizedBox();

  Color color = ordered ? colorScheme.primary : colorScheme.secondary;

  return Container(
    height: size,
    width: size,
    margin: const EdgeInsets.symmetric(horizontal: 1),
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

Row _actionButtons(BuildContext context, void Function() onConfirm) {
  final Texts lang = context.l10n;

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () => context.router.popUntil((route) => route.isFirst),
        child: Text(lang.cancel),
      ),
      TextButton(
        onPressed: onConfirm,
        child: Text(lang.ok),
      ),
      const SizedBox(width: 10),
    ],
  );
}
