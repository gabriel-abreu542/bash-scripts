#!/bin/sh

# calculator.sh - Simulates a calculator in shell, with the 4 basic operations (addition, subtraction, multiplication, and division)

# er_num = Regular expression that represents any number, integer or decimal
er_num="^-?[0-9]+(\.[0-9]+)?$" # Used to check if the user entered a valid number
# er_op = Regular expression that represents any number from 1 to 4
er_op="^[1-4]$" # Used to check if the user selected a valid option

echo "Enter two numbers:"
read num1;

# Check the first number
# Applies the command "grep $er_num" to the output of the command "echo $num1", using regular expression (-E) and not printing its output to the screen (-q)
echo "$num1" | grep -E -q "$er_num"
# $? = exit code of the grep command (If a valid number is found, the exit code will be zero)
if [ $? -ne 0 ]; then # If the user did not enter a valid number
    echo "ERROR: '$num1' is not a valid number." # Error message and exit the program
    exit
fi

read num2;

# Same check for the second number
echo "$num2" | grep -E -q "$er_num"
if [ $? -ne 0 ]
then
    echo "ERROR: '$num2' is not a valid number."
    exit
fi

# Offer operation options to the user
echo
echo "Choose the operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read choice;

# Check if the user selected a valid operation (using numbers from 1 to 4)
# Same logic used to check the input for variables num1 and num2
echo "$choice" | grep -E -q "$er_op"
if [ $? -ne 0 ]
then
        echo "ERROR: '$choice' is not a valid option";
        exit
fi

# Define the operation to be performed based on the user's choice
if [ $choice -eq 1 ]
then
        op="+";
elif [ $choice -eq 2 ]
then
        op="-";
elif [ $choice -eq 3 ]
then
        op="*";
elif [ $choice -eq 4 ]
then
        op="/";
fi

# Command "bc -l" = Defines a calculator using the standard math library (allows operations with decimal numbers)
result=$(echo "$num1 $op $num2" | bc -l);

# Print the calculation performed and the result
echo
echo "$num1 $op $num2 = $result";
