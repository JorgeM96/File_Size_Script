#Author: Jorge Moreno
#Instructor: Mark Thompson
#Date: 2/12/18
#Description: This program prints to the screen files in a directory that are greater than a passed bit size

#!/bin/bash

printout()  #function used to output the files greater than the size provided
{
echo "`ls -l $1`" | gawk -v Size="$size" '{if (NR!=1 && $5 > Size)print n+=1 ,$9, $5}'  
}

if [[ "$#" -ne 2 ]]  #if the user didnt pass 2 arguments
then
  echo "This script requires 2 arguments passed in the command line."
  echo "usage: ./minor3.sh <directory> <size>"
fi

if [[ "$2" -lt 0 ]]  #checks if the size entered is not less than 0
then
  echo "The size you entered is negative and is not allowed."
else
  echo "The size you entered is allowed. (Size: " $2 ")."
fi

size=$2  #variable holds the size passed into as the second parameter
if [[ -d $1 ]]  #checks if the first parameter is a directory
then
echo "That directory exist. (Directory: " $1 ")."
echo "Files with size greater than "$2 ":"
printout $1 $size #function call passes the directory and the size
else
  echo "What you entered is not an existing directory."
fi
