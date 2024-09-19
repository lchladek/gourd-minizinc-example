#!/bin/bash

prefix="../../../../minizinc-benchmarks/"

printf "" > input_list.toml

for folder in `ls -1`; do
  [ -d $folder ] && [ -f $folder/$folder.mzn ] && {
    for dznfile in `ls -1 $folder | grep .dzn`; do
      printf "[[input]]\narguments = [\"%s\", \"%s\"]\n" $prefix$folder/$folder.mzn $prefix$folder/$dznfile >> input_list.toml
    done
  }
done
