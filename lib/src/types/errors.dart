@Deprecated('Will be replaced with AuthErrors in a future version')
enum ConnectionErrors {
  /// User is not logged in (no username and password in secure storage)
  noLogin,

  /// User has entered the wrong password/username
  badLogin,

  /// User has entered the wrong url
  wrongUrl,

  /// Connection to the canteen server failed
  connectionFailed,

  /// User is not connected to the internet
  noInternet,
}

/// Popisuje možnosti kdy se login nepovedl
enum LoginFormErrorField {
  /// Heslo nebo uživatelské jméno je neplatné
  credentials,

  /// Url je neplatná
  url,
}

enum AuthErrors {
  /// Account wasn't found in secure storage
  accountNotFound,

  /// Connection to the canteen server failed
  connectionFailed,

  ///User is not connected to the internet
  noInternetConnection,

  /// User has entered the wrong password/username
  wrongCredentials,

  /// There is 0 saved credentials
  missingCredentials,

  /// User has entered wrong url
  wrongUrl,
}
