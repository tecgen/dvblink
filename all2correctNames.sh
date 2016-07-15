#!/bin/bash

for FILENAME in *.ts
do
   # get corrected file name
   FILENAME_NEW=`python correctName.py $FILENAME`
   # get file name without extension
   NAME=`echo $FILENAME_NEW | cut -d'.' -f 1`
   
   #echo $FILENAME = $FILENAME_NEW
   mv "$FILENAME" "$FILENAME_NEW"

done
