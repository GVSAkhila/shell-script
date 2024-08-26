#!/bin/bash

# Get the current day of the week (e.g., Sun, Mon, Tue, etc.)
today=$1

# Check if today is Sunday
if [ "$today" == "Sunday" ]; then
    echo "No class today."
else
    echo "Today is a class day."
fi
