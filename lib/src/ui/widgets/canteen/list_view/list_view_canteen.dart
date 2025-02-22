import 'dart:async';

import 'package:autojidelna/src/_conf/dates.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/ui/widgets/canteen/list_view/day_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_list_view/flutter_list_view.dart';

class ListViewCanteen extends StatefulWidget {
  const ListViewCanteen({super.key});

  @override
  State<ListViewCanteen> createState() => _ListViewCanteenState();
}

class _ListViewCanteenState extends State<ListViewCanteen> {
  Timer? _debounceTimer;

  void _updateVisibleItem() {
    final visibleRange = App.listController.sliverController.getVisibleIndexData();
    if (visibleRange == null || visibleRange.isEmpty) return;

    final DateTime visibleDate = convertIndexToDatetime(visibleRange.first);

    _debounceTimer?.cancel();
    _debounceTimer = Timer(Durations.medium1, () {
      final canteenProvider = context.read<CanteenProvider>();
      if (canteenProvider.selectedDate != visibleDate) {
        canteenProvider.setSelectedDate(visibleDate);
      }
    });
  }

  @override
  void dispose() {
    App.listController.removeListener(_updateVisibleItem);
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    App.listController.addListener(_updateVisibleItem);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<CanteenProvider>().refreshList,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: FlutterListView(
        controller: App.listController,
        scrollDirection: Axis.vertical,
        delegate: FlutterListViewDelegate(
          initIndex: convertDateTimeToIndex(DateTime.now()),
          childCount: Dates.maximalDate.difference(Dates.minimalDate).inDays,
          (BuildContext context, int index) => DayCard(convertIndexToDatetime(index)),
        ),
      ),
    );
  }
}
