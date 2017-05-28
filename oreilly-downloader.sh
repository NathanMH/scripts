#!/bin/bash

section=("data" "security" "business" "web-platform" "webops" "programming" "iot" "desig")

for i in "${section[@]}"
do
    wget -O- http://www.oreilly.com/$i/free/ | tr '"' \\n | grep http | grep free | cut -d "?" -f1 | sed 's/free/free\/files/' | sed 's/\.csp/\.epub/' | xargs wget -P ebook/$i
done

