cd ios && bundle install && bundle exec fastlane match appstore --readonly &&
cd .. && flutter build ipa --split-debug-info build/symbolsIos --obfuscate --release || true
cd ios && bundle exec fastlane release