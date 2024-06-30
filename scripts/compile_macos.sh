cd macos && bundle install && bundle exec fastlane match appstore --additional_cert_types=mac_installer_distribution --readonly &&
cd .. && flutter build macos --split-debug-info symbolsMacOS --obfuscate &&
cd macos && bundle exec fastlane release