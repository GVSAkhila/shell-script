#!/bin/bash

# Get the current day of the week (e.g., Sun, Mon, Tue, etc.)
today=$(date +%a)

# Check if today is Sunday
if [ "$today" == "Sun" ]; then
    echo "No class today."
else
    echo "Today is a class day."
fi
