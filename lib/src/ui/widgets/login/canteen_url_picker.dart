import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/logic/url.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CanteenUrlPicker extends StatelessWidget {
  const CanteenUrlPicker({super.key});

  static const Map<String, String> _urls = {
    'Střední průmyslová škola a Gymnázium Třebešín': 'jidelna.trebesin.cz',
    'Základní škola Ostrava': 'obedy.zs-mat5.cz',
    'Česká zemědělská akademie v Humpolci': 'jidelna.cza-hu.cz',
  };

  @override
  Widget build(BuildContext context) {
    final LoginProvider provider = context.read<LoginProvider>();

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: provider.urlController,
      builder: (_, urlController, ___) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _urls.length,
          itemBuilder: (_, index) {
            String title = _urls.entries.elementAt(index).key;
            String url = _urls.entries.elementAt(index).value;

            return ListTile(
              title: Text(title),
              subtitle: Text(url),
              trailing: Url.clean(urlController.text) == url ? const Icon(Icons.check) : null,
              onTap: () => provider.urlController.text = url,
            );
          },
        );
      },
    );
  }
}
