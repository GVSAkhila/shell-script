#!/bin/bash

# given number is greaterthan 20 or not

number1=$1

if [ $number1 -ge 20 ] then
echo "Given number is greaterthan 20"
else
echo "Given number is lessthan 20"
fi