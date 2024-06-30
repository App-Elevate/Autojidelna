cd macos && bundle install && bundle exec fastlane match appstore --readonly &&
cd .. && flutter build macos --split-debug-info symbolsMacOS --obfuscate &&
cd macos && bundle exec fastlane release