#!/bin/bash
tr _ ',' < 2022.csv | cut --complement -d"," -f6,7,8 | tr -d \./ > 2022_best.csv
grep -v '^Tweet' 2022_best.csv > 2022_best.csv
tr _ ',' < 2021.csv | cut --complement -d"," -f6,7,8 | tr -d \./ > 2021_best.csv
grep -v '^Tweet' 2021_best.csv > 2021_best.csv
tr _ ',' < 2020.csv | cut --complement -d"," -f6,7,8 | tr -d \./ > 2020_best.csv
grep -v '^Tweet' 2020_best.csv > 2020_best.csv
