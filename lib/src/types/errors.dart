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

  /// There are accounts in storage but the user hasn't selected one to log in with
  accountNotSelected,

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

enum CanteenErrors {
  /// A user is trying to do something without loging in
  needToLogin,

  /// User is not connected to the internet
  noInternetConnection,

  /// Selected feature is not available
  unsuportedFeature,
}
