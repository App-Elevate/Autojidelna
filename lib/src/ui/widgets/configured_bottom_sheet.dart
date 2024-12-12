import 'dart:async';

import 'package:flutter/material.dart';

void configuredBottomSheet(BuildContext context, {required Widget Function(BuildContext) builder}) {
  unawaited(
    showModalBottomSheet(
      context: context,
      builder: builder,
      useRootNavigator: true,
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .6),
    ),
  );
}
