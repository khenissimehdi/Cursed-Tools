#!/bin/bash

IP=$1
OUTDIR="./results/$IP"
mkdir -p $OUTDIR

echo "[*] Target: $IP"
echo "[*] Output: $OUTDIR"

feroxbuster -u http://$IP -o $OUTDIR/feroxbuster.txt -x php
gobuster dir -u http://$IP -w /usr/share/seclists/Discovery/Web-Content/big.txt  -x .php -t 300 -o $OUTDIR/gobuster.txt

echo "After running this stop, analyse and try build your next attack path!"
echo "Maybe change the commands in some ways to go deeper into your analysis"