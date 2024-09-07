## Lokální Kompilace a distribuce

# Lokální kompilace je zastaralá metoda. Toto slouží jen jako reference pro případ, že by automatická distribuce nefungovala.

Pro zmíněné metody je potřeba mít klíče pro:

- Android/iOS

  - Shorebird

- iOS/macOS

  - Distribuční certifikát
  - Entitlements
  - Appstore connect
  - Přístup k repozitáři ios-keys
  - Heslo k repozitáři ios-keys

- Android

  - Keystore a jeho hesla
  - Playstore account

- Web

  - Firebase účet s write přístupem do firebase hosting
  - Cloudflare účet s write přístupem do cache

### Android

Pro přípravu na Google Play Store je připraven skript `compile_android.sh`. Tento skript nahraje debug symboly automaticky do Firebase. Zároveň nahraje appbundle na Google play a zvěřejní ho pro interní testery.

```bash
sh ./scripts/compile_android.sh
```

Pro kompilaci do release Módu pomocí `flutter build apk` nebo `flutter build appbundle` je potřeba mít App Elevate distribuční klíč. Tento klíč má případně k dispozici Tom. Lze však použít i debug klíč pomocí tohoto příkazu:

```bash
flutter build apk -PuseDebugSigningConfig=true
```

Nebo

```bash
flutter build appbundle -PuseDebugSigningConfig=true
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

Pro manuální deployment na cloudflare pages stačí spustit:

```bash
sh ./scripts/deploy_cloudflare_pages.sh
```

poté je však ještě potřeba vymazat cache na cloudflare.

Pro manuální deployment na firebase hosting stačí spustit:

```bash
sh ./scripts/deploy_firebase_hosting.sh
```
