# APPE Core

Core pro aplikace. Obsahuje template pro aplikace vytvořené v App Elevate.

## Doporučený environment

- macOS má aktuálně implementované všechny skripty, ale pro windows uživatele nebude náročné si je upravit. Na linuxu by mělo vše fungovat bez problémů.
- Doporučený editor je Visual Studio Code s rozšířeními [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter), [Arb-files](https://marketplace.visualstudio.com/items?itemName=Google.arb-editor), [Run on save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave) a [Build Runner](https://marketplace.visualstudio.com/items?itemName=GaetSchwartz.build-runner&ssr=false#review-details). Run on save je pro automatické formátování arb souborů (překlady) a build runner je pro automatické generování kódu.
- tyto extensiony nepotřebují žádné další konfigurace.
- macOS má zároveň podporu kompilace pro iOS a macOS.

## Vývojářské nástroje

- Tento projekt používá build_runner pro automatické generování kódu. Pro spuštění je potřeba spustit `dart run build_runner watch` nebo `dart run build_runner build` pro jednorázový build. Toto je potřeba spustit pokaždé, co upravíte freezed soubory, nebo router. (např `@RoutePage` nebo `@freezed`)
- Doporučuji to mít zapnuté jako `watch` dole, když máte build runner extension ve Visual Studio Code. Pokud se vás to zeptá na složku, ve které to spusti, zvolte `lib`.

# [Spouštění aplikace](docs/spousteni_aplikace.md)

# [Distribuce](docs/automaticky_deployment.md)

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

# [Vytváření nové aplikace](docs/novy_projekt.md)
