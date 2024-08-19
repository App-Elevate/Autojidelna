set -e

RUN_NUMBER=$1
if [ -z "$RUN_NUMBER" ]; then
  echo "Usage: $0 <run_number>"
  exit 1
fi

handle_sigint() {
    echo "Terminating script due to Ctrl+C"
    exit 1
}

# Trap SIGINT and call handle_sigint
trap handle_sigint SIGINT

version=$(sh scripts/version.sh $RUN_NUMBER)
echo "Deploying macOS version $version"

cd macos 
bundle install
bundle exec fastlane match appstore --readonly --additional_cert_types=mac_installer_distribution
cd ..
flutter build macos --split-debug-info build/symbolsMacOS --obfuscate
dart run sentry_dart_plugin
cd macos
bundle exec fastlane release
cd ..