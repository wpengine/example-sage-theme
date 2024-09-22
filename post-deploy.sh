#!/bin/bash

# Check if the theme is already active, and activate it if not
if ! wp theme is-active your-roots-theme-here; then
    echo "Activating the theme..."
    wp theme activate your-roots-theme-here
else
    echo "The theme is already active."
fi

# Check if the wp acorn command is available
if wp acorn &> /dev/null; then
    echo "wp acorn command is available"

    # Clear Acorn cache before caching views
    echo "Clearing Acorn cache..."
    wp acorn optimize:clear

    # Run wp acorn view:cache command
    echo "Running wp acorn view:cache..."
     if ! wp acorn view:cache; then
        echo "Failed to cache views" >&2
        exit 1
     fi
else
    echo "wp acorn command is not available"
fi