#!/bin/bash

APPS=$(aerospace list-windows --all --format "%{workspace} %{app-name}" --json)
FORMATTED=$(echo "$APPS" | jq -r '
  # Group by workspace
  group_by(.workspace) |
  # For each workspace group
  map({
    workspace: .[0].workspace,
    apps: map(."app-name") | unique | join(" - ")
  }) |
  # Sort by workspace number
  sort_by(.workspace | tonumber) |
  # Format as "[workspace] apps" with brackets
  map("[" + .workspace + "] " + .apps) |
  # Join all workspace groups with spaces
  join(" ")
')

sketchybar --set "$NAME" label="$FORMATTED"
