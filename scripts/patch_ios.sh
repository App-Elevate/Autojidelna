set -e

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

yes | shorebird patch ios --release-version=$(sed -n 's/^version: \(.*\)$/\1/p' pubspec.yaml) 

cd ios 
bundle exec fastlane release_ci
cd ..