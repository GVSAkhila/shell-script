#!/bin/bash
# given number is odd or not

echo "enter the number"
r='expr $n%2'
if [ $r -eq 0 ]
then
echo "$n given number is even"
else
echo "$n given number is odd"
fi