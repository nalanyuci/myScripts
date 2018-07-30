#!/bin/sh
#sync code to check device.mk

#当前路径是/CKRQ/
#脚本在/CKRQ/checkDeviceMakefile.sh
#sync code到/CKRQ/codebase/

#manifest 格式：
#<manifest>
#  <project name="XXXXXXXXX" path="XXXXXXXXX" revision="XXXXXXXXX"/>
#  <project name="XXXXXXXXX" path="XXXXXXXXX"/>
#  ......
#</manifest>
branches='branch1 branch2 branch3'

if [ ! -d codebase ]
then
  mkdir codebase
  cd codebase
  for branch in $branches
  do
    if [ ! -d $branch ]
    then
      mkdir $branch
      cd $branch
      "init codebase command $branch ~~~"
      neededRepo=`grep "the folder that contains device.mk" .repo/manifests/sub.xml`
      neededRepo=`echo $neededRepo | tr '<' '\n<'`
      echo -e "$neededRepo" > repo.txt
      cat repo.txt | cut -d ' ' -f 2 > result.tmp
      sed -i 's/name="//' result.tmp
      sed -i 's/"//' result.tmp
      neededRepo=`cat result.tmp`
      neededRepo=`echo $neededRepo | tr '\n' ' '`
    
#    mkdir .repo/local_manifests
#    echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<manifest>\n" >> .repo/local_manifests/customization.xml
#    echo -e "$neededRepo" >> .repo/local_manifests/customization.xml
#    echo -e "\n</manifest>" >> .repo/local_manifests/customization.xml
#    sed -i 's/project /  \<project /' .repo/local_manifests/customization.xml
    
      "sync repo command $neededRepo ~~~"
    fi
    cd ..
  done
fi

cd ..
grep -rn "FO name" ./codebase 2>&1 |tee result.log
