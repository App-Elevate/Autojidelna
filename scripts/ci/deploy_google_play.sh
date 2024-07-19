#! /bin/bash

set -e

PATH_TO_BUNDLE="${1}"
VERSION_CODE="${2}"
TRACK="${3}"
STATUS="${4}"
PATH_TO_MAPPING="${5}"

echo "---"
echo "Path to bundle: $PATH_TO_BUNDLE"
echo "Version code: $VERSION_CODE"
echo "Track: $TRACK"
echo "Status: $STATUS"
echo "Path to mapping: $PATH_TO_MAPPING"
echo "---"

EDIT_ID=$(google-play-cli edit create)
echo "Edit id created: $EDIT_ID"
echo "Upload Bundle..."
google-play-cli bundles upload --edit-id "$EDIT_ID" --bundle "$PATH_TO_BUNDLE"
echo "Upload deobfuscation files..."
google-play-cli deobfuscation-files upload --edit-id "$EDIT_ID" --deobfuscation "$PATH_TO_MAPPING" --version-code "$VERSION_CODE"
echo "Update track..."
google-play-cli tracks update --edit-id "$EDIT_ID" --version-code "$VERSION_CODE" --track "$TRACK" \
  ${USER_FRACTION:+ --user-fraction "$USER_FRACTION"} \
  ${STATUS:+ --status "$STATUS"}
echo "Validate..."
google-play-cli edit validate --edit-id "$EDIT_ID"
echo "Commit..."
google-play-cli edit commit --edit-id "$EDIT_ID" \
  ${FLAG_CHANGES_NOT_SENT_FOR_REVIEW:+ --changes-not-sent-for-review "$FLAG_CHANGES_NOT_SENT_FOR_REVIEW"}