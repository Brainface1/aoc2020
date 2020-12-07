#!/bin/sh

sed "s/^$/;/" in.txt | tr -d "\n" | sed "s/;/\n/g"
