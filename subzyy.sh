#!/bin/sh
filename=$1
mkdir -p takeovers

while read line; do
        
        
        echo "subfinder"
        ~/go/bin/./subfinder -d $line -o $line.txt

        echo "Assetfinder"
        ~/go/bin/./assetfinder --subs-only $line | tee -a $line.txt
        sort -u $line.txt -o $line.txt
        
        echo "probing subdomains "
        cat $line.txt | ~/go/bin/./httpx -t 5000 -o $line.txt 
         
        echo "scaning with nuclei"
       
        ~/go/bin/./nuclei -list $line.txt -t ~/takeovertemp -o takeovers/$1takeover.txt






done < $filename
#./sudomainTakeover.sh subs.txt
