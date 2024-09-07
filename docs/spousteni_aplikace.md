# Spouštění aplikace

### Android

1. Ověřte si instalaci Android Studio a Android Emulatoru pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `Run and debug -> [Flutter] debug` vlevo ve vscode nebo `flutter run` nebo `flutter run --release -PuseDebugSigningConfig=true`
3. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro chráněné online funkcionality firebase. Vložte ho do [firebase v konzoli](https://console.firebase.google.com/project/_/appcheck/apps). Pro přístup napište Tomovi. Pozn. Google login nefunguje v debug módu, použijte jiný způsob přihlášení.

### iOS

1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Zažádejte u toma o přidání vašeho zařízení do Apple Developer portálu. Tom k tomu bude potřebovat vaše [UDID zařízení](https://www.igeeksblog.com/how-to-find-iphone-udid-number/#h-2-how-to-find-iphone-s-udid-using-mac) na které budete aplikaci instalovat.
3. Získejte společné vývojářské klíče pomocí `sh scripts/ios_get_keys.sh` (Poprvé zažádejte toma o přístup k dešifrovacímu heslu)
4. Spusťte aplikaci pomocí `Run and debug -> [Flutter] debug` vlevo ve vscode nebo `flutter run` nebo `flutter run --release`
5. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro chráněné online funkcionality firebase. [firebase v konzoli](https://console.firebase.google.com/project/_/appcheck/apps). Pro přístup napište Tomovi.

### macos

1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Zažádejte u toma o přidání vašeho zařízení do Apple Developer portálu. Tom k tomu bude potřebovat vaše [UDID zařízení](https://www.igeeksblog.com/how-to-find-mac-udid/#h-how-to-find-udid-uuid-of-your-mac) na které budete aplikaci instalovat.
3. Získejte společné vývojářské klíče pomocí `sh scripts/macos_get_keys.sh` (Poprvé zažádejte toma o přístup k dešifrovacímu heslu)
4. Spusťte aplikaci pomocí `Run and debug -> [Flutter] debug` vlevo ve vscode nebo `flutter run -d macos` nebo `flutter run -d macos --release`
5. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro chráněné online funkcionality firebase. [firebase v konzoli](https://console.firebase.google.com/project/_/appcheck/apps). Pro přístup napište Tomovi.

### Web

1. Ověřte si instalaci Flutter Web pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run -d chrome --web-port 5500` nebo `flutter run -d web-server --release --web-port 5500` nebo `Run and debug -> [Web] debug` vlevo ve vscode
3. Vyhledejte si v konzoli prohlížeče nebo flutteru `debug`. Tam najdete App Check debug token. Tento token je potřeba pro chráněné online funkcionality firebase. [firebase v konzoli](https://console.firebase.google.com/project/_/appcheck/apps). Pro přístup napište Tomovi.

### Wireless debugging

- Silně nedoporučuji. Zatím je to moc nestabilní. iOS to má nativně, avšak je potřeba nejdřív spustit `flutter run` a potom přípojit debugger pomocí `[Flutter Wireless] debug` v Vscode. Pokud se vám podaří připojit android, postup je stejný.
