#!/bin/bash
# Determine if a given number is odd or even

echo "Enter the number:"
read n
r=$(expr $n % 2)
if [ $r -eq 0 ]; then
    echo "$n is even"
else
    echo "$n is odd"
fi
