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
echo "Deploying Android version $version"

flutter build appbundle --split-debug-info build/symbolsAndroid --obfuscate 
open https://play.google.com/console/
firebase_id=$(jq -r '.client[0].client_info.mobilesdk_app_id' android/app/google-services.json) 
firebase crashlytics:symbols:upload --app=$firebase_id build/symbolsAndroid
sh scripts/ci/deploy_google_play.sh build/app/outputs/bundle/release/app-release.aab $RUN_NUMBER internal draft build/app/outputs/mapping/release/mapping.txt build/app/intermediates/merged_native_libs/release/mergeReleaseNativeLibs/out/lib