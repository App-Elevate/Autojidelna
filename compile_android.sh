flutter build appbundle --split-debug-info symbolsAndroid --obfuscate &&
firebase_id=$(jq -r '.client[0].client_info.mobilesdk_app_id' android/app/google-services.json) &&
firebase crashlytics:symbols:upload --app=$firebase_id symbolsAndroid