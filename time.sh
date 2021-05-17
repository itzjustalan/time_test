#!/bin/sh


cd tests || exit

for test in $(ls -d */);do
  echo "$test"
  cd $test || exit
  ./time.sh
  cd ../
done

cd ../
