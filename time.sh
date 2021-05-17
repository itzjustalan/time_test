#!/bin/sh


cd tests

for test in $(ls -d */);do
  echo $test
  cd $test
  ./time.sh
  cd ../
done

cd ../
