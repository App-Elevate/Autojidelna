set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

# Get the path from the first argument
path="$1"

# Check if the path is a file
if [ -f "$path" ]; then
  echo "No file found at the specified path."
  exit 1
fi

curl -L -o bundletool-all.jar https://github.com/google/bundletool/releases/download/1.17.0/bundletool-all-1.17.0.jar
java -jar bundletool-all.jar dump manifest --bundle=app-release.aab --output=output.xml
rm bundletool-all.jar