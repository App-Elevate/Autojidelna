cd macos && bundle install && bundle exec fastlane match appstore --readonly --additional_cert_types=mac_installer_distribution &&
cd .. && flutter build macos --split-debug-info symbolsMacOS --obfuscate &&
cd macos && bundle exec fastlane release