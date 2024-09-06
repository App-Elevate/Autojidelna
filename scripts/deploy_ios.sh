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
echo "Deploying iOS version $version"

cd ios 
bundle install 
bundle exec fastlane match appstore --readonly 
cd .. 
# Extract the Flutter version
flutter_version=$(flutter --version | grep 'Flutter' | awk '{print $2}')
# Now flutter_version contains the current version of Flutter
echo "The current Flutter version is: $flutter_version"
yes | shorebird release ios --build-name=$(sed -n 's/^version:.*+\([0-9]*\)/\1/p' pubspec.yaml) --build-number=$(sed -n 's/^version: \([0-9]*\.[0-9]*\.[0-9]*\).*/\1/p' pubspec.yaml) --export-options-plist=/Users/builder/export_options.plist --flutter-version=$flutter_version -- --split-debug-info="build/symbolsIos"
cd ios 
bundle exec fastlane release
cd ..