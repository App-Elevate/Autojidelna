# Vytváření nové aplikace

## Vytvoření nového projektu

1. Vytvořte si nový repozitář na githubu (fork)

### název

1. změňte všechny výskyty `APPE Coree` na název vaší aplikace (V celé složce, pomocí např. find and replace ve vscode. Je to ověřené, nic to nerozbije).
2. změňte všechny výskyty `APPE_Coree` na název vaší aplikace (V macos složce, pomocí např. find and replace ve vscode. Udržte stejnou strukturu. Tento název nepodporuje mezery a speciální znaky)
3. změňte všechny výskyty `coree` na název vaší aplikace (bacha ne `core` ale `coree`). Toto je app_id a je důležité, aby bylo unikátní. U vybírání jména u iOS používat camel case u android snake case.
4. změňte všechny výskyty `APPE Coree description` na popis vaší aplikace
5. změňte všechny výskyty `6G8NMAQR5W` na váš developer tým u apple - je to důležité pro fastline a deeplinking
6. změňte výskyt `3rd Party Mac Developer Installer: TOM\xC3\x81\xC5\xA0 PROTIVA (6G8NMAQR5W)` na váš developer tým u apple - je to důležité pro macos

### ikonky

1. [Vytvořte ikonky pro ios/macos](https://www.appicon.co/#app-icon) - JE důležité nahrát ikonku v JPG formátu a ne PNG. PNG je ok ale bez transparentního pozadí
2. Vytvořte ikonky pro android pomocí image asset studio v android studiu
3. Vyberte vlevo místo projektu android (v projekt navigátoru)
4. kliněte pravým tlačítkem na res a vyberte new -> Image Asset
5. Vložte ikonky do složky [ios/Runner/Assets.xcassets/AppIcon.appiconset](../ios/Runner/Assets.xcassets/AppIcon.appiconset) u ios
6. Vložte ikonky do složky [macos/Runner/Assets.xcassets/AppIcon.appiconset](../macos/Runner/Assets.xcassets/AppIcon.appiconset) u macos
7. Vytvořte favicony pro [webovou aplikaci](https://www.favicon-generator.org/) (nezapoměňte odškrtnout `Include your favicon.ico in the public gallery`)
8. Vložte favicony do složky [web/icons](../web/icons) bez manifestu.

### Splash screeny

1. Nahrajte transparentní png soubor [na web](https://www.appicon.co/#app-icon)
2. Vytáhněte si z `Assets.xcassets/AppIcon.appiconset` ikonku 512.png, zkopírujte si jí jinam, přejmenujte na LaunchImage.png a nahrajte ji sem: [https://www.appicon.co/#image-sets](https://www.appicon.co/#image-sets)
3. Vytáhněte si LaunchImage a vložte do [../ios/Runner/Assets.xcassets/LaunchImage.imageset](ios/Runner/Assets.xcassets/LaunchImage.imageset)
4. Zkontrolujte ios/Runner/LaunchScreen.storyboard a upravte splash screen podle potřeb. To může být například jiná barva pozadí...
5. Zkontrolujte barvu pozadí u androidu v [../android/app/src/main/res/values/ic_launcher_background.xml](android/app/src/main/res/values/ic_launcher_background.xml) a upravte podle potřeb

### **Matějova část -- insert instructions here -- **

### Vytvořte Aplikaci v Google Play Console a App Store Connect

### Vytvořte novou aplikaci v shorebird:

```bash
rm -f shorebird.yaml
shorebird init
```

### První build

1. Vytvořte novou aplikaci pomocí fastlane match:

```bash
cd ios && bundle install && bundle exec fastlane produce -u protitom@icloud.com -a cz.appelevate.coree --skip_itc && bundle exec fastlane produce -u protitom@icloud.com -a cz.appelevate.coree.ImageNotification --skip_itc && cd ..
cd macos && bundle install && bundle exec fastlane produce -u protitom@icloud.com -a cz.appelevate.coree --skip_itc && cd ..
```

2. inicializujte klíče pomocí fastlane match (je potřeba být přihlášený jako majitel klíčů - obvykle Tom)

```bash
cd ios && bundle install && bundle exec fastlane match appstore && bundle exec fastlane match && cd ..
```

3.  inicializujte klíče pomocí fastlane match (je potřeba být přihlášený jako majitel klíčů - obvykle Tom)

```bash
cd macos && bundle install && bundle exec fastlane match appstore --additional_cert_types=mac_installer_distribution && bundle exec fastlane match && cd ..
```

4. Nastavte v xcode provisioning profile u obou platforem na `match development xx` a zároveň u notification extension na `match development xx`

5. Vytvořte commit

6. Přepněte release u obou platforem a targetů na `match appstore xx`

7. Vytvořte commit

8. Přepněte release u obou platforem a targetů na `match development xx`

9. Vytvořte commit

10. nahraďte původní hash committem 1. kroku ve workflow souboru v [codemagic.yaml](../codemagic.yaml#L21)

### Firebase

1. Vytvořte nový projekt v Firebase.
2. V [.firebaserc](../.firebaserc) změňte `app-elevate-core` na název vašeho projektu ve firebase
3. Spusťte

```bash
flutterfire configure
```

4. Zapněte `run for install builds only` v xcode pro macos pro krok flutterfire: upload symbols

```bash
open macos/Runner.xcworkspace
```

5. Zkontrolujte, že zkompiluje macOS a že byly vytvořeny tři aplikace - iOS, Android a Web

### Assety

1. Vyměňte assets/app_favicon.webp a assets_dev/app_favicon.webp za favicony vaší aplikace

## První deployment

1. Povolte Github Actions pro nový repozitář (App Elevate -> Settings -> Actions)
2. Vypněte Platformy, které nepoužíváte tím, že okomentujete `if: cokoliv` a nahradíte `if: false`
3. Odstraňte debug sha256 hash z [assetlinks.json](../web/.well-known/assetlinks.json#L9) (je to ten druhý na řádku 9)

### Sentry

1. Povolte Organizační secret pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `SENTRY_AUTH_TOKEN` - token pro přístup k Sentry

2. V [pubspec.yaml](../pubspec.yaml) Vyplňte project a org

3. V [main.dart](../lib/main.dart) vyplňte dsn

4. Ve fastfile v [ios/fastlane/Fastfile](../ios/fastlane/Fastfile#L67) vyplňte project a org

5. Ve fastfile v [ios/fastlane/Fastfile](../ios/fastlane/Fastfile#L95) vyplňte project a org

6. V fastfile v [macos/fastlane/Fastfile](../macos/fastlane/Fastfile#L73) vyplňte project a org

7. V fastfile v [macos/fastlane/Fastfile](../macos/fastlane/Fastfile#L101) vyplňte project a org

### Android

1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `ANDROID_KEYSTORE_BASE64` - keystore ve kterém je uložený klíč pro podepisování aplikace
- `ANDROID_KEY_ALIAS` - alias klíče
- `ANDROID_KEY_PASSWORD` - heslo klíče
- `ANDROID_STORE_PASSWORD` - další heslo klíče
- `GOOGLE_PLAY_SERVICE_ACCOUNT` - service account pro přístup k google play. Tento účet je vytvořený pod projektem app-elevate-core a využívá jeho api.
- `SHOREBIRD_TOKEN` - token pro přístup k shorebird

2. Vytvořte novou aplikaci v Google Play Console
3. Přidejte práva uživateli `google-play-github-actions@app-elevate-core.iam.gserviceaccount.com` a to toto: `Release apps to testing tracks` na nově vytvořenou aplikaci
4. Přepněte způsob nahrávání na Google Play na `draft` místo `completed` v [tomto](../.github/workflows/deploy_everything.yml#L500) a [tomto](../scripts/deploy_android.sh#L38) souboru. Po ověření jména aplikace a ikonky můžete přepnout zpět na `completed`
5. Nahrajte manuálně první verzi aplikace (buďto z artefaktu nebo manuálně pomocí `sh scripts/compile_android.sh`) - je však potřeba nahrát daný soubor, nestačí jen spustit skript s klíčem.
6. Nyní se vám automaticky vytvoří nový release při každém mergu do mainu

### iOS

1. Vytvořte novou aplikaci v codemagic.
2. Stáhněte všechny provisioning profily pro aplikaci
3. Přidejte certifikáty pro iOS z vaší klíčenky.
4. Ujistěte se, že všechny tyto jsou nastaveny pro váš apple dev tým v codemagic:

- `SENTRY_AUTH_TOKEN` - token pro přístup k Sentry,
- `SHOREBIRD_TOKEN` - token pro přístup k shorebird

6. Vytvořte novou aplikaci v App Store Connect
7. Nakonfigurujte [AppFile](../ios/fastlane/Appfile), aby souvisely hodnoty s vaším týmem v App Store Connect. Toto můžete udělat jak manuálně, tak pomocí

```bash
cd ios && bundle install && bundle exec fastlane match init && cd ..
```

8. Otestujte, že vše funguje pomocí

```bash
sh scripts/deploy_ios.sh
```

9. potom spusťte build na codemagic.

10. Zkopírujte codemagic id aplikace (z url, když máte otevřený build, tak to je první string) a vložte ho jako variable `CODEMAGIC_APP_ID` do Github repo

### macos

1. Vytvořte novou aplikaci v codemagic.
2. Stáhněte všechny provisioning profily pro aplikaci
3. Přidejte certifikáty pro macOS z vaší klíčenky.
4. Ujistěte se, že všechny tyto jsou nastaveny pro váš apple dev tým v codemagic:

- `MATCH_PASSWORD` - heslo pro certifikáty uložené v repo ios-keys
- `MATCH_GIT_BASIC_AUTHORIZATION` - Personal Access Token pro přístup k repo ios-keys, tento token je ve formátu `username:token`. Příklad: `tom:github_pat_0abcdef1234567890abcdef1234567890abcdef1234567890abcdef`. Tento token se následně zakóduje do base64 a uloží se do codemagic secretů jako `MATCH_GIT_BASIC_AUTHORIZATION`
- `SENTRY_AUTH_TOKEN` - token pro přístup k Sentry, stejný jako pro github actions
- `SHOREBIRD_TOKEN` - token pro přístup k shorebird

5. Vytvořte novou aplikaci v App Store Connect
6. Nakonfigurujte [AppFile](../macos/fastlane/Appfile), aby souvisely hodnoty s vaším týmem v App Store Connect. Toto můžete udělat jak manuálně, tak pomocí

```bash
cd macos && bundle install && bundle exec fastlane match init && cd ..
```

7. Otestujte, že vše funguje pomocí

```bash
sh scripts/deploy_macos.sh
```

8. potom spusťte build na codemagic.

9. Zkopírujte codemagic id aplikace (z url, když máte otevřený build, tak to je první string) a vložte ho jako variable `CODEMAGIC_APP_ID` do Github repo

### Cloudflare Pages

1. Vytvořte nový projekt v Cloudflare Pages a nastavte automatický deployment pro branch `dist-cloudflare-pages`
2. Nastavte alternativní doménu.
3. Klikněte si na doménu, kterou vlastníte a vpravo najděte kolonku API. Tam najdete Zone ID. Tento ZONE ID vložte do variables v Githubu jako `CLOUDFLARE_ZONE_ID`
4. Vytvořte hned pod tímto API klíč s právy `Purge Cache` a vložte ho do Githubu jako `CLOUDFLARE_PURGE_KEY`
5. Nyní se vám automaticky vytvoří nový deployment při každém mergu do mainu

### Github Pages

1. Zapněte Github Pages v nastavení repozitáře.
2. Přidejte doménu do nastavení Github Pages
3. Nyní se vám automaticky vytvoří nový deployment při každém mergu do mainu

### Firebase Hosting

1. `firebase init`
2. Vyberte hosting
3. Vyberte projekt
4. Vyberte složku `build/web`
5. Configure as a single-page app (rewrite all urls to /index.html) - no
6. setup automatic deployment - yes
7. Vložte `app-elevate/nazev-repa` jako repozitar
8. Set up workflow to run a build script before every deploy - no
9. Set up automatic deployment to your site's live channel when a PR is merged - no

10. Otevřte si workflow soubor, který vám vytvořil Firebase.
11. Zkopírujte řádek s `firebaseServiceAccount` a nahraďte existující řádek v [deploy_everything.yml](../.github/workflows/deploy_everything.yml#L366) (téměř na konci části firebase hostingu)
    příklad:

```yaml
firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT_APP_ELEVATE_CORE }}
```

12. Hned vedle toho upravte `firebaseProjectId` na váš projekt v firebase

13. Smažte workflow soubor vytvořený firebase

### Pravidla a Github Repozitář

1. Přeneste všechny variably a upravte je do nového repozitáře

`CLOUDFLARE_PAGES_URL` - url vašeho cloudflare pages
`CLOUDFLARE_ZONE_ID` - zone id vašeho cloudflare
`COMMENT_CLOSED` - komentář, který se má napsat, když se PR zavře kvůli špatnému názvu
`COMMENT_NICE` - komentář, který se má napsat, když PR projde zkouškou
`FIREBASE_HOSTING_URL` - url vašeho firebase hosting
`FLUTTER_VERSION` - aktuální verze flutteru

2. Přeneste pravidla a upravte je do nového repozitáře

Rulesets:

`*` - vyžadovat signing a blokovat force pushe
`main` - restrict updates + deletions, vše co `*` a require pull request reviews a status checks to pass before merging
`version` - vše co `*` a require pull request before merging

### [Firebase App Check](https://console.firebase.google.com/u/0/project/_/appcheck/apps)

1. Je potřeba nahrát klíč pro deviceCheck fo firebase. Tento klíč má tom v klíčence developer accountu. V opačném případě se dá vytvořit. Tento klíč se potom přidá do deviceCheck v firebase.
2. Je potřeba vzít sha-256 a sha-1 z google play a nahrát je [na firebase](https://console.firebase.google.com/u/0/project/_/settings/general/android) + Zapnout play Integrity v Google play. Potom ještě zapnout [zde v firebase](https://console.firebase.google.com/u/0/project/_/appcheck/apps).
3. Vytvořte captchu klíč pro web [zde pro recaptcha v3](https://www.google.com/recaptcha/admin/create) nebo ještě lépe [zde pro recaptcha enterprise](https://console.cloud.google.com/security/recaptcha)
4. Nahraďte klíč v [App.dart](../lib/src/_global/app.dart#L100) a [index.html](../web/index.html#L123) (v url - `https://www.google.com/recaptcha/enterprise.js?render=6LfrH50pAAAAAGCGbAnEQoYXcA8Q3AlGobmwnNt_`)

### Deep linking

1. Využijte automatického podepisování na google play a nahraďte první sha256 v (assetlinks.json)[web/.well-known/assetlinks.json]
2. přepište url v souboru [AndroidManifest.xml](../android/app/src/main/AndroidManifest.xml) na vaši doménu
3. Přepište url v souboru [ios/Runner/Runner.entitlements](../ios/Runner/Runner.entitlements) na vaši doménu
4. Nahrajte .well-known složku na váš webserver, aby byl dostupný na `https://vase-domena/.well-known/assetlinks.json`. Pokud nahrajete na daný web flutter web, tak je to automaticky dostupné.

### Google Sign In

1. Registrujte google ve [firebase auth](https://console.firebase.google.com/project/_/authentication/providers)
2. [Nastavte consent screen podle potřeb](https://console.cloud.google.com/apis/credentials/consent). Je potřeba nastavit i doménu, která bude používat google sign in. (Stačí pouze production domény)
3. [Stáhněte si Google-Service_info.plist](https://console.firebase.google.com/project/_/settings/general/ios) (nevkládejte do projektu)
4. [Postupujte dle instrukcí zde](https://pub.dev/packages/google_sign_in_ios#macos-setup) - je potřeba udělat všechny kroky pro iOS i MacOS.
5. [Získejte id Oauth klíče pro web](https://console.cloud.google.com/apis/credentials) a nahraďte již existující v [index.html](../web/index.html). Nezapomeňte sem přidat všechny domény, které budou používat google sign in.

```html
<meta
  name="google-signin-client_id"
  content="466976066624-flggbo7lv9782nok34diek7f3mg2c4mr.apps.googleusercontent.com"
/>
```

6. Spusťte `flutterfire configure` a ověřte, že macos zkompiluje
7. Ve firebase přidejte doménu všech webů, které budou používat google sign in: [zde](https://console.firebase.google.com/u/0/project/_/authentication/settings)

### Login with apple

1. [Nastavte si apple sign in](https://console.firebase.google.com/project/_/authentication/providers)
2. [Následujte instrukce zde](https://firebase.google.com/docs/auth/ios/apple?hl=en&authuser=0)

### Firebase Analytics

1. Povolte Analytics a crashlytics ve Firebase
2. Přidejte dimenze, které naleznete v [analytics.dart](../lib/src/_conf/analytics.dart)

### Firebase Remote Config

1. Inicializujte hodnoty v [remote_config.dart](../lib/src/_global/providers/remote_config.dart#L110)
2. Na to můžete použít buďto [tento template](../dev_files/remote_config_template.json) nebo manuálně nahrát na [firebase](https://console.firebase.google.com/u/0/project/_/remoteconfig)
3. Zkontrolujte, že se hodnoty načítají v aplikaci

### Firebase messaging

1. Upravte hodnoty v [firebase-messaging-sw.js](../web/firebase-messaging-sw.js), tak aby souvisely s tím, co je v [firebase_options.dart](../lib/firebase_options.dart)
2. Nahrajte APNs certifikát do [firebase](https://console.firebase.google.com/u/0/project/_/settings/cloudmessaging/ios)
3. Tady hned vygenerujte vapid klíč pod web push certificates a vložte ho do [messaging.dart](../lib/src/_messaging/messaging.dart#L34)
