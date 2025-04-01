#!/bin/bash

# This script updates all experience HTML files to follow a uniform format

# List of experience files to update
files=(
  "experiences/network-security-engineer.html"
  "experiences/security-engineering-coursework.html"
  "experiences/security-testing-engineer.html"
  "experiences/advanced-network-security.html"
  "experiences/cybersecurity-strategy-consultant.html"
)

for file in "${files[@]}"; do
  echo "Updating $file..."
  
  # 1. Update title and add project.css
  sed -i '' 's/- Jason Antwi/- Work Experience/' "$file"
  sed -i '' 's/<link rel="stylesheet" href="..\/css\/styles.css">/<link rel="stylesheet" href="..\/css\/styles.css">\n    <link rel="stylesheet" href="..\/css\/project.css">/' "$file"
  
  # 2. Remove style tag and its content
  sed -i '' '/<style>/,/<\/style>/d' "$file"
  
  # 3. Add JS script tag before closing body tag if it doesn't exist
  if ! grep -q '<script src="..\/js\/script.js"><\/script>' "$file"; then
    sed -i '' 's/<\/footer>/\n    <!-- JavaScript -->\n    <script src="..\/js\/script.js"><\/script>\n<\/footer>/' "$file"
  fi
  
  echo "Completed updating $file"
done

echo "All files updated successfully!"
