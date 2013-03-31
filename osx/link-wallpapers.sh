#!/bin/sh
#

mkdir ~/Pictures/Wallpapers

for pic in /Library/Desktop\ Pictures/*.jpg
do
  ln -s "$pic" ~/Pictures/Wallpapers/
done;

for pic in /System/Library/Frameworks/ScreenSaver.Framework/Versions/A/Resources/Default\ Collections/**/*.jpg
do
  ln -s "$pic" ~/Pictures/Wallpapers/
done

# update wallpapers settings
