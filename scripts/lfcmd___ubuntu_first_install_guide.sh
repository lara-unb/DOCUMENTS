#!/bin/bash

# 
# => THIS SCRIPT WILL ASK YOU TO INSTALL A SERIES OF 
# LINUX APPS THAT I BELIEVE TO BE IMPORTANT.
# => PACKAGES WONT BE INSTALLED WITHOUT YOUR APPROVAL
# => When running this script w/ no root permission, 
#    you find the packages vs (and if it is already installed)
#  
#
# AUTHOR:  Luis Felipe C. Figueredo
# EMAIL:   lfc.figueredo@gmail.com
# DATE:    07 / 2015
#
# 
#
#==========================================================
#
#            LISTA DE PACKS 
# (FIQUE LIVRE PARA ALTERAR A SUA VONTADE, APENAS VERIFIQUE A EXISTÊNCIA DO PACOTE SE FOR ADICIONAR)
#
#==========================================================
# PACK 1: [ System Wide ] 
varpack1="synaptic terminator konsole rar unrar unity-tweak-tool virtualbox arandr";
# PACK 2: [ Image Editors ] 
varpack2="inkscape gimp kolourpaint4 xsane shotwell";
# PACK 3: [ Sound/Video Editors ] 
varpack3="amarok brasero vlc pitivi openshot";
# PACK 4: [ Document/tex editors ] 
varpack4="kate anjuta geany kile texmaker lyx okular";
varpack4extras="texlive texlive-publishers texlive-metapost texlive-science texlive-humanities texlive-generic-extra texlive-lang-arabic texlive-lang-cyrillic texlive-lang-greek texlive-lang-all texlive-lang-portuguese texlive-fonts-extra texlive-fonts-extra-doc texlive-math-extra texlive-plain-extra texlive-latex-extra texlive-xetex texlive-latex3 texlive-publishers";
# PACK 5: [ Internet apps ] 
varpack5="chromium-browser konqueror filezilla skype adobe-flashplugin";
# PACK 6: [ Python apps ] 
#$varpack6="";  
# PACK NOT READY YET
#==========================================================




chr () { 
    [ "$1" -lt 256 ] || return 1 
    printf "\\$(printf '%03o' "$1")" 
}
colorred='\033[0;31m'
colorcyan='\033[0;36m'
colorlblue='\033[1;34m'
coloryellow='\033[1;33m'
colorblue='\033[0;34m'
colorgreen='\033[0;32m'
colororange='\033[0;33m'
colornocolor='\033[0m'

corbasic=$colorcyan;
cormaintext=$coloryellow;
corwarning=$colororange;
corokay=$colorgreen;
cornopack=$colorred;

printbarra="==============";
printbarradot="[========= . . . ";
printbarrafull="["$printbarra$printbarra$printbarra$printbarra"]"; 
echo -e $corbasic; chr 10;  echo $printbarrafull; echo $printbarradot; 
echo $printbarradot "LFcmds . . Let's have some Ubuntu Fun"; 
echo $printbarradot; 
echo $printbarradot "The script will automatically install"; 
echo "[=========       several packs of important ubuntu softwares."
echo $printbarradot; 
echo $printbarradot "Remember to run as sudo (also, this may take a while)";
if [ "$(id -u)" != "0" ]; then
   echo $printbarradot;    
   echo -e $corbasic$printbarradot $corwarning "*** [ You are not root! ]";
   echo -e $corbasic$printbarradot $corwarning "*** [ Running in simulation-only mode ]"; 
   echo -e $corbasic$printbarradot $corwarning "*** [ No package will be installed! ]" $corbasic;
fi
echo $printbarradot; 
printf $printbarradot; printf " . . . "; printf $corwarning; chr 42; chr 42; chr 42; chr 32; chr 70; chr 105; chr 103; chr 117; chr 101; chr 114; chr 101; chr 100; chr 111; chr 96; chr 115; chr 32; chr 98; chr 97; chr 115; chr 104; chr 32; chr 115; chr 99; chr 114; chr 105; chr 112; chr 116; chr 10;  
echo -e $corbasic$printbarradot;

echo -e $corbasic$printbarrafull; 
echo ". . .";
echo -e ". . .$cormaintext Please choose which packs that you'd like to install (y/n)" $corbasic;
#
#
#   MENU
#==================
#######
echo ". . .";
chr 9; printf $cormaintext; printf "1) Install system pack: [$varpack1] (y/n)? "; printf $colornocolor
read -n1  varResposta;  echo;
[[ $varResposta = [yY] ]] && varInstallPackSystem="1" || varInstallPackSystem="0";
#######
echo -e $corbasic". . ." $cormaintext;
chr 9; printf "2) Install image editor pack: [inkscape] [gimp] [kolourpaint] [xsane] [shotwell] (y/n)? "; printf $colornocolor
read -n1  varResposta;  echo;
[[ $varResposta = [yY] ]] && varInstallPackImage="1" || varInstallPackImage="0";
#######
echo -e $corbasic". . ." $cormaintext;
chr 9; printf "3) Install sound/video editor pack: [amarok] [brasero] [vlc] [pitivi] [openshot] (y/n)? "; printf $colornocolor
read -n1  varResposta;  echo;
[[ $varResposta = [yY] ]] && varInstallPackVideo="1" || varInstallPackVideo="0";
#######
echo -e $corbasic". . ." $cormaintext;
chr 9; printf "4) Install document/tex editor pack: [kate] [anjuta] [geany] [kile] [texmaker] [lyx*] [okular] [texlive with different packs] (y/n)? "; printf $colornocolor
read -n1  varResposta;  echo;
[[ $varResposta = [yY] ]] && varInstallPackDocsTex="1" || varInstallPackDocsTex="0";
#######
echo -e $corbasic". . ." $cormaintext;
chr 9; printf "5) Install internet pack: [chromium-browser] [konqueror] [filezilla] [skype] [Adobe Flash Plugin] (y/n)? "; printf $colornocolor
read -n1  varResposta;  echo;
[[ $varResposta = [yY] ]] && varInstallPackInternet="1" || varInstallPackInternet="0";
#######
echo -e $corbasic". . ." $cormaintext;
chr 9; printf "6) Install python programmer pack: [pip] [pip: python] [pip: ipython] [pip: spider] (y/n)? "; printf $colornocolor
read -n1  varResposta;  echo;
[[ $varResposta = [yY] ]] && varInstallPackPython="1" || varInstallPackPython="0";
#
# CONFIRM:
#==================
#
echo -e $corbasic;
echo $printbarrafull; 
echo $printbarradot "Confirm the installation packs: ";  printf "*** "; printf $corwarning;
[ $varInstallPackSystem = 1 ]   && printf " (1-system) ";
[ $varInstallPackImage = 1 ]    && printf " (2-Image) ";
[ $varInstallPackVideo = 1 ]    && printf " (3-Video) ";
[ $varInstallPackDocsTex = 1 ]  && printf " (4-Docs/Tex) ";
[ $varInstallPackInternet = 1 ] && printf " (5-Internet) ";
[ $varInstallPackPython = 1 ]   && printf " (6-Python) "; chr 10;
echo -e $corbasic$printbarradot $cormaintext"Is that correct (y/n)? "  $colornocolor;
read -n1  varResposta;  echo -e $corbasic;
[[ $varResposta = [yY] ]] && varInstallCONFIRM="1" || varInstallCONFIRM="0";
if [ ! $varInstallCONFIRM == 1 ]; then 
   echo $printbarradot; 
   echo -e $printbarradot $corwarning "INSTALLATION NOT CONFIRMED. Leaving script..."; echo -e $corbasic $printbarradot $corwarning "Thank you! "; 
echo -e $corbasic $printbarrafull $colornocolor; 
echo;
   exit 1 
fi
#
#
#
echo -e $corbasic;
echo $printbarrafull; 
echo $printbarradot "INSTALLATION BEGINNING: "; 
echo -e $cornocolor;
#
#
# INSTALLATION [PACK 1]: 
#==================
#
if [ $varInstallPackSystem == 1 ]; then 
   echo $printbarradot; echo $printbarradot "(1) Installing system pack: [synaptic] [terminator] [konsole] [rar && unrar] [unity-tweak-tool] [virtualbox]"; echo;
if [ "$(id -u)" != "0" ]; 
   then echo "Sim mode only (no pack installed)"; 
   else apt-get install -y $varpack1;
fi
# 
echo ; 
fi
#
# INSTALLATION [PACK 2]: 
#==================
#
if [ $varInstallPackImage == 1 ]; then 
   echo $printbarradot; echo $printbarradot "(2) Installing image editor pack: [inkscape] [gimp] [kolourpaint] [xsane] [shotwell]"; echo;
if [ "$(id -u)" != "0" ]; 
   then echo "Sim mode only (no pack installed)"; 
   else apt-get install -y $varpack2;
fi
# 
echo ; 
fi
#
#
# INSTALLATION [PACK 3]: 
#==================
#
if [ $varInstallPackVideo == 1 ]; then 
   echo $printbarradot; echo $printbarradot "(3) Installing sound/video editor pack: [amarok] [brasero] [vlc] [pitivi] [openshot]"; echo;
if [ "$(id -u)" != "0" ]; 
   then echo "Sim mode only (no pack installed)"; 
   else apt-get install -y $varpack3;
fi
echo ; 
fi
#
# INSTALLATION [PACK 4]: 
#==================
#
if [ $varInstallPackDocsTex == 1 ]; then 
   echo $printbarradot; echo $printbarradot "(4) Installing document/tex editor pack: [kate] [anjuta] [geany] [kile] [texmaker] [lyx*] [okular] [texlive with different packs]"; echo;
if [ "$(id -u)" != "0" ]; 
   then echo "Sim mode only (no pack installed)"; 
   else 
	apt-get install -y $varpack4; 
	apt-get install -y $varpack4extras;
fi
echo ; 
fi
#
# INSTALLATION [PACK 5]: 
#==================
#
if [ $varInstallPackInternet == 1 ]; then 
   echo $printbarradot; echo $printbarradot "(5) Installing internet pack: [chromium-browser] [konqueror] [filezilla] [skype] [Adobe Flash Plugin]"; echo;
if [ "$(id -u)" != "0" ]; 
   then echo "Sim mode only (no pack installed)"; 
   else apt-get install -y $varpack5
fi
# 
echo ; 
fi
#
# INSTALLATION [PACK 6]: 
#==================
#
if [ $varInstallPackPython == 1 ]; then 
   echo $printbarradot; echo $printbarradot "(6) Installing python programmer pack: [pip] [pip: python] [pip: ipython] [pip: spider]"; echo;
echo "*** INSTALLATION FOR PIP AND PYTHON NOT READY YET!"
echo ; 
fi
#
#
#
#
# PRINT PACKAGE RESULT:
#==================
#
#

echo -e $corbasic;
echo $printbarrafull; 
echo -e $printbarradot "PRINTING PACKAGE INFORMATION: " $corbasic; 
#
#
# VERIFICATION [PACK 1]: 
#==================
if [ $varInstallPackSystem == 1 ]; then 
     echo $printbarradot; echo $printbarradot "[ PACK 1 ]: System Pack"; echo $printbarradot;
     for varinstalledpackage in $varpack1
     do
        if [ $(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}') == "(none)" ]; then printf $colorred; else printf $colorgreen; fi
        echo "*** [$varinstalledpackage] Version Installed: "$(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}');
     done   
fi
#
# VERIFICATION [PACK 2]: 
#==================
if [ $varInstallPackImage == 1 ]; then 
     echo -e $corbasic$printbarradot; echo $printbarradot "[ PACK 2 ]: Image Editors Pack"; echo $printbarradot;
     for varinstalledpackage in $varpack2
     do
        if [ $(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}') == "(none)" ]; then printf $colorred; else printf $colorgreen; fi
        echo "*** [$varinstalledpackage] Version Installed: "$(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}');
     done   
fi
#
# VERIFICATION [PACK 3]: 
#==================
if [ $varInstallPackVideo == 1 ]; then 
     echo -e $corbasic$printbarradot; echo $printbarradot "[ PACK 3 ]: Sound/Video Editors Pack"; echo $printbarradot;
     for varinstalledpackage in $varpack3
     do
        if [ $(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}') == "(none)" ]; then printf $colorred; else printf $colorgreen; fi
        echo "*** [$varinstalledpackage] Version Installed: "$(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}');
     done   
fi
#
# VERIFICATION [PACK 4]: 
#==================
if [ $varInstallPackDocsTex == 1 ]; then 
     echo -e $corbasic$printbarradot; echo $printbarradot "[ PACK 4 ]: Docs/Tex Editors Pack"; echo $printbarradot;
     for varinstalledpackage in $varpack4
     do
        if [ $(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}') == "(none)" ]; then printf $colorred; else printf $colorgreen; fi
        echo "*** [$varinstalledpackage] Version Installed: "$(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}');
     done   
     echo "*** ps.: The texlive packages will not be displayed because there are too many packs to show (please use apt-cache policy pack_name to see details about specific package".
fi
#
# VERIFICATION [PACK 5]: 
#==================
if [ $varInstallPackInternet == 1 ]; then 
     echo -e $corbasic$printbarradot; echo $printbarradot "[ PACK 5 ]: Internet Pack"; echo $printbarradot;
     for varinstalledpackage in $varpack5
     do
        if [ $(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}') == "(none)" ]; then printf $colorred; else printf $colorgreen; fi
        echo "*** [$varinstalledpackage] Version Installed: "$(apt-cache policy $varinstalledpackage | awk '/Installed:/ {print $2}');
     done   
fi
#
# VERIFICATION [PACK 6]: 
#==================
if [ $varInstallPackPython == 1 ]; then 
        echo -e $corbasic$printbarradot; echo $printbarradot "[ PACK 6 ]: Python Pack";
	echo "*** ps.: It is not ready yet".
fi
#
echo -e $colornocolor;
echo ;
echo ;





