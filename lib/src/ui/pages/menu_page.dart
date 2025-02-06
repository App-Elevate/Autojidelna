import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/settings.provider.dart';
import 'package:autojidelna/src/ui/widgets/canteen/list_view/list_view_canteen.dart';
import 'package:autojidelna/src/ui/widgets/canteen/page_view/page_view_canteen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<Settings, bool>(
      selector: (_, p1) => p1.isListUi,
      builder: (context, data, child) => data ? const ListViewCanteen() : const PageViewCanteen(),
    );
  }
}
