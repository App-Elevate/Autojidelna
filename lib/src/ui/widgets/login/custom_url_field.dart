import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomUrlField extends StatefulWidget {
  const CustomUrlField({super.key});

  @override
  State<CustomUrlField> createState() => _CustomUrlFieldState();
}

class _CustomUrlFieldState extends State<CustomUrlField> {
  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;
    final LoginProvider provider = context.read<LoginProvider>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
      child: Form(
        key: provider.urlForm,
        child: TextFormField(
          controller: provider.urlController,
          autocorrect: false,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.url],
          decoration: InputDecoration(
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: lang.loginUrlFieldLabel,
            hintText: 'např. jidelna.trebesin.cz',
            errorText: provider.urlError,
            suffixIcon: const Icon(Icons.edit_rounded),
          ),
          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          validator: (value) => value == null || value.isEmpty ? lang.loginUrlFieldHint : null,
        ),
      ),
    );
  }
}
