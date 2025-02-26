#!/bin/bash

SLACK_COUNT=$(osascript -e '
tell application "System Events"
    set slackRunning to (exists process "Slack")
    if slackRunning then
        tell application "System Events" to tell process "Slack"
            try
                set unreadCount to (get value of attribute "AXTitle" of UI element 1 of list 1 of application process "Dock" whose role description is "Dock item" and name is "Slack")
                if unreadCount is missing value then return 0
                return unreadCount
            on error
                return 0
            end try
        end tell
    else
        return 0
    end if
end tell')

if [ "$SLACK_COUNT" = "0" ]; then
  ICON="􀌥"  # No unread messages (You can change this to another SF Symbol)
else
  ICON="􁏊"  # Unread messages icon (Change as needed)
fi

sketchybar --set "$NAME" icon="$ICON" label="$SLACK_COUNT"
