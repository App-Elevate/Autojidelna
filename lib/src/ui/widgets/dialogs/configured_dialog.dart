import 'dart:async';

import 'package:flutter/material.dart';

void configuredDialog(BuildContext context, {required Widget Function(BuildContext context) builder}) {
  unawaited(
    showDialog(
      context: context,
      builder: builder,
      useRootNavigator: true,
    ),
  );
}
