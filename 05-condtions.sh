#!/bin/bash

# Get the current day of the week (e.g., Sun, Mon, Tue, etc.)
Day=$1

# Check if today is Sunday
if [ "$Day" == "Sunday" ]; then
    echo "No class today."
    exit 1
else
    echo "Today is a class day."
fi
