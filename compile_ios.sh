cd ios && bundle exec fastlane match appstore --readonly &&
cd .. && flutter build ipa --split-debug-info symbolsIos --obfuscate --release || true
cd ios && bundle exec fastlane release