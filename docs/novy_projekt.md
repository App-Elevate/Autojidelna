# Vytváření nové aplikace

## Vytvoření nového projektu

1. Vytvořte si nový repozitář na githubu (fork)

### název

1. změňte všechny výskyty `APPE Coree` na název vaší aplikace (V celé složce, pomocí např. find and replace ve vscode. Je to ověřené, nic to nerozbije).
2. změňte všechny výskyty `APPECOREE` na název vaší aplikace (V macos složce, pomocí např. find and replace ve vscode. Je to ověřené, nic to nerozbije)
3. změňte všechny výskyty `coree` na název vaší aplikace (bacha ne `core` ale `coree`)
4. změňte všechny výskyty `APPE Coree description` na popis vaší aplikace
5. změňte všechny výskyty `6G8NMAQR5W` na váš developer id u apple - je to důležité pro fastline a deeplinking

### ikonky

1. [Vytvořte ikonky pro ios/macos](https://www.appicon.co/#app-icon) - JE důležité nahrát ikonku v JPG formátu a ne PNG. PNG je ok ale bez transparentního pozadí
2. Vytvořte ikonky pro android pomocí image asset studio v android studiu
3. Vložte ikonky do složky [ios/Runner/Assets.xcassets/AppIcon.appiconset](ios/Runner/Assets.xcassets/AppIcon.appiconset) u ios
4. Vložte ikonky do složky [macos/Runner/Assets.xcassets/AppIcon.appiconset](macos/Runner/Assets.xcassets/AppIcon.appiconset) u macos
5. Vytvořte favicony pro [webovou aplikaci](https://www.favicon-generator.org/) (nezapoměňte odškrtnout `Include your favicon.ico in the public gallery`)
6. Vložte favicony do složky [web/icons](web/icons)

### Splash screeny

1. Nahrajte transparentní png soubor [na web](https://www.appicon.co/#app-icon)
2. Vytáhněte si z `Assets.xcassets/AppIcon.appiconset` ikonku 512.png, zkopírujte si jí jinam, přejmenujte na LaunchImage.png a nahrajte ji sem: [https://www.appicon.co/#image-sets](https://www.appicon.co/#image-sets)
3. Vytáhněte si LaunchImage a vložte do [ios/Runner/Assets.xcassets/LaunchImage.imageset](ios/Runner/Assets.xcassets/LaunchImage.imageset)

### **Matějova část -- insert instructions here -- **

### Deep linking

1. Využijte automatického podepisování na google play a nahraďte první sha256 v (assetlinks.json)[web/.well-known/assetlinks.json]
2. přepište url na vaši doménu - `core.appelevate.cz` ve vscode replace
3. Nahrajte .well-known složku na váš webserver, aby byl dostupný na `https://vase-domena/.well-known/assetlinks.json`

### Firebase

1. Vytvořte nový projekt v Firebase.
2. Spusťte

```bash
sh scripts/flutterfire_configure.sh
```

3. Zkontrolujte, že zkompiluje macOS a že byly vytvořeny tři aplikace - iOS, Android a Web

### [Firebase App Check](https://console.firebase.google.com/u/0/project/_/appcheck/apps)

1. Je potřeba nahrát klíč pro deviceCheck fo firebase. Tento klíč má tom v klíčence developer accountu. V opačném případě se dá vytvořit. Tento klíč se potom přidá do deviceCheck v firebase.
2. Je potřeba vzít sha-256 a sha-1 z google play a nahrát je [na firebase](https://console.firebase.google.com/u/0/project/app-elevate-core/settings/general/android) + Zapnout play Integrity v Google play. Potom ještě zapnout [zde v firebase](https://console.firebase.google.com/u/0/project/_/appcheck/apps).
3. Vytvořte captchu klíč pro web [zde pro recaptcha v3](https://www.google.com/recaptcha/admin/create) nebo ještě lépe [zde pro recaptcha enterprise](https://console.cloud.google.com/security/recaptcha)

### Google Sign In

1. Registrujte google ve [firebase auth](https://console.firebase.google.com/project/_/authentication/providers)
2. [Nastavte consent screen podle potřeb](https://console.cloud.google.com/apis/credentials/consent)
3. [Stáhněte si Google-Service_info.plist](https://console.firebase.google.com/_/app-elevate-core/settings/general/ios) (nevkládejte do projektu)
4. [Postupujte dle instrukcí zde](https://pub.dev/packages/google_sign_in_ios#macos-setup) - je potřeba udělat všechny kroky pro iOS i MacOS.
5. [Získejte id Oauth klíče pro web a nahraďte již existující v index.html:](https://console.cloud.google.com/apis/credentials)

```html
<meta
  name="google-signin-client_id"
  content="466976066624-flggbo7lv9782nok34diek7f3mg2c4mr.apps.googleusercontent.com"
/>
```

### Login with apple

1. [Nastavte si apple sign in](https://console.firebase.google.com/project/_/authentication/providers)
2. [Následujte instrukce zde](https://firebase.google.com/docs/auth/ios/apple?hl=en&authuser=0)

### Firebase Analytics

1. Povolte Analytics a crashlytics ve Firebase
2. Přidejte dimenze, které naleznete v [analytics.dart](lib/src/_conf/analytics.dart)

### Assety

1. Vyměňte assets/app_favicon.web a assets_dev/app_favicon.png za favicony vaší aplikace

## První deployment

1. Povolte Github Actions pro nový repozitář (App Elevate -> Settings -> Actions)
2. Vypněte Platformy, které nepoužíváte tím, že okomentujete `if: cokoliv` a nahradíte `if: false`
3. Odstraňte debug sha256 hash z [assetlinks.json](web/.well-known/assetlinks.json#L9) (je to ten druhý na řádku 9)

### Android

1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `ANDROID_KEYSTORE_BASE64` - keystore ve kterém je uložený klíč pro podepisování aplikace
- `ANDROID_KEY_ALIAS` - alias klíče
- `ANDROID_KEY_PASSWORD` - heslo klíče
- `ANDROID_STORE_PASSWORD` - další heslo klíče
- `GOOGLE_PLAY_SERVICE_ACCOUNT` - service account pro přístup k google play. Tento účet je vytvořený pod projektem app-elevate-core a využívá jeho api.

2. Vytvořte novou aplikaci v Google Play Console
3. Přidejte práva uživateli `google-play-github-actions@app-elevate-core.iam.gserviceaccount.com` a to toto: `Release apps to testing tracks` na nově vytvořenou aplikaci
4. Nahrajte manuálně první verzi aplikace (buďto z artefaktu nebo manuálně pomocí `sh scripts/compile_android.sh`)
5. Nyní se vám automaticky vytvoří nový release při každém mergu do mainu

### iOS

1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `IOS_APPSTORE_CERT_BASE64` - účet pro nahrání na App Store - linknutý na tým, každý tým musí mít svůj certifikát. Je to certifikát v .p8 formátu zakódovaný do base64
- `IOS_KEYS_MATCH_PASSWORD` - heslo pro certifikáty uložené v repo ios-keys
- `IOS_KEYS_PAT` - Personal Access Token pro přístup k repo ios-keys, tento token je ve formátu `username:token` a je potřeba ho vytvořit na githubu v fine-grained personal access tokens. Příklad: `tom:github_pat_0abcdef1234567890abcdef1234567890abcdef1234567890abcdef`. Tento token se následně zakóduje do base64 a uloží do secrets jako `IOS_KEYS_PAT`

2. Vytvořte novou aplikaci v App Store Connect
3. Nakonfigurujte [AppFile](ios/fastlane/Appfile), aby souvisely hodnoty s vaším týmem v App Store Connect. Toto můžete udělat jak manuálně, tak pomocí

```bash
cd ios && bundle install && bundle exec fastlane match init && cd ..
```

4. inicializujte klíče pomocí fastlane match (je potřeba být přihlášený jako majitel klíčů - obvykle Tom)

```bash
cd ios && bundle install && bundle exec fastlane match appstore
bundle exec fastlane match
```

5. Nastavte v xcode provisioning profile na `match development xx`

### macos

1. Povolte Organizační secrety pro nový repozitář (App Elevate -> Settings -> secrets and variables -> actions):

- `IOS_APPSTORE_CERT_BASE64` - účet pro nahrání na App Store - linknutý na tým, každý tým musí mít svůj certifikát. Je to certifikát v .p8 formátu zakódovaný do base64
- `IOS_KEYS_MATCH_PASSWORD` - heslo pro certifikáty uložené v repo ios-keys
- `IOS_KEYS_PAT` - Personal Access Token pro přístup k repo ios-keys, tento token je ve formátu `username:token` a je potřeba ho vytvořit na githubu v fine-grained personal access tokens. Příklad: `tom:github_pat_0abcdef1234567890abcdef1234567890abcdef1234567890abcdef`. Tento token se následně zakóduje do base64 a uloží do secrets jako `IOS_KEYS_PAT`

2. Vytvořte novou aplikaci v App Store Connect
3. Nakonfigurujte [AppFile](macos/fastlane/Appfile), aby souvisely hodnoty s vaším týmem v App Store Connect. Toto můžete udělat jak manuálně, tak pomocí

```bash
cd macos && bundle install && bundle exec fastlane match init && cd ..
```

4. inicializujte klíče pomocí fastlane match (je potřeba být přihlášený jako majitel klíčů - obvykle Tom)

```bash
cd macos && bundle install && bundle exec fastlane match appstore --additional_cert_types=mac_installer_distribution
bundle exec fastlane match
```

5. Nastavte v xcode provisioning profile na `match appstore xx` pro release a `match development xx` pro debug a profile

### Web

1. Je potřeba vytvořit recaptcha klíč pro (web)[https://cloud.google.com/recaptcha/docs/create-key-website?hl=en&authuser=0]

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
11. Zkopírujte řádek s `firebaseServiceAccount` a nahraďte existující řádek v [deploy_everything.yml](/.github/workflows/deploy_everything.yml#L240) (téměř na konci části firebase hostingu)
    příklad:

```yaml
firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT_APP_ELEVATE_CORE }}
```

12. Smažte workflow soubor vytvořený firebase
