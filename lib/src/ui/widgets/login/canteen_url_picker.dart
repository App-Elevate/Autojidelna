import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/logic/url.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CanteenUrlPicker extends StatelessWidget {
  const CanteenUrlPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider provider = context.read<LoginProvider>();
    Map<String, String> urls = provider.urls;
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: provider.urlController,
      builder: (_, urlController, ___) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: urls.length,
          itemBuilder: (_, index) {
            String title = urls.entries.elementAt(index).key;
            String url = urls.entries.elementAt(index).value;

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
