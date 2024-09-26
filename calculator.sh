#!/bin/bash

echo "------ Welcome to Basic Calculator ------"
#Take input of operands and operator
read -p "Enter first number: " operand1
read -p "Enter second number: " operand2
read -p "Enter operator(+,-,*,/): " operator

#Display the result
echo "Result($operand1 $operator $operand2): $(($operand1 $operator $operand2))"
