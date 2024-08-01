#!/bin/zsh

set -e

handle_sigint() {
    echo "Terminating script due to Ctrl+C"
    exit 1
}

# Trap SIGINT and call handle_sigint
trap handle_sigint SIGINT

# Function to display help
show_help() {
  echo "Usage: $0 [-h] <directory>"
  echo ""
  echo "Convert all files in the specified directory and its subdirectories to .webp format."
  echo ""
  echo "Options:"
  echo "  -h    Show this help message and exit"
}

# Check if the cwebp tool is installed
if ! command -v cwebp &> /dev/null; then
  echo "cwebp could not be found. Please install it first."
  echo "cwebp could not be found. Please install it first."
  exit 1
fi

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
  show_help
  exit 1
fi

# Process options
while getopts ":h" option; do
  case $option in
    h)
      show_help
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_help
      exit 1
      ;;
  esac
done

# Shift processed options away
shift $((OPTIND - 1))

# Directory to process
DIR=$1

# Check if the directory is provided
if [ -z "$DIR" ]; then
  show_help
  exit 1
fi

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "The directory $DIR does not exist."
  exit 1
fi

# Function to convert files in a directory recursively
convert_directory() {
  local directory=$1
  for file in "$directory"/*; do
    # If the item is a directory, recursively call the function
    if [ -d "$file" ]; then
      convert_directory "$file"
    else
      # Get the file extension
      ext="${file##*.}"

      # Skip if the file is already a .webp file
      if [ "$ext" = "webp" ]; then
        continue
      fi

      # Generate the output file name
      output="${file%.*}.webp"

      # Convert the file to webp, capturing errors
      {
        cwebp -lossless "$file" -o "$output"
        if [ $? -eq 0 ]; then
          echo "Converted $file to $output"
        else
          echo "Failed to convert $file"
        fi
      } || {
        echo "Error occurred during conversion of $file. Continuing..."
      }
    fi
  done
}

# Start conversion from the specified directory
convert_directory "$DIR"
