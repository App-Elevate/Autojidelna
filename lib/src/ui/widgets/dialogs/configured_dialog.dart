import 'dart:async';

import 'package:flutter/material.dart';

void configuredDialog(BuildContext context, {required Widget Function(BuildContext) builder}) {
  unawaited(
    showDialog(
      context: context,
      builder: builder,
      useRootNavigator: true,
    ),
  );
}
