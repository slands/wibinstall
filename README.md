# winbinstall

Debian live build environment to build WIB install ISOs

# commands

```
docker run -it --privileged --rm -v $(pwd):/wibinstall -w /wibinstall slands/wibinstall
lb clean
[copy WIB files]
lb build
```