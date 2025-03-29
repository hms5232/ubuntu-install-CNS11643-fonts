#!/bin/bash

# ######################################################################################################## #
# Author: hms5232
# Source code and manual on https://github.com/hms5232/ubuntu-install-CNS11643-fonts
# Contact, report bugs or ask questions: https://github.com/hms5232/ubuntu-install-CNS11643-fonts/issues
# ######################################################################################################## #


need_download=true

# if ~/.fonts dir not exist, then create it.
if [ ! -d "$HOME/.fonts" ] ; then
    mkdir $HOME/.fonts
    echo -e "create ~/.fonts/ \n"
fi

# ---------------------------
# 原始打包整合的單一壓縮檔
# ---------------------------

# when Open_Data.zip exists, users must check out they wanna to download again or not
if [ -f "Open_Data.zip" ] ; then
	read -p "Open_Data.zip already exists. Do you want to delete it and download again? [y/n]" re_download
	case $re_download in
		[yY][eE][sS]|[yY])
			echo -e "remove Open_Data.zip...\n"
			rm Open_Data.zip
			echo -e "\n"
			;;
		*)
			read -p "Use the existing Open_Data.zip? [y/n]" re_use
			case $re_use in
				[yY][eE][sS]|[yY])
					need_download=false
					echo -e "Skip download."
					echo -e "\n"
                    # let's hash it~
                    # but we don't have offical sha1sum file Orz
                    hash=$(sha1sum Open_Data.zip | cut -d ' ' -f 1)
                    echo -e "\n The SHA1 value of downloaded file is \n"
                    echo -e "\t>>>>> $hash <<<<<\n"

                    # unzip
                    unzip Open_Data.zip
					;;
				*)
					echo -e "\n"
					echo -e "============== Exit shell script! =============="
					exit
					;;
			esac
	esac
fi

# ---------------------------
# 單一正宋體壓縮檔
# ---------------------------

# when Fonts_Sung.zip exists, users must check out they wanna to download again or not
if [ -f "Fonts_Sung.zip" ] ; then
	read -p "Fonts_Sung.zip already exists. Do you want to delete it and download again? [y/n]" re_download
	case $re_download in
		[yY][eE][sS]|[yY])
			echo -e "remove Fonts_Sung.zip...\n"
			rm Fonts_Sung.zip
			echo -e "\n"
            need_download=true
			;;
		*)
			read -p "Use the existing Fonts_Sung.zip? [y/n]" re_use
			case $re_use in
				[yY][eE][sS]|[yY])
					need_download=false
					echo -e "Skip download."
					echo -e "\n"
					;;
				*)
					echo -e "\n"
					echo -e "============== Exit shell script! =============="
					exit
					;;
			esac
	esac
fi

# Let's download font
if $need_download ; then
    if [ ! -d "Open_Data/" ] ; then
        mkdir Open_Data
    fi

	# download CNS11643中文標準交換碼全字庫（簡稱全字庫）
	# 正楷體、正宋體
	# TW-Kai, TW-Sung
	wget https://www.cns11643.gov.tw/opendata/Fonts_Sung.zip
fi

if [ -f "Fonts_Sung.zip" ] ; then
    # let's hash it~
    # but we don't have offical sha1sum file Orz
    hash=$(sha1sum Fonts_Sung.zip | cut -d ' ' -f 1)
    echo -e "\n The SHA1 value of Fonts_Sung.zip is \n"
    echo -e "\t>>>>> $hash <<<<<\n"

    # unzip
    unzip Fonts_Sung.zip -d Open_Data
fi

# ---------------------------
# 單一正楷體壓縮檔
# ---------------------------

# when Fonts_Kai.zip exists, users must check out they wanna to download again or not
if [ -f "Fonts_Kai.zip" ] ; then
	read -p "Fonts_Kai.zip already exists. Do you want to delete it and download again? [y/n]" re_download
	case $re_download in
		[yY][eE][sS]|[yY])
			echo -e "remove Fonts_Kai.zip...\n"
			rm Fonts_Kai.zip
			echo -e "\n"
            need_download=true
			;;
		*)
			read -p "Use the existing Fonts_Kai.zip? [y/n]" re_use
			case $re_use in
				[yY][eE][sS]|[yY])
					need_download=false
					echo -e "Skip download."
					echo -e "\n"
					;;
				*)
					echo -e "\n"
					echo -e "============== Exit shell script! =============="
					exit
					;;
			esac
	esac
fi

# Let's download font
if $need_download ; then
    if [ ! -d "Open_Data/" ] ; then
        mkdir Open_Data
    fi

	# download CNS11643中文標準交換碼全字庫（簡稱全字庫）
	# 正楷體、正宋體
	# TW-Kai, TW-Sung
	wget https://www.cns11643.gov.tw/opendata/Fonts_Kai.zip
fi

if [ -f "Fonts_Kai.zip" ] ; then
    # let's hash it~
    # but we don't have offical sha1sum file Orz
    hash=$(sha1sum Fonts_Kai.zip | cut -d ' ' -f 1)
    echo -e "\n The SHA1 value of Fonts_Kai.zip is \n"
    echo -e "\t>>>>> $hash <<<<<\n"

    # unzip
    unzip Fonts_Kai.zip -d Open_Data
fi

# ---------------------------
# 安裝
# ---------------------------

# check zip file download and upzip succefully
if [ ! -d "Open_Data/" ] ; then
	echo -e "\n\n"
	echo -e "\a========= The font file went wrong! Please try again later. =========\n"
	exit 1
fi

# copy fonts to ~/.fonts
if [ -d "Open_data/Fonts/" ] ; then
    cp -i Open_Data/Fonts/*.ttf $HOME/.fonts
fi
cp -i Open_Data/*.ttf $HOME/.fonts

# refresh fonts cache
sudo fc-cache -fv

# remove zip and unzip dir
rm Open_Data.zip
rm Fonts_Sung.zip
rm Fonts_Kai.zip
rm -r Open_Data/

# finally
echo -e "\n\n"
echo -e "============== This is the end of script. ============== \n"
