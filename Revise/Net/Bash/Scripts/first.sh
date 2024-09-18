#!/bin/bash
# Variable declaration
SIMPLE_VAR="SIemano kolano"
echo "$SIMPLE_VAR"

# For loop wih if statement
for((i=0;i<=5;i++)); do

    if [ ${i} -gt 3 ]; then
        echo "Index is greather then 3: ${i}"
    else 
        echo "Number is lower then 3: ${i}"
    fi
done

#while loop
count=1
while [ $count -le 5 ]; do
    ((count++))
    echo "${count}"
    
done

# until loop
until [ $count -gt 10 ]; do
    ((count++))
done
echo "Last version of count: ${count}"

#functions
simple_func() {
    echo "Hello ${1}"
}
simple_func "Allice"
