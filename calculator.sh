#!/bin/sh

# calculator.sh

echo "Write two numbers:";
read -p "First number: " num1;
read -p "Second number: " num2;

echo "Choose an operation:"
echo "1. Add";
echo "2. Subtract";
echo "3. Multiply";
echo "4. Divide";
read option;

if [ $option -lt 1 ] || [ $option -gt 4 ]
then
        echo "Invalid option"
        exit;
fi

if [ $option -eq 1 ]
then
        op="+";
elif [ $option -eq 2 ]
then
        op="-";
elif [ $option -eq 3 ]
then
        op="*";
elif [ $option -eq 4 ]
then
        op="/";
fi

result=$(($num1$op $num2));

echo "$num1 $op $num2 = $result";
