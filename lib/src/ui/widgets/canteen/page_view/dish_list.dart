import 'package:autojidelna/src/_global/providers/canteen.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/canteen/page_view/page_view_food_card.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DishList extends StatelessWidget {
  const DishList(this.date, {super.key});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final lang = context.l10n;
    return RefreshIndicator(
      onRefresh: context.read<CanteenProvider>().refreshCurrentPage,
      child: Consumer<CanteenProvider>(
        builder: (_, data, child) {
          Jidelnicek? menu = data.getCachedMenu(date);
          if (menu == null) return const Center(child: CircularProgressIndicator());
          List<Jidlo> dishList = menu.jidla;

          if (dishList.isEmpty) return child!;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 24),
            itemCount: dishList.length,
            itemBuilder: (context, index) => PageViewFoodCard(dishList[index]),
          );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height / 2 - 100),
              child: Text(lang.noFood),
            ),
          ),
        ),
      ),
    );
  }
}
