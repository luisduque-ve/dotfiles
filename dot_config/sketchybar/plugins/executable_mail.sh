#!/bin/bash

MAIL_COUNT=$(osascript -e 'tell application "Mail" to get unread count of inbox')

if [ "$MAIL_COUNT" = "0" ]; then
  DRAWING=off
else
  DRAWING=on
fi

sketchybar --set "$NAME" drawing=$DRAWING icon="􀍜" label="$MAIL_COUNT"
