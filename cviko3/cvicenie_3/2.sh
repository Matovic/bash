#!/bin/bash

# Some C style iteration
for (( i=1; i<=5; i++ ))
do
  echo "i"
done

echo

for i in 1 2 3 4 5
do
   echo "${i}"
done

echo ""

# This is handy
for i in {10..1..2}
do
  echo "${i}"
done

echo ""

# When your bash(shell) is old :/
for i in $(seq 5)
do
  echo "${i}"
done

echo ""

for i in `seq 5`
do
  echo "${i}"
done

