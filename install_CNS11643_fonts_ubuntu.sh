#!/bin/bash

# Author: hms5232
# source code and manual on https://github.com/hms5232/ubunut-install-CNS11643-fonts

# if $HOME/.fonts dir not exist, then create it.
if [ ! -d "$HOME/.fonts" ] ; then
    mkdir $HOME/.fonts
    echo "create ~/.fonts/"
fi

# donwload CNS11643中文標準交換碼全字庫（簡稱全字庫）
# 正楷體、正宋體
wget http://www.cns11643.gov.tw/AIDB/Open_Data.zip

# unzip
unzip Open_Data.zip

# copy fonts to ~/.fonts
cp -i Open_Data/Fonts/*.ttf $HOME/.fonts

# refresh fonts cache
sudo fc-cache -f -v

# remove zip and unzip dir
rm Open_Data.zip
rm -r Open_Data/

# finally
echo -e "\n\a"
echo -e "============== This is the end of script. ============== \n"