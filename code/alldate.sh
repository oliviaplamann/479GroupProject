#!/bin/bash 
find . -iname "2022*.csv" -print0 | tail -n +2 | xargs -0 awk 'NR == 1 {print $0 ",Date"; next;} FRN == 1 {next;} {print $0 "," FILENAME;}' > 2022.csv
find . -iname "2021*.csv" -print0 | tail -n +2 | xargs -0 awk 'NR == 1 {print $0 ",Date"; next;} FRN == 1 {next;} {print $0 "," FILENAME;}' > 2021.csv
find . -iname "2020*.csv" -print0 | tail -n +2 | xargs -0 awk 'NR == 1 {print $0 ",Date"; next;} FRN == 1 {next;} {print $0 "," FILENAME;}' > 2020.csv
