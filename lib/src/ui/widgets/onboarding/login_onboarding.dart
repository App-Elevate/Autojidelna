import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/widgets/custom_divider.dart';
import 'package:autojidelna/src/types/onboarding_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginOnboarding extends StatelessWidget implements OnboardingStep {
  const LoginOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final Texts lang = context.l10n;

    return Consumer<LoginProvider>(
      builder: (context, provider, ___) {
        final MapEntry<String, String> url = provider.urls.entries.firstWhere(
          (e) => e.value == provider.urlController.text,
          orElse: () => MapEntry(provider.urlController.text.split('.').reversed.elementAt(1), provider.urlController.text),
        );
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: provider.credentialsForm,
            child: AutofillGroup(
              child: Column(
                children: [
                  ListTile(title: Text(url.key), subtitle: Text(url.value)),
                  const CustomDivider(isTransparent: false),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: TextFormField(
                      controller: provider.usernameController,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.username],
                      decoration: InputDecoration(
                        labelText: lang.loginUserFieldLabel,
                        errorText: provider.usernameError ? '' : null,
                      ),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      validator: (value) => (value?.isEmpty ?? true) ? lang.loginUserFieldHint : null,
                    ),
                  ),
                  const CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: TextFormField(
                      controller: provider.passwordController,
                      autocorrect: false,
                      obscureText: provider.hidePassword,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: lang.loginPasswordFieldLabel,
                        errorText: provider.passwordError,
                        suffixIcon: IconButton(
                          onPressed: provider.changePasswordVisibility,
                          icon: Icon(provider.hidePassword ? Icons.visibility_off : Icons.visibility),
                        ),
                      ),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      validator: (value) => (value?.isEmpty ?? true) ? lang.loginPasswordFieldHint : null,
                    ),
                  ),
                  const CustomDivider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Future<bool> onNextPage(BuildContext context) async => await context.read<LoginProvider>().login(context);

  @override
  String buttonText(BuildContext context) => context.l10n.login;

  @override
  String description(BuildContext context) => context.l10n.loginSubtitle;
}
