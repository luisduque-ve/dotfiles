#!/bin/bash

MAIL_COUNT=$(osascript -e 'tell application "Mail" to get unread count of inbox')

if [ "$MAIL_COUNT" = "0" ]; then
  ICON="􀍖"
else
  ICON="􀍜"
fi

sketchybar --set "$NAME" icon="$ICON" label="$MAIL_COUNT"
