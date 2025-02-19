import 'package:auto_route/auto_route.dart';
import 'package:autojidelna/src/_global/providers/login.provider.dart';
import 'package:autojidelna/src/lang/l10n_context_extension.dart';
import 'package:autojidelna/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => ChangeNotifierProvider(create: (_) => LoginProvider(), child: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(forceMaterialTransparency: true),
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - MediaQuery.viewInsetsOf(context).bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Text(context.l10n.appName, style: AppThemes.textTheme.displayLarge),
                ),
                _loginForm(context, loginProvider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _loginForm(BuildContext context, LoginProvider provider) {
    final lang = context.l10n;
    return Form(
      key: provider.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                controller: provider.urlController,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.url],
                decoration: InputDecoration(labelText: lang.loginUrlFieldLabel, errorText: provider.urlError),
                validator: (value) => value == null || value.isEmpty ? lang.loginUrlFieldHint : null,
              ),
            ),
            AutofillGroup(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: provider.usernameController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.username],
                    decoration: InputDecoration(labelText: lang.loginUserFieldLabel, errorText: provider.usernameError ? '' : null),
                    validator: (value) => (value?.isEmpty ?? true) ? lang.loginUserFieldHint : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
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
                    validator: (value) => (value?.isEmpty ?? true) ? lang.loginPasswordFieldHint : null,
                  ),
                ),
              ],
            )),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 400,
              child: FilledButton(
                onPressed: provider.loggingIn ? null : () async => provider.login(context),
                child: Text(lang.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
