set -e

handle_sigint() {
    echo "Terminating script due to Ctrl+C"
    exit 1
}

# Trap SIGINT and call handle_sigint
trap handle_sigint SIGINT

yes | shorebird patch android --release-version=$(sed -n 's/^version: \(.*\)$/\1/p' pubspec.yaml) -- --split-debug-info="symbolsAndroid" --obfuscate

dart run sentry_dart_plugin
firebase_id=$(jq -r '.client[0].client_info.mobilesdk_app_id' android/app/google-services.json) 
firebase crashlytics:symbols:upload --app=$firebase_id build/symbolsAndroid