import 'package:flutter/material.dart';
import 'package:coree/src/lang/output/texts.dart';

export 'package:coree/src/lang/output/texts.dart';

extension AppLocalizationsX on BuildContext {
  Texts get l10n => Texts.of(this);
  static const defaultLocale = Locale('en');

  /// This function is used to change the language of the app.
  ///
  /// You can also pass null to this function to set the default language.
  static Function(Locale? language)? translate;
}
