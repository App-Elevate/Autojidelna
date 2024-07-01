PROJECT_FILE="macos/Runner.xcodeproj/project.pbxproj"

# Function to update runOnlyForDeploymentPostprocessing for the specified section
update_run_only_for_deployment_postprocessing() {
  local section_name="$1"
  local temp_file=$(mktemp)

  # Use awk to find the section and update the value
  awk -v section="$section_name" '
    $0 ~ section {
      in_section = 1
    }
    in_section && /runOnlyForDeploymentPostprocessing = 0;/ {
      sub(/runOnlyForDeploymentPostprocessing = 0;/, "runOnlyForDeploymentPostprocessing = 1;")
      in_section = 0
    }
    { print }
  ' "$PROJECT_FILE" > "$temp_file"

  # Move the temporary file back to the original project file
  mv "$temp_file" "$PROJECT_FILE"
}


flutterfire configure
# Update the specified section
update_run_only_for_deployment_postprocessing 'FlutterFire: "flutterfire upload-crashlytics-symbols"'