#!/bin/bash

#aray operation: sorting 
types=(a c b f 3 5)
sorted_types=($(for type in "${types[@]}"; do echo $type; done | sort))
echo "Posortowane owoce: ${sorted_types[@]}"

#filtering by letter contains

fruits=("apple" "banana" "cherry")
for fruit in "${fruits[@]}"; do
    if [[ $fruit == b* ]]; then
        printf "Fruit %s starts with b\n" "${fruit}"
    else
        printf "Fruit %s starts with %s\n" "${fruit}" "${fruit:0:1}"
    fi
done



# redirecting intpu to file 
testing_file=output.txt
simple_text="simple text" 
echo "${simple_text}" > $testing_file;
if [ -e $testing_file ] && [ -s $testing_file ]; then
    echo "Second ____ text" >> $testing_file
    cat $testing_file
    # command 2> /dev/null # redirect error 
else
    echo "Not exist"
fi

# handling erros
: '
    Each commands in bash is returning output code 
        $? - variable to check the code
        0 code is sucess
'
#1 way
ls /not-known-directory
if [ $? -ne 0 ]; then
    echo "Listing ends with errors"
fi
#2 way
output=${ls /notexistingdirectory 2>}



#funkcje
#tworzenie archiwum
# tee 
# sed 
# awk
