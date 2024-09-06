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

yes | shorebird patch android --release-version=$version -- --split-debug-info="symbolsAndroid" --obfuscate

dart run sentry_dart_plugin
firebase_id=$(jq -r '.client[0].client_info.mobilesdk_app_id' android/app/google-services.json) 
firebase crashlytics:symbols:upload --app=$firebase_id build/symbolsAndroid