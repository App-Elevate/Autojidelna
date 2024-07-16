import 'package:flutter/material.dart';
import 'package:coree/src/lang/output/texts.dart';

export 'package:coree/src/lang/output/texts.dart';

extension AppLocalizationsX on BuildContext {
  Texts get l10n => Texts.of(this);
}
