set -e

version=$1
if [ -z "$version" ]; then
  echo "Usage: $0 <patch_version>"
  exit 1
fi

handle_sigint() {
    echo "Terminating script due to Ctrl+C"
    exit 1
}

# Trap SIGINT and call handle_sigint
trap handle_sigint SIGINT

cd ios 
bundle install 
bundle exec fastlane match appstore --readonly 
cd .. 

yes | shorebird patch ios --release-version=$version --export-options-plist=/Users/builder/export_options.plist -- --split-debug-info="build/symbolsIos"

cd ios 
bundle exec fastlane release_ci
cd ..