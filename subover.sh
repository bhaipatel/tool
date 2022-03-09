#!/bin/sh
filename=$1
while read line; do
        echo "Sublist3r"
        ~/go/bin/./subfinder -d $line -o $line.txt
        echo "Assetfinder"
  ~/go/bin/./assetfinder --subs-only $line | tee -a $line.txt		
        sort -u $line.txt -o $line.txt        
        
    cat $line.txt | ~/go/bin/./httpx -t 5000 -o $line.txt


       echo "Subjack"
     ~/go/bin/./subjack -w $line.txt -t 1000 -o $1takeover.txt
done < $filename
#./sudomainTakeover.sh subs.txt
