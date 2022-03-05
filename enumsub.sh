#!/bin/bash


domain=$1

enum_sub(){

curl -s "https://jldc.me/anubis/subdomains/"$domain | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" >> main.txt
~/go/bin/./assetfinder -subs-only $domain -silent | tee main.txt
~/go/bin/./subfinder -d $domain|anew main >> main
~/go/bin/./amass enum -d $domain -passive|  main >> main

sort -u  main >> main
}
enum_sub
