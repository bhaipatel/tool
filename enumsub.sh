#!/bin/bash


domain=$1

enum_sub(){

curl -s "https://jldc.me/anubis/subdomains/"$domain | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" >> main.txt
~/go/bin/./assetfinder -subs-only $domain -silent | tee main.txt
~/go/bin/./subfinder -d $domain| tee main.txt >> main.txt
~/go/bin/./amass enum -d $domain -passive| tee main.txt >> main.txt
cat main.txt | sort -u | tee $2
}
enum_sub
