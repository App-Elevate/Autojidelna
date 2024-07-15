# APPE Core

Core pro aplikace. Obsahuje template pro aplikace vytvořené v App Elevate.

## Spuštění aplikace

### Android

1. Ověřte si instalaci Android Studio a Android Emulatoru pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run` nebo `flutter run --release -PuseDebugSigningConfig=true`
3. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro firebase. Vložte ho do (firebase v konzoli)[https://console.firebase.google.com/project/_/appcheck/apps]

### iOS

1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Zažádejte u toma o přidání vašeho zařízení do Apple Developer portálu. Tom k tomu bude potřebovat vaše [UDID zařízení](https://www.igeeksblog.com/how-to-find-iphone-udid-number/#h-2-how-to-find-iphone-s-udid-using-mac) na které budete aplikaci instalovat.
3. Získejte spoječné vývojářské klíče pomocí `sh scripts/ios_get_keys.sh`
4. Spusťte aplikaci pomocí `flutter run` nebo `flutter run --release`
5. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro firebase. Vložte ho do (firebase v konzoli)[https://console.firebase.google.com/project/_/appcheck/apps]

### macos

1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Zažádejte u toma o přidání vašeho zařízení do Apple Developer portálu. Tom k tomu bude potřebovat vaše [UDID zařízení](https://www.igeeksblog.com/how-to-find-mac-udid/#h-how-to-find-udid-uuid-of-your-mac) na které budete aplikaci instalovat.
3. Získejte spoječné vývojářské klíče pomocí `sh scripts/macos_get_keys.sh`
4. Spusťte aplikaci pomocí `flutter run -d macos` nebo `flutter run -d macos --release`
5. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro firebase. Vložte ho do (firebase v konzoli)[https://console.firebase.google.com/project/_/appcheck/apps]

### Web

1. Ověřte si instalaci Flutter Web pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run -d chrome --web-port 5500` nebo `flutter run -d web-server --release --web-port 5500`
3. Vyhledejte si v konzoli `debug`. Tam najdete App Check debug token. Tento token je potřeba pro firebase. Vložte ho do (firebase v konzoli)[https://console.firebase.google.com/project/_/appcheck/apps]

### Wireless debugging

- Silně nedoporučuji. Zatím je to moc nestabilní. iOS to má nativně, avšak je potřeba nejdřív spustit `flutter run` a potom přípojit debugger pomocí `[Flutter Wireless] debug` v Vscode. Pokud se vám podaří připojit android, postup je stejný.

## Vývojářské nástroje

- Tento projekt používá build_runner pro automatické generování kódu. Pro spuštění je potřeba spustit `dart run build_runner watch` nebo `dart run build_runner build` pro jednorázový build.
- Toto musíte spustit určitě pokaždé, co přidáváte nové stránky.
- Doporučuje se build_runner spustit pokaždé co programujete
- Doporučené IDE je vscode s rozšířeními Flutter a dart

## Distribuce

Distribuce je automatická při merge do mainu. Verze se vezme z branche, který se merguje do mainu. např merge z branche `1.0.0` do mainu vytvoří release `1.0.0`. Build number se potom bere z počtu spuštěných github actions.

## Manuální Kompilace a distribuce

### Android

Pro kompilaci do release Módu pomocí `flutter build apk` nebo `flutter build appbundle` je potřeba mít App Elevate distribuční klíč. Tento klíč má případně k dispozici Tom. Lze však použít i debug klíč pomocí tohoto příkazu:

```bash
flutter build apk -PuseDebugSigningConfig=true
```

Nebo

```bash
flutter build appbundle -PuseDebugSigningConfig=true
```

V main branchi je nastavený automatický deployment na Google Play.

Pro přípravu na Google Play Store je připraven skript `compile_android.sh`. Tento skript nahraje debug symboly automaticky do Firebase. Následně stačí jen přidat release notes a nahrát soubor na Google Play Store.

```bash
sh ./scripts/compile_android.sh
```

### iOS

Pro kompilaci do release módu je připraven skript `compile_ios.sh`. Tento skript automaticky nahraje soubor na App Store. Pokud nemáte soukromý klíč pro publikování na App Store, budete muset mít nainstalovanou aplikaci [Transporter](https://apps.apple.com/cz/app/transporter/id1450874784?mt=12).

```bash
sh ./scripts/compile_ios.sh
```

`flutter build ios --release` funguje, avšak není moc užitečný.
`flutter build ipa` sice skončí u generování xcarchive, ale následně lze dokončit v xcode:

```bash
open ./build/ios/archive/Runner.xcarchive
```

### macos

Pro kompilaci do release módu je připraven skript `compile_macos.sh`. Tento skript automaticky nahraje soubor na App Store. Pokud nemáte soukromý klíč pro publikování na App Store, budete muset mít nainstalovanou aplikaci [Transporter](https://apps.apple.com/cz/app/transporter/id1450874784?mt=12).

```bash
sh ./scripts/compile_macos.sh
```

### Web

Pro kompilaci do release Módu stačí použít klasicky `flutter build web --release`.

Web se vám postaví do složky `build/web` a tuto složku můžete nahrát na váš server.

V main branchi je nastavený automatický deployment na cloudflare pages pomocí branche dist-cloudflare-pages.

V main branchi je také nastavený automatický deployment na github pages pomocí Actions.

V main branchi je také nastavený automatický deployment na Firebase Hosting pomocí Actions.

Pro manuální deployment na cloudflare pages stačí spustit:

```bash
sh ./scripts/deploy_cloudflare_pages.sh
```

# Omezení implementace CORU

1. firebase_options.dart MUSÍ být v /lib/firebase_options.dart

## iOS

1. Je potřeba po každém přidání entitlementu zapnout automatické podepisování v Xcode a následně ho vypnout. Potom už stačí jen regenerovat certifikáty pomocí fastlane match:

```bash
cd ios && bundle install && bundle exec fastlane match appstore --force && bundle exec fastlane match development --force && cd ..
```

a následně znovu buildnout aplikaci. Toto musí udělat Tom, protože je potřeba mít přístup k certifikátům.

## macOS

1. Je potřeba po každém přidání entitlementu zapnout automatické podepisování v Xcode a následně ho vypnout. Potom už stačí jen regenerovat certifikáty pomocí fastlane match:

```bash
cd macos && bundle install && bundle exec fastlane match appstore --additional-cert-types=mac_installer_distribution --force --platform=macos && bundle exec fastlane match development --force --platform=macos && cd ..
```

a následně znovu buildnout aplikaci. Toto musí udělat Tom, protože je potřeba mít přístup k certifikátům.
