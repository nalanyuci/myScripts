#!/bin/sh
# compare files under 2 folders
# $1: old file folder
# $2: new file folder

num1=`ls -l $1 | grep "^-" | wc -l`
num2=`ls -l $2 | grep "^-" | wc -l`
echo "num1 is $num1,num2 is $num2"

for i in $1/*
do
   name=$(basename $i)
   if [ -f $2/$name ]
   then
     result=`cmp -s $1/$name $2/$name`
     if [[ $result =~ "1" ]]
     then
       echo "error: $2/$name is different with $1/$name"
     else
       echo "$name is ok!"
     fi
   else
     echo "error: $2/$name isn't exit!"
   fi
done

