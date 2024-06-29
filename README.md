# core

Core pro aplikace. Obsahuje template pro aplikace vytvořené v App Elevate

## Spuštění aplikace

### Android

1. Ověřte si instalaci Android Studio a Android Emulatoru pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run` nebo `flutter run --release --PuseDebugSigningConfig`

### iOS

1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Získejte spoječné vývojářské klíče pomocí `sh ios_get_keys.sh`
3. Spusťte aplikaci pomocí `flutter run` nebo `flutter run --release`

### macos

1. Ověřte si instalaci Xcode a iOS simulátoru pomocí `flutter doctor`
2. Získejte spoječné vývojářské klíče pomocí `sh ios_get_keys.sh`
3. Spusťte aplikaci pomocí `flutter run -d macos` nebo `flutter run -d macos --release`

### Web

1. Ověřte si instalaci Flutter Web pomocí `flutter doctor`
2. Spusťte aplikaci pomocí `flutter run -d chrome` nebo `flutter run -d web-server --release`

## Distribuce

Distribuce je automatická při merge do mainu. Verze se vezme z branche, který se merguje do mainu. např merge z branche `1.0.0` do mainu vytvoří release `1.0.0`. Build number se potom bere z počtu spuštěných github actions

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
sh ./compile_android.sh
```

### iOS

Pro kompilaci do release módu je připraven skript `compile_ios.sh`. Tento skript automaticky nahraje soubor na App Store. Pokud nemáte soukromý klíč pro publikování na App Store, budete muset mít nainstalovanou aplikaci [Transporter](https://apps.apple.com/cz/app/transporter/id1450874784?mt=12).

```bash
sh ./compile_ios.sh
```

`flutter build ios --release` funguje, avšak není moc užitečný.
`flutter build ipa` sice skončí u generování xcarchive, ale následně lze dokončit v xcode:

```bash
open open ./build/ios/archive/Runner.xcarchive
```

### macos

Pro kompilaci do release Módu stačí použít klasicky `flutter build macos`.

Pro přípravu na Mac App Store je připraven skript `compile_macos.sh`.

```bash
sh ./compile_macos.sh
```

Po nahrání je potřeba otevřít Xcode -> archive -> kompilování... -> Distribovat -> App Store

```bash
open macos/Runner.xcworkspace
```

### Web

Pro kompilaci do release Módu stačí použít klasicky `flutter build web --release`.

Web se vám postaví do složky `build/web` a tuto složku můžete nahrát na váš server.

V main branchi je nastavený automatický deployment na cloudflare pages pomocí branche dist-cloudflare-pages.

V main branchi je také nastavený automatický deployment na github pages pomocí Actions.

V main branchi je také nastavený automatický deployment na Firebase Hosting pomocí Actions.

Pro manuální deployment na cloudflare pages je potřeba si nainstalovat peanut:

```bash
flutter pub global activate peanut
```

následně stačí spustit:

připravený skript

```bash
sh ./deploy_cloudflare_pages.sh
```

# Vytváření nové aplikace

## Vytvoření nového projektu

1. Vytvořte si nový repozitář na githubu (fork)

### název

1. změňte všechny výskyty `APPE Coree` na název vaší aplikace (V celé složce, pomocí např. find and replace ve vscode. Je to ověřené, nic to nerozbije)
2. změňte všechny výskyty `coree` na název vaší aplikace (bacha ne `core` ale `coree`)

### ikonky

1. [Vytvořte ikonky pro android/ios/macos](https://www.appicon.co/#app-icon) - JE důležité nahrát ikonku v JPG formátu a ne PNG. PNG je ok ale bez transparentního pozadí
2. Vložte ikonky do složky [android/app/src/main/res](android/app/src/main/res) u android a [ios/Runner/Assets.xcassets/AppIcon.appiconset](ios/Runner/Assets.xcassets/AppIcon.appiconset) u ios
3. Vložte ikonky do složky [macos/Runner/Assets.xcassets/AppIcon.appiconset](macos/Runner/Assets.xcassets/AppIcon.appiconset) u macos
4. Vytvořte favicony pro [webovou aplikaci](https://www.favicon-generator.org/) (nezapoměňte odškrtnout `Include your favicon.ico in the public gallery`)
5. Vložte favicony do složky [web/icons](web/icons)

### Splash screeny

1. Nahrajte transparentní png soubor [na web](https://www.appicon.co/#app-icon)
2. Vytáhněte si z `Assets.xcassets/AppIcon.appiconset` ikonku 512.png, zkopírujte si jí jinam, přejmenujte na LaunchImage.png a nahrajte ji sem: [https://www.appicon.co/#image-sets](https://www.appicon.co/#image-sets)
3. Vytáhněte si LaunchImage a vložte do [ios/Runner/Assets.xcassets/LaunchImage.imageset](ios/Runner/Assets.xcassets/LaunchImage.imageset)

### **Matějova část -- insert instructions here -- **

### Firebase

1. Vytvořte nový projekt v Firebase.
2. Spusťte

```bash
flutterfire configure
```

3.

## První deployment

Povolte Github Actions pro nový repozitář (App Elevate -> Settings -> Actions)

### Android

1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `ANDROID_KEYSTORE_BASE64` - keystore ve kterém je uložený klíč pro podepisování aplikace
- `ANDROID_KEY_ALIAS` - alias klíče
- `ANDROID_KEY_PASSWORD` - heslo klíče
- `ANDROID_STORE_PASSWORD` - další heslo klíče
- `GOOGLE_PLAY_SERVICE_ACCOUNT` - service account pro přístup k google play. Tento účet je vytvořený pod projektem app-elevate-core a využívá jeho api.

2. Vytvořte novou aplikaci v Google Play Console
3. Přidejte práva uživateli `google-play-github-actions@app-elevate-core.iam.gserviceaccount.com` a to toto: `Release apps to testing tracks` na nově vytvořenou aplikaci
4. Nahrajte manuálně první verzi aplikace (buďto z artefaktu nebo manuálně pomocí `sh compile_android.sh`)
5. Nyní se vám automaticky vytvoří nový release při každém mergu do mainu

### iOS

1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `IOS_APPSTORE_CERT_BASE64` - certifikát pro nahrání na App Store
- `IOS_KEYS_MATCH_PASSWORD` - heslo pro certifikáty uložené v repo ios-keys
- `IOS_KEYS_PAT` - Personal Access Token pro přístup k repo ios-keys

2. Vytvořte novou aplikaci v App Store Connect
3. inicializujte klíče pomocí fastlane match (je potřeba být přihlášený jako majitel klíčů - Tom)

```bash
cd ios && bundle install && bundle exec fastlane match appstore
bundle exec fastlane match
```

### Cloudflare Pages

1. Vytvořte nový projekt v Cloudflare Pages a nastavte automatický deployment pro branch `dist-cloudflare-pages`
2. Nastavte alternativní doménu.
3. Nyní se vám automaticky vytvoří nový deployment při každém mergu do mainu

### Github Pages

1. Zapněte Github Pages v nastavení repozitáře.
2. Přidejte doménu do nastavení Github Pages
3. Nyní se vám automaticky vytvoří nový deployment při každém mergu do mainu

### Firebase Hosting

1. `firebase init`
2. Vyberte hosting
3. Vyberte projekt
4. Vyberte složku `build/web`
5. Single page app - yes
6. setup automatic deployment - yes
7. Vložte `app-elevate/nazev-repa` jako repozitar
8. Set up workflow to run a build script before every deploy - no
9. Set up automatic deployment to your site's live channel when a PR is merged - no

10. Otevřte si workflow soubor, který vám vytvořil Firebase.
11. Zkopírujte řádek s `firebaseServiceAccount` a nahraďte existující řádek v [deploy_web_firebase.yml](.github/workflows/deploy_web_firebase.yml) (téměř na konci souboru)
    příklad:

```yaml
firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT_APP_ELEVATE_CORE }}
```

12. Smažte workflow soubor vytvořený firebase

# Omezení implementace CORU

1. firebase_options.dart MUSÍ být v /lib/firebase_options.dart
