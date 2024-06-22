# core

Core pro aplikace. Obsahuje template pro aplikace vytvořené v App Elevate

## Spuštění

### Android

1. Ověřte si instalaci Android Studio a Android Emulatoru pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run` nebo `flutter run --release --PuseDebugSigningConfig=true`

### iOS
1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Otevřete projekt v Xcode pomocí `open ios/Runner.xcworkspace`
2. Změňte klíč v targetu Runner na váš vlastní vývojářský klíč
3. Spusťte aplikaci pomocí `flutter run` nebo `flutter run --release`

### macos
1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Otevřete projekt v Xcode pomocí `open ios/Runner.xcworkspace`
2. Změňte klíč v targetu Runner na váš vlastní vývojářský klíč
3. Spusťte aplikaci pomocí `flutter run -d macos` nebo `flutter run -d macos --release`

### Web
1. Ověřte si instalaci Flutter Web pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run -d chrome` nebo `flutter run -d web-server --release`


## Kompilace a distribuce

### Android

Pro kompilaci do release Módu pomocí `flutter build apk` je potřeba mít App Elevate distribuční klíč. Lze však použít i debug klíč pomocí tohoto příkazu:

```bash
flutter build apk -PuseDebugSigningConfig=true
```

Nebo

```bash
flutter build aab -PuseDebugSigningConfig=true
```

Pro přípravu na Google Play Store je připraven skript `compile_android.sh`. Tento skript nahraje debug symboly automaticky do Firebase. Spuštění tohoto skriptu je možné pouze pokud máte admina pro crashalytics a přístup k distribičnímu klíči. Následně stačí jen přidat release notes a nahrát soubor na Google Play Store.

```bash
sh ./compile_android.sh
```

### iOS


Pro kompilaci do release Módu stačí použít klasicky `flutter build ios` nebo `flutter build ipa`. Stále je potřeba mít vlastní vývojářský klíč. 

Pro změnu klíče stačí otevřít projekt v Xcode a změnit klíč v targetu Runner:
```bash
open ios/Runner.xcworkspace
```

Pro přípravu na App Store je připraven skript `compile_ios.sh`. Tento skript nahraje debug symboly automaticky do Firebase. Spuštění tohoto skriptu je možné pouze pokud máte admina pro crashalytics a přístup k distribučnímu klíči.

```bash
sh ./compile_ios.sh
```

Po spuštění skriptu stačí jen nahrát soubor na App Store pomocí aplikace Transporter.

### macos

Pro kompilaci do release Módu stačí použít klasicky `flutter build macos`. Stále je potřeba mít vlastní vývojářský klíč.

Pro změnu klíče stačí otevřít projekt v Xcode a změnit klíč v targetu Runner:
```bash
open macos/Runner.xcworkspace
```

Pro přípravu na Mac App Store je připraven skript `compile_macos.sh`. Tento skript nahraje debug symboly automaticky do Firebase. Spuštění tohoto skriptu je možné pouze pokud máte admina pro crashalytics a přístup k distribučnímu klíči.

```bash
sh ./compile_macos.sh
```

Po spuštění je potřeba otevřít Xcode -> archive -> kompilování... -> Distribovat -> App Store

```bash
open macos/Runner.xcworkspace
```

### Web

Pro kompilaci do release Módu stačí použít klasicky `flutter build web --release`.

Web se vám postaví do složky `build/web` a tuto složku můžete nahrát na server.

V main branchi je nastavený automatický deployment na cloudflare pages pomocí branche production

Pro manuální deployment je potřeba si nainstalovat peanut:

```bash
flutter pub global activate peanut
```

následně stačí spustit:

připravený skript `compile_web.sh`:

```bash
sh ./compile_web.sh
```
