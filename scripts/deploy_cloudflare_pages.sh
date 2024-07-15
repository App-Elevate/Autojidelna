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
echo "Deploying version $version to cloudflare pages"

flutter pub global activate peanut &&
flutter pub global run peanut -b dist-cloudflare-pages &&
sleep 2 &&
git push origin dist-cloudflare-pages:dist-cloudflare-pages