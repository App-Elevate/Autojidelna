import 'dart:async';
import 'dart:convert';

import 'package:coree/src/_global/app.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum RemoteConfigValueType {
  string,
  bool,
  int,
  double,
  json,
}

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
        default:
          return MapEntry(key, value.asString());
      }
    });
  }

  /// Current Remote Config values
  final Map<String, dynamic> _values = Map.from(defaultValues);

  /// Current Remote Config values - These don't update the ui - use only in functions
  static final Map<String, dynamic> value = Map.from(Rmc.defaultValues);
  StreamSubscription<RemoteConfigUpdate>? _subscription;
  StreamSubscription<InternetStatus>? _listener;

  Map<String, dynamic> get values => _values;
  set values(Map<String, dynamic> values) {
    values.forEach((key, newValue) {
      if (newValue != _values[key]) {
        _values[key] = newValue;
      }
      if (newValue != value[key]) {
        value[key] = newValue;
      }
    });
  }

  /// Constructor for Remote Config - It is called when any value is first requested.
  Rmc() {
    unawaited(
      App.remoteConfig.fetchAndActivate().then((_) async {
        values = parseRemoteConfigValues(App.remoteConfig.getAll());
        notifyListeners();
      }),
    );
    _subscription ??= App.remoteConfig.onConfigUpdated.listen(
      (_) async {
        await App.remoteConfig.activate();
        values = parseRemoteConfigValues(App.remoteConfig.getAll());
        notifyListeners();
      },
      onError: (Object error, StackTrace stackTrace) => null,
    );
  }

  @override
  void dispose() {
    unawaited(_listener?.cancel());
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
