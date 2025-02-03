for file in lib/src/lang/arb/*.arb; do
  dart run arb_utils sort "$file"
done

flutter gen-l10n