import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/canteen/order_dish_button.dart';
import 'package:autojidelna/src/ui/widgets/section_title.dart';
import 'package:canteenlib/canteenlib.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DishDetailPage extends StatelessWidget {
  const DishDetailPage({super.key, required this.dish});
  final Jidlo dish;

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    JidloKategorizovano courses = dish.kategorizovano!;

    return Scaffold(
      appBar: AppBar(title: Text(dish.varianta)),
      body: ListView(
        children: [
          if (courses.polevka != null && courses.polevka!.trim().isNotEmpty) categoryDetail(lang.soup, content: courses.polevka!),
          if (courses.hlavniJidlo != null && courses.hlavniJidlo!.trim().isNotEmpty) categoryDetail(lang.mainCourse, content: courses.hlavniJidlo!),
          if (courses.salatovyBar != null && courses.salatovyBar!.trim().isNotEmpty) categoryDetail(lang.sideDish, content: courses.salatovyBar!),
          if (courses.piti != null && courses.piti!.trim().isNotEmpty) categoryDetail(lang.drinks, content: courses.piti!),
          if (courses.ostatni != null && courses.ostatni!.trim().isNotEmpty) categoryDetail(lang.other, content: courses.ostatni!),
          if (dish.alergeny.isNotEmpty) categoryDetail(lang.allergens, allergens: dish.alergeny),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: OrderDishButton(dish),
      ),
    );
  }

  Column categoryDetail(String title, {String? content, List<Alergen> allergens = const <Alergen>[]}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title),
        if (content != null) ListTile(title: Text(content.trim())),
        if (allergens.isNotEmpty)
          ...allergens.map(
            (allergen) => ListTile(
              title: Text(allergen.nazev.trim()),
              subtitle: allergen.popis != null || allergen.popis!.trim().isNotEmpty ? Text(allergen.popis!.trim()) : null,
            ),
          ),
      ],
    );
  }
}
