#!/bin/bash

# given number is greaterthan 20 or not

number1=$1

if [ $number1 -ge 20 ] then
echo "Given number is greaterthan $number1"
else
echo "Given number is lessthan $number1"
fi