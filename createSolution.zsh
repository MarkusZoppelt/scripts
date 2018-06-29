#!/bin/zsh

filename=$1
projectName=${filename:r}

mkdir $projectName
mkdir $projectName/$projectName

cd $projectName

cp ../$filename $projectName/.
cp ~/code/scripts/Vanilla-sln/Vanilla.sln $projectName.sln
cp ~/code/scripts/Vanilla-sln/Vanilla.vcxproj $projectName/$projectName.vcxproj

rm -rf .vs* .DS_Store
sed -i -- "s/Vanilla/$projectName/g" **/*(D.)
rm -rf ../**/*.*--*
