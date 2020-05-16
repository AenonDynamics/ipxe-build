iPXE build environment
==============================

docker isolated, debian based, iPXE build environment

Usage
------------------------------

Just run `build.sh` to trigger the build - this will invoke the following procedures:

1. build the docker image `pxe-build` which installs the toolchain and clones the Aenon Dynamics [iPXE repository](https://github.com/AenonDynamics/ipxe)
2. executes the helper script `ipxebuild.sh` within a temporary container context based on `pxe-build`
3. the helper script triggers `make` as well as copies the binary to `target/` dir via bind mount

thats it! ;)

Features
------------------------------

* Easy embed custom ipxe configuration
* Add custom brandings

Usage
------------------------------

```bash
# standard build - config has to be provided as external file during boot
./build

# embedded config
./build ipxe.conf
```

Config
------------------------------

* `ipxebuild.sh` - configure platform + targets + build options
* `ipxe.conf` - [embedded iPXE script demo](http://ipxe.org/embed)
* `config/branding.h` - custom branding/text
* `config/general.h` - features


License
------------------------------

**ipxe-build** is OpenSource and licensed under the Terms of [GNU General Public Licence v2](LICENSE.md). You're welcome to [contribute](CONTRIBUTE.md)!