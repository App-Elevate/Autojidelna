RUN_NUMBER=$1
if [ -z "$RUN_NUMBER" ]; then
  echo "Usage: $0 <run_number>"
  exit 1
fi

if [[ $(git branch --show-current) =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  version=$(git branch --show-current)
fi
# Initialize a variable to keep track of the number of merge commits checked
count=0
# Loop until a matching merge commit is found
while [[ ! -n $version ]]; do
  # Get the latest merge commit message starting from the most recent one and moving backwards
  commit_message=$(git log --merges -1 --skip=$count --pretty=%B)
  
  # Check if the commit message contains a version number in the format *.*.*
  if [[ $commit_message =~ [0-9]+\.[0-9]+\.[0-9]+ ]]; then
    # Extract the version number
    version=$(echo "$commit_message" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')
    break
  fi

  # Increment the counter to check the next merge commit in the next iteration
  count=$((count + 1))

  # Optional: Add a condition to exit the loop if too many commits have been checked
  if [ $count -gt 100 ]; then
    exit 1
  fi
done

sed -i "s/^version: .*/version: $version+$RUN_NUMBER/" pubspec.yaml > /dev/null 2>&1 || gsed -i "s/^version: .*/version: $version+$RUN_NUMBER/" pubspec.yaml
echo $version+$RUN_NUMBER
