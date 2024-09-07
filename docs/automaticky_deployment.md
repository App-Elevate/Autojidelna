# Distribuce

O distribuci by se měl většinou starat Tom. Pokud máte nějaký problém, napište mu.

## Důležité

- Co se stane po vydání nové verze?

  - Web: okamžitě je v produkci
  - Android: zašle se interním testerům na google play
  - iOS: zašle se interním testerům na testflight
  - macOS: zašle se interním testerům na testflight

- Co se stane, když vydáme patch?
  - Web: okamžitě je v produkci
  - Android: zašle se do produkce pro verzi, kterou patchujeme
  - iOS: zašle se do produkce pro verzi, kterou patchujeme
  - macOS: nestane se nic.

Jsou 3 způsoby, jak distribuovat novou verzi.

### 1. Automatická distribuce při merge do mainu.

- Po úspěšném PR do mainu se verze vezme z branche, který se merguje do mainu. Build number se potom bere z počtu spuštěných github actions.
- příklad: merge z branche `1.0.0` do mainu může vytvořit release `1.0.0+122`.

### 2. Manuální distribuce

- Pro manuální distribuci je potřeba být na branchi s verzí. Například pro vydání verze 1.0.0 je potřeba být na branchi `1.0.0`.

1. Ve webovém prohlížeči otevřete tento repozitář a kliknete na Actions.
2. Vlevo je tlačítko `[Flutter] Deploy everything`. Klikněte na něj
3. Vpravo se vám objeví tlačítko `Run workflow`. Otevřete si nabídku.
4. Vyberte si nahoře branch a zbytek nechte tak jak je a klikněte na `Run workflow`.
5. Za cca 15 minut je na všech platformách nová verze.

### 3. Vytvoření patch verze

- V nouzových situacích nebo když jde o hodně malou změnu je potřeba vytvořit patch verzi, která neprojde přes review Apple a Google storu. V tomto případě:

1. Přejděte na tag, který chcete patchnout (opravit)

```bash
git checkout 1.0.0+122
```

2. Vytvořte nový branch z tohoto tagu. V tomto názvu branche musí být `patch`

```bash
git checkout -b patch-bad-text
```

3. Vraťte poslední nepodepsaný commit

```bash
git reset HEAD~
```

4. Opravte chybu a commitněte změnu
5. Ve webovém prohlížeči otevřete tento repozitář a kliknete na Actions.
6. Vlevo je tlačítko `[Flutter] Deploy everything`. Klikněte na něj
7. Vpravo se vám objeví tlačítko `Run workflow`. Otevřete si nabídku.
8. Vyberte si nahoře branch s `patch` a zaškrtněte `Make it an instant patch release`.
9. Potom zmáčkněte zelené `Run workflow`.
10. Za cca 15 minut je na všech platformách kromě macOS nová verze.
