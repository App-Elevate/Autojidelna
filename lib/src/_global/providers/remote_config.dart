import 'dart:async';
import 'dart:convert';

import 'package:autojidelna/src/_conf/hive.dart';
import 'package:autojidelna/src/_global/app.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum RemoteConfigValueType {
  string,
  bool,
  int,
  double,
  json,
  dateTime,
}

/// Remote Config change notifier which can be used to get Remote Config values.
///
/// You can get current values from [value]. You hovewer have to be subscribed to the changes to get the updated values.
///
/// This subscription is made using provider.
///
/// If you want to use the values in a function, you can use the static [values] variable.
class Rmc extends ChangeNotifier {
  /// Method to get the Remote Config value types. This is grabbed from the default values.
  static Map<String, RemoteConfigValueType> get remoteConfigValueTypes {
    return defaultValues.map((key, value) {
      if (value is String) {
        return MapEntry(key, RemoteConfigValueType.string);
      } else if (value is bool) {
        return MapEntry(key, RemoteConfigValueType.bool);
      } else if (value is Map) {
        return MapEntry(key, RemoteConfigValueType.json);
      } else if (value is int) {
        return MapEntry(key, RemoteConfigValueType.int);
      } else if (value is double) {
        return MapEntry(key, RemoteConfigValueType.double);
      } else if (value is DateTime) {
        return MapEntry(key, RemoteConfigValueType.dateTime);
      } else {
        return MapEntry(key, RemoteConfigValueType.string);
      }
    });
  }

  static Map<String, dynamic> parseRemoteConfigValues(Map<String, RemoteConfigValue> remoteConfigValues) {
    final types = remoteConfigValueTypes;
    return remoteConfigValues.map((key, value) {
      switch (types[key]) {
        case RemoteConfigValueType.string:
          return MapEntry(key, value.asString());
        case RemoteConfigValueType.bool:
          return MapEntry(key, value.asBool());
        case RemoteConfigValueType.int:
          return MapEntry(key, value.asInt());
        case RemoteConfigValueType.double:
          return MapEntry(key, value.asDouble());
        case RemoteConfigValueType.json:
          return MapEntry(key, jsonDecode(value.asString()));
        case RemoteConfigValueType.dateTime:
          return MapEntry(key, DateTime.tryParse(value.asString()));
        default:
          return MapEntry(key, value.asString());
      }
    });
  }

  /// Current Remote Config values
  late final Map<dynamic, dynamic> _values;

  /// Current Remote Config values - These don't update the ui - use only in functions
  static final Map<dynamic, dynamic> values = Map.from(Rmc.defaultValues);
  StreamSubscription<RemoteConfigUpdate>? _subscription;

  Map<dynamic, dynamic> get value => _values;
  set value(Map<dynamic, dynamic> value) {
    value.forEach((key, newValue) {
      if (newValue != _values[key]) {
        _values[key] = newValue;
      }
      if (newValue != values[key]) {
        values[key] = newValue;
      }
    });
    unawaited(Hive.box(Boxes.appState).put(HiveKeys.appState.remoteConfigValues, value));
    notifyListeners();
  }

  /// Constructor for Remote Config - It is called when any value is first requested.
  Rmc() {
    _values = values;
    if (!kIsWeb) {
      _subscription ??= App.remoteConfig.onConfigUpdated.listen(
        (_) async {
          await App.remoteConfig.activate();
          value = parseRemoteConfigValues(App.remoteConfig.getAll());
        },
        cancelOnError: false,
        onError: (Object error, StackTrace stackTrace) => null,
      );
    }
  }

  Future<void> init() async {
    final values = Hive.box(Boxes.appState).get(HiveKeys.appState.remoteConfigValues, defaultValue: defaultValues);
    value = Map.from(values);
    try {
      await App.remoteConfig.fetchAndActivate();
      value = parseRemoteConfigValues(App.remoteConfig.getAll());
    } catch (e) {
      // ignore it will be caught by the subscription
    }
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  static const String authorMessage = 'author_message';
  static const String boolTrue = 'bool_true';
  static const String json = 'json';
  static const String integer = 'integer';
  static const String doubleNum = 'double_num';
  static const String appelevateLink = 'appelevate_link';

  /// Default values for Remote Config
  /// Every value has to be included to be parsed correctly.
  /// If a value isn't included, it will be parsed as a string.
  static const Map<String, dynamic> defaultValues = {
    authorMessage: 'Hello, I am the author of this app. I hope you like it!',
    boolTrue: true,
    json: {'key': 'value'},
    integer: 42,
    doubleNum: 42.5,
    appelevateLink: 'https://appelevate.com/',
  };
}
