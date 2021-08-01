#!/bin/bash

for file in *
do
	if [ -h "${file}" ]
	then
		echo "Something special here! ${file}"		
		break
	else
		echo "${file}"
	fi
done

counter=0
for file in *
do
	((counter=counter+1))
done
echo "${counter}"
