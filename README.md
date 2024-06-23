# core

Core pro aplikace. Obsahuje template pro aplikace vytvořené v App Elevate

## Spuštění aplikace

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
2. Otevřete projekt v Xcode pomocí `open macos/Runner.xcworkspace`
2. Změňte klíč v targetu Runner na váš vlastní vývojářský klíč
3. Spusťte aplikaci pomocí `flutter run -d macos` nebo `flutter run -d macos --release`

### Web
1. Ověřte si instalaci Flutter Web pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run -d chrome` nebo `flutter run -d web-server --release`

## Distribuce

Distribuce je automatická při merge do mainu. Verze se vezme z branche, který se merguje do mainu. např merge z branche `1.0.0` do mainu vytvoří release `1.0.0`. Build number se potom bere z počtu spuštěných github actions

## Manuální Kompilace a distribuce

### Android

Pro kompilaci do release Módu pomocí `flutter build apk` je potřeba mít App Elevate distribuční klíč. Lze však použít i debug klíč pomocí tohoto příkazu:

```bash
flutter build apk -PuseDebugSigningConfig=true
```

Nebo

```bash
flutter build appbundle -PuseDebugSigningConfig=true
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

# Vytváření nové aplikace

## Vytvoření nového projektu
1. Vytvořte si nový repozitář na githubu (fork)
2. změňte všechny výskyty `core` na název vaší aplikace
3. změňte všechny výskyty `App Elevate Core` na název vaší aplikace
4. [Vytvořte ikonky pro android/ios/macos](https://www.appicon.co/#app-icon) - JE důležité nahrát ikonku v JPG formátu a ne PNG. PNG je ok ale bez transparentního pozadí
5. Vložte ikonky do složky [android/app/src/main/res](android/app/src/main/res) u android a [ios/Runner/Assets.xcassets/AppIcon.appiconset](ios/Runner/Assets.xcassets/AppIcon.appiconset) u ios
6. Vložte ikonky do složky [macos/Runner/Assets.xcassets/AppIcon.appiconset](macos/Runner/Assets.xcassets/AppIcon.appiconset) u macos
7. Vytvořte favicony pro [webovou aplikaci](https://www.favicon-generator.org/) (nezapoměňte odškrtnout `Include your favicon.ico in the public gallery`kl)
8. Vložte favicony do složky [web/icons](web/icons)
9. Vytvořte nový projekt v Firebase.
10. Spusťte
```bash
flutterfire configure
```


## První deployment

### Android
1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):
- `ANDROID_KEYSTORE_BASE64` - keystore ve kterém je uložený klíč pro podepisování aplikace
- `ANDROID_KEY_ALIAS` - alias klíče
- `ANDROID_KEY_PASSWORD` - heslo klíče
- `ANDROID_STORE_PASSWORD` - další heslo klíče
- `GOOGLE_PLAY_SERVICE_ACCOUNT` - service account pro přístup k google play. Tento účet je vytvořený pod projektem app-elevate-core a využívá jeho api.
