import 'package:autojidelna/src/_conf/dates.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:autojidelna/src/logic/datetime_wrapper.dart';
import 'package:autojidelna/src/ui/widgets/canteen/list_view/day_card.dart';
import 'package:flutter/material.dart';
import 'package:indexed_list_view/indexed_list_view.dart';

class ListViewCanteen extends StatefulWidget {
  const ListViewCanteen({super.key});

  @override
  State<ListViewCanteen> createState() => _ListViewCanteenState();
}

// TODO
class _ListViewCanteenState extends State<ListViewCanteen> {
  @override
  void initState() {
    super.initState();
    App.listController = IndexedScrollController(
      keepScrollOffset: true,
      initialIndex: convertDateTimeToIndex(DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IndexedListView.builder(
      controller: App.listController,
      scrollDirection: Axis.vertical,
      maxItemCount: Dates.maximalDate.difference(Dates.minimalDate).inDays,
      itemBuilder: (BuildContext context, int index) => DayCard(convertIndexToDatetime(index)),
    );
  }
}
