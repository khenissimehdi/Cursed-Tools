#!/bin/bash

IP=$1
OUTDIR="./results/$IP"
mkdir -p $OUTDIR

echo "[*] Target: $IP"
echo "[*] Output: $OUTDIR"

feroxbuster -u http://$IP -o $OUTDIR/feroxbuster.txt &
gobuster dir -u http://$IP -w /usr/share/wordlists/dirb/common.txt -o $OUTDIR/gobuster.txt &
nmap -p- -Pn $IP --min-rate 10000 -oN $OUTDIR/nmap.txt &
rustscan -a $IP -r 1-65535 --ulimit 2000 --timeout 2000 &

echo "After running this stop, analyse and try build your next attack path!"