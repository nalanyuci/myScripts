#!/bin/bash

for((i=1;i<=100;i++));
do
mmma -j16 XXXXXXXX 2>&1 |tee LOG/$i.log;
rm -rf out/;
done
