#!/bin/bash
mkdir -p mass recon
cd mass
echo "[=======================================================================]"
printf "\n${yellow} Downloading subs with wget \n\n"


echo "[=======================================================================]"

wget -i ~/list.txt &> /dev/null

printf "\n${yellow} UNZIPPING \n\n"
unzip '*.zip' &> /dev/null
echo "[=======================================================================]"

printf "\n${red} Running Httpx \n\n"

cat *.txt | ~/go/bin/./httpx -t 5000 -o ~/recon/live.txt  &> /dev/null

printf "\n${red} Result saved in 'recon/live.txt' \n\n"
echo "[=======================================================================]"
cd ~
printf "\n${yellow} scannig with nuclei \n\n"
echo "[=======================================================================]"
~/go/bin/./nuclei -list recon/live.txt -t ~/nuclei-templates/masscan -o recon/nuclei.txt 
echo "[=======================================================================]"
rm -rf mass 
