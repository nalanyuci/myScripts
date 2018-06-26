#!/bin/sh

#message context:
#  replace some lines in file

productFiles_temp=`find dir/subdir/ -name "full_*.mk"`
productFiles=`echo $productFiles_temp | tr '\n' ' '`
echo "productFiles=$productFiles"
echo "find files done."
echo "****************************************************************************"
for productFile in $productFiles
do
   echo $productFile
   startN=`sed -n '/ifneq (,$(filter a%, $(b)))/=' $productFile`
   if [ $startN ];
   then
     endN=$(awk -v x=$startN 'BEGIN {print x+10}')
     sed -i ''$startN','$endN'd' $productFile
     afterN=$(awk -v x=$startN 'BEGIN {print x-1}')
     sed -i ''$afterN' c := d e f g' $productFile
     echo "done"
   else
     echo "no need to replace"
   fi
   echo ""
done
