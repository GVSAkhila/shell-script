#!/bin/bash

# Prompt the user to enter two numbers and an operator
echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

echo "Enter operator (+, -, *, /):"
read operator

# Perform calculations based on the operator
if [ "$operator" = "+" ]; then
  result=$((num1 + num2))
elif [ "$operator" = "-" ]; then
  result=$((num1 - num2))
elif [ "$operator" = "*" ]; then
  result=$((num1 * num2))
elif [ "$operator" = "/" ]; then
  if [ "$num2" -eq 0 ]; then
    echo "Error: Division by zero!"
    exit 1
  fi
  result=$(echo "scale=2; $num1 / $num2" | bc)
else
  echo "Invalid operator!"
  exit 1
fi

# Display the result
echo "Result: $result"
