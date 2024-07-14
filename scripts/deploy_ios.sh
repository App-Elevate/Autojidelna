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
flutter build ipa --split-debug-info build/symbolsIos --obfuscate --release || true
cd ios 
bundle exec fastlane release
cd ..