iPXE build environment
==============================

docker isolated, debian based, iPXE build environment

Usage
------------------------------

Just run `build.sh` to trigger the build - this will invoke the following procedures:

1. build the docker image `pxe-build` which installs the toolchain and clones the official [iPXE repository](http://git.ipxe.org/ipxe.git)
2. executes the helper script `ipxebuild.sh` within a temporary container context based on `pxe-build`
3. the helper script triggers `make` as well as copies the binary to `target/` dir via bind mount

thats it! ;)


Config
------------------------------

* `ipxebuild.sh` - configure platform + targets + build options
* `ipxe.conf` - the [embedded iPXE script](http://ipxe.org/embed)

License
------------------------------

**ipxe-build** is OpenSource and licensed under the Terms of [GNU General Public Licence v2](LICENSE.md). You're welcome to [contribute](CONTRIBUTE.md)!