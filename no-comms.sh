#!/bin/bash

# List of applications to manage
apps=("WhatsApp" "Telegram Desktop" "Microsoft Teams" "Microsoft Outlook") 

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 [open|close]"
  exit 1
fi

# Handle 'open' or 'close' argument
if [ "$1" == "open" ]; then
  for app in "${apps[@]}"; do
    echo "Checking if $app is running before opening..."
    osascript -e "tell application \"$app\" to if it is not running then launch"
  done
  echo "Applications opened if they were not running."

elif [ "$1" == "close" ]; then
  for app in "${apps[@]}"; do
    echo "Closing $app if it's running..."
    osascript -e "tell application \"$app\" to if it is running then quit"
  done
  echo "Applications closed if they were running."

else
  echo "Invalid argument: $1"
  echo "Usage: $0 [open|close]"
  exit 1
fi