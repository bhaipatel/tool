#!/bin/sh
filename=$1
mkdir -p recon

while read line; do
        
        
        echo " finding subdomais for $line "
       
        ~/tools/enumsub.sh $line $line.txt &> /dev/null
         
        echo "scaning with nuclei"
       
        ~/go/bin/./nuclei -list $line.txt -t ~/nuclei-templates/masscan -o recon/$1takeover.txt






done < $filename
#./sudomainTakeover.sh subs.txt
