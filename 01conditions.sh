#!/bin/bash
# given number is odd or not

echo "enter the number"
r='expr $n%2'
if [ $r -eq 0 ]
then
echo "given number is even"
else
echo "given number is odd"
fi