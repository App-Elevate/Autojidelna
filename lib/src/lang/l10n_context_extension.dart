import 'package:flutter/material.dart';
import 'package:autojidelna/src/lang/output/texts.dart';

export 'package:autojidelna/src/lang/output/texts.dart';

extension AppLocalizationsX on BuildContext {
  Texts get l10n => Texts.of(this);
}
