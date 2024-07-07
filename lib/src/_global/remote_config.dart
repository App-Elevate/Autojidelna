import 'package:coree/src/_global/app.dart';
import 'package:flutter/material.dart';

class Rmc extends ChangeNotifier {
  Map<String, dynamic> values;

  Rmc({this.values = defaultValues}) {
    if (AppOnline.initRemoteConfigValues != null) {
      values = AppOnline.initRemoteConfigValues!;
    }
    print('Rmc: $values');
    App.remoteConfig.onConfigUpdated.listen(
      (_) async {
        await App.remoteConfig.activate();
        values = App.remoteConfig.getAll();
        notifyListeners();
      },
      onError: (Object error, StackTrace stackTrace) => null,
    );
  }

  static const String authorMessage = 'author_message';

  /// Default values for Remote Config
  static const Map<String, dynamic> defaultValues = {
    authorMessage: 'Hello, I am the author of this app. I hope you like it!',
  };
}
